#! /usr/bin/env python3

# Copyright 2020 Barry Muldrey and the Hilas PDK Authors
#
# This file is part of HILAS.
#
# HILAS is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, version 3 of the License.
#
# HILAS is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with HILAS.  If not, see <https://www.gnu.org/licenses/>.
#
# Licensed under the Lesser General Public License, Version 3.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https://www.gnu.org/licenses/lgpl-3.0.en.html
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: LGPL-3.0

import argparse
import os
import re
import shlex
import subprocess
import tempfile
import shutil
import jinja2
import yaml

from yamllint import cli as yamllintcli
from collections import OrderedDict
from sys import stderr as STDERR
from pexpect.replwrap import REPLWrapper
from pathlib import Path

#######################################################################################
PDK_VARIANT = 'sky130_hilas_sc'
###########################################################################################

THIS_DIR = Path(__file__).parent
HILAS_PDK_ROOT = THIS_DIR.parent

TECH_ROOT = HILAS_PDK_ROOT / 'libs.tech'
REF_ROOT = HILAS_PDK_ROOT / 'libs.ref'
CELL_DATA_FILE = REF_ROOT / PDK_VARIANT / 'CELL_INDEX.yml'
MAIN_README = HILAS_PDK_ROOT / 'README.md'

TEMPLATE_PATH = HILAS_PDK_ROOT / 'scripts' / 'templates'
LIB_CELL_TEMPLATE = 'min_inverter.template.lib'
LIB_HEAD_TEMPLATE = 'head.template.lib'
V_CELL_TEPLATE = 'cell.template.v'
MD_CELL_TEMPLATE = 'cell_details.template.md'
MD_LIB_TEMPLATE = 'lib_summary.template.md'
README_HEADER = HILAS_PDK_ROOT / 'scripts' / 'templates' / 'README.md'

CELL_CATEGORIES = ['standard-cells',
                   'primitive-cells',
                   'test-cells',
                   'component-cells',
                   'cells-to-be-sorted']

NO_SYNTH_FILE = TECH_ROOT / 'openlane' / 'no_synth.cells'

LIB_PATH = {
    'temp_lef': REF_ROOT / PDK_VARIANT / '_templef',
    'cell_summary': REF_ROOT / PDK_VARIANT / 'CELL_SUMMARY.md',
    'cell_details': REF_ROOT / PDK_VARIANT / 'CELL_DETAILS.md'
}
for name in ['cdl', 'doc', 'gds', 'lef', 'lib', 'mag', 'png', 'spice_ext', 'spice_hand', 'schem', 'techlef', 'verilog', 'xschem']:
    LIB_PATH.update({name: REF_ROOT / PDK_VARIANT / name})

with open(THIS_DIR / 'templates' / 'license_head.txt', 'r') as f:
    LICENSE_HEAD = f.read() + '\n'


class Conventions:
    CELL_PREFIX = 'sky130_hilas_'
    PG_PIN_NAMES = {'VPB': [],  # net names appearing in the lists will be converted to the key
                    'VPWRIN': [],
                    'LOWLVPWR': [],
                    'VGND': ['GND'],
                    'VPWR': ['VDD'],
                    'VNB': [],
                    'KAPWR': []
                    }

    def __init__(self):
        self._pg_pin_map={item: parent for parent,ll in self.PG_PIN_NAMES.items() for item in ll}

    def pg_pin_lookup(self, net):
        if net in self._pg_pin_map:
            return self._pg_pin_map[net]
        else:
            return None

    def net_name(self, net):
        oname = str(net)

        if '+' in net:
            net = net.replace('+', 'P')

        if '-' in net:
            net = net.replace('-', 'N')

        if net.upper() != net:
            net = net.upper()

        pnet = self.pg_pin_lookup(net)
        if pnet:
            net = pnet

        if net != oname:
            return net
        else:
            return None


CONVENTIONS=Conventions()


class StructuredTextFile:

    def __init__(self, path):
        self.path = Path(path)
        with open(path, 'r') as f:
            self.c = f.read()

    def __getattr__(self, item):
        return getattr(self.path, item)

    def _save(self, filename=''):
        if not filename:
            filename = self.path
        with open(filename, 'w') as f:
            f.write(self.c)

    @property
    def file(self):
        return self.path


class XschemLibrary(dict):

    def __init__(self, lib_root):
        super().__init__({m.stem: XschemCircuit(m, lib_root) for m in lib_root.glob('**/*.sym')})
        self.root = Path(lib_root)

    def __contains__(self, item):
        if isinstance(item, Path):
            item = str(item.relative_to(self.root))
        return len(list(self.root.glob('**/'+item))) != 0
        # return item in [str(x.path.relative_to(self.root)) for x in self.symbols]

    def get_symbol(self, name):
        return self[name].symbol

    def get_schematic(self, name):
        return self[name].schematic

    def rename_pin(self, module, old_name, new_name):
        self[module].rename_pin(old_name, new_name)

    def _rename_module(self, from_name, to_name):

        for cir in self:

            sch = cir.schematic
            needs_save = False
            stale_file = None

            if sch.name == from_name:
                stale_file = sch.path
                sch._set_names(to_name)
                needs_save = True

            if from_name + '.sym' in sch.refs:
                sch._rename_refs(from_name, to_name)
                needs_save = True

            if needs_save:
                sch._save()
                if stale_file:
                    os.remove(stale_file)

            sym = cir.sybol
            needs_save = False
            stale_file = None

            if sym.name == from_name:
                stale_file = sym.file
                sym._set_names(to_name)
                needs_save = True

            # if from_name + '.sym' in sym.refs:
            #     sym._rename_refs(from_name, to_name)
            #     needs_save = True

            if needs_save:
                sym._save()
                if stale_file:
                    os.remove(stale_file)

    def check(self):
        for m in xschem_lib.values():
            m.check_names()

        message = []

        mc = []
        for cn, c in cd.standard_cells.items():
            if c.long_name + '.sym' not in self:
                mc.append(c)

        if mc:
            message.append(
                'The following cells are defined in the Cell Index YAML, but are missing symbols in the Xschem library:')
            for mmc in mc:
                message.append('    ' + mmc.long_name)

        for cir in self.values():
            if cir.schematic:
                sch = cir.schematic
            else:
                continue
            mm = []
            for rr in sch.refs:
                if rr not in self \
                        and not sch.path.parent / rr in self \
                        and not rr == 'devices' \
                        and not re.search(r'^devices/\w+[.]sym', rr, re.M) \
                        and not re.search(r'^sky130_fd_pr/\w+[.]sym', rr, re.M):
                    mm.append(rr)

            if mm:
                message.append(stylize_head())
                message.append('Schematic {} is missing the following refs:'.format(sch))
                for mmm in mm:
                    message.append('    {}'.format(mmm))

        for cir in self.values():
            if not cir.schematic:
                continue
            sch_pins = cir.schematic.pins
            sym_pins = cir.symbol.pins

            sch_only = set(sch_pins.keys()) - set(sym_pins.keys())
            sym_only = set(sym_pins.keys()) - set(sch_pins.keys())
            if not sch_only and not sym_only:
                continue
            else:  ## mismatch
                message.append(stylize_head())
                message.append('xschem symbol \'{}\' missing the following pins:'.format(cir.name))
                for pin in sch_only:
                    message.append('    {}'.format(pin))
                message.append('xschem schematic \'{}\' missing the following pins:'.format(cir.name))
                for pin in sym_only:
                    message.append('    {}'.format(pin))

        if message:
            warn(stylize_head('Xschem Consistency Check'))
            warn('\n'.join(message))
            warn(stylize_head())


class XschemCircuit:
    def __init__(self, symbol_file, library_root=None):
        assert symbol_file.is_file()
        self.lib_root = library_root
        self.symbol = XschemSymbol(symbol_file, library_root)
        self.name = self.symbol.name
        try:
            self.schematic = XschemSchematic(symbol_file.with_suffix('.sch'), library_root)
        except FileNotFoundError:
            self.schematic = None

    def rename_pin(self, old_name, new_name):
        self.symbol.rename_pin(old_name, new_name)
        if self.schematic:
            self.schematic.rename_net(old_name, new_name)
            self.schematic.rename_pinname(old_name, new_name)

    def check_names(self):
        self.symbol.check_pin_names()
        if self.schematic:
            self.schematic.check_net_names()

    def _save(self):
        self.symbol._save()
        self.schematic._save()


class XschemSchematic(StructuredTextFile):

    def __init__(self, schematic_file, lib_root='/'):
        super().__init__(schematic_file)
        self.name = schematic_file.stem
        self.refs = {}
        self._get_refs()
        if lib_root:
            self.lib_root = Path(lib_root)

    def __str__(self):
        return str(self.path.relative_to(self.lib_root))

    def _get_refs(self):
        for line in self.c.splitlines():
            if line.startswith('C'):
                refpath = re.search(r'^C {(.*?)}.*', line).group(1)
                if refpath not in self.refs:
                    self.refs[refpath] = 0
                self.refs[refpath] += 1

    def _rename_refs(self, oldname, newname):
        c = self.c.splitlines()
        touched = False
        for i, line in enumerate(c):
            match = re.search(r'^C {(.*?)}.*', line)
            if match and match.group(1) == oldname +'.sym':
                newline = line.replace(oldname+'.sym', newname+'.sym')
                c[i] = newline
                touched = True
        if touched:
            self.c = '\n'.join(c)

    def _set_names(self, name):
        if not name.endswith('.sch'):
            name += '.sch'
        self.name = name.split('.sch')[0]
        self.path = self.path.with_name(name)

    @property
    def pins(self):
        pins = {}
        pinlist = re.findall(r'^C\s+{(?:.*[/])?(?:ipin|opin|iopin)[.]sym}.*?{(.*)}', self.c, re.M)
        for string in pinlist:
            pairs = dict(tuple(x.split('=')) for x in string.split())
            pins.update({pairs['lab']: {k: v for k, v in pairs.items() if k != 'lab'}})
        return pins

    @property
    def nets(self):
        listonets = re.findall(r'^.*{.*\s*lab=(\w+)\s*.*}.*$', self.c, re.M)
        return list(set(listonets))

    def rename_net(self, old_name, new_name):
        mp1 = r'(^C\s+{{.*?}}.*?{{.*\s*lab=){}(\s*.*}})'.format(old_name)
        self.c = re.sub(mp1, r'\1{}\2'.format(new_name), self.c, flags=re.M)

        mp3 = r'(^N\s+.*?{{.*\s*lab=){}(\s*.*}})'.format(old_name)
        self.c = re.sub(mp3, r'\1{}\2'.format(new_name), self.c, flags=re.M)

    def rename_pinname(self, old_name, new_name):
        mp2 = r'(^C\s+{{.*?}}.*?{{.*\s*name=){}(\s*.*}})'.format(old_name)
        self.c = re.sub(mp2, r'\1{}\2'.format(new_name), self.c, flags=re.M)

    def check_net_names(self):
        write = False
        for net in self.nets:
            fnet = CONVENTIONS.net_name(net)
            if fnet:
                self.rename_net(net, fnet)
                warn('Found net in \'{}\' whose name should probably be corrected: \'{}\'->\'{}\''.format(
                    self.file.name, net, fnet))

                write = True

        for pin_name, pin_attrs in self.pins.items():
            fnet = CONVENTIONS.net_name(pin_attrs['name'])
            if fnet:
                self.rename_pinname(pin_attrs['name'], fnet)
                warn('Found pin name in \'{}\' whose name should probably be corrected: \'{}\'->\'{}\''.format(
                    self.file.name, pin_attrs['name'], fnet))
                write = True

        if write:
            if args.no:
                pass
            elif args.yes or confirm(
                    'Would you like to write the net-name-corrected file {} ?'.format(self.file.name), False):
                self._save()
                warn('wrote capitalized-net-corrected version of {}'.format(self.file.name))


class XschemSymbol(StructuredTextFile):

    def __init__(self, symbol_file, lib_root='/'):
        super().__init__(symbol_file)
        self.name = symbol_file.stem
        if lib_root:
            self.lib_root = lib_root
        else:
            self.lib_root = '/'

    def _set_names(self, name):
        if not name.endswith('.sym'):
            name += '.sym'
        self.name = name.split('.sym')[0]
        self.path = self.path.with_name(name)

    def rename_pin(self, old_name, new_name):
        mp1 = r'(B\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+{{\s*name=){}(\s+.*)'.format(old_name)
        mp2 = r'(T\s+{{){}(}}.*)'.format(old_name)
        self.c = re.sub(mp1, r'\1{}\2'.format(new_name), self.c, flags=re.M)
        self.c = re.sub(mp2, r'\1{}\2'.format(new_name), self.c, flags=re.M)

    def check_pin_names(self):
        write = False

        for pin in self.pins:
            fpin = CONVENTIONS.net_name(pin)
            if fpin:
                self.rename_pin(pin, fpin)
                write = True

        if write:
            if args.no:
                pass
            elif args.yes or confirm(
                    'Would you like to write the capitalized-net-corrected file {} ?'.format(self.file.name), False):
                self._save()
                warn('wrote capitalized-net-corrected version of {}'.format(self.file.name))

    @property
    def pins(self):
        pins = {}
        pinlist = re.findall(r'^B \S+ \S+ \S+ \S+ \S+ {\s*(.*?)\s*}', self.c, re.M)
        for string in pinlist:
            pairs = dict(tuple(x.split('=')) for x in string.split())
            pins.update({pairs['name']: {k:v for k,v in pairs.items() if k!='name'}})
        return pins


class CellInfo(dict):
    def __init__(self, name, prop_dict):
        super().__init__(prop_dict)
        if name.startswith(CONVENTIONS.CELL_PREFIX):
            self['short_name'] = name.split(CONVENTIONS.CELL_PREFIX)[1]
            self['long_name'] = name
        else:
            self['short_name'] = name
            self['long_name'] = CONVENTIONS.CELL_PREFIX + name

    # @property
    # def short_name(self):
    #     return self['short_name']
    #
    # @property
    # def long_name(self):
    #     return self['long_name']

    def __getattr__(self, item):
        return self[item]


class LibraryInfo(OrderedDict):

    def __init__(self, yaml_file):
        try:
            with open(yaml_file, 'r') as f:
                yaml_dict = yaml.safe_load(f)

        except:
            edie('Could not load {}'.format(CELL_DATA_FILE))

        cd = OrderedDict()
        for cat in CELL_CATEGORIES:
            cd.update({cat: OrderedDict()})
            sorted_keys = sorted(yaml_dict[cat].keys())
            for k in sorted_keys:
                if k == 'description':
                    pass
                else:
                    cell = CellInfo(k, yaml_dict[cat][k])
                    cd[cat].update({cell.long_name: cell})
        super().__init__(cd)

    @property
    def all_cells(self):
        return OrderedDict({cn: cell for cat, cells in self.items() for cn, cell in cells.items() if 'description' in cell})

    def by_category(self, category_name):
        return OrderedDict({cn: cell for cn, cell in self[category_name].items() if cn != 'description'})

    @property
    def standard_cells(self):
        return self.by_category('standard-cells')

    @property
    def component_cells(self):
        return self.by_category('component-cells')

    @property
    def primitive_cells(self):
        return self.by_category('primitive-cells')

    @property
    def test_cells(self):
        return self.by_category('test-cells')

    def by_name(self, cell_name):
        if cell_name.startswith(CONVENTIONS.CELL_PREFIX):
            pass
        else:
            cell_name = CONVENTIONS.CELL_PREFIX + cell_name
        try:
            return [cell for cat in self.values() for cn, cell in cat.items() if cn == cell_name][0]
        except IndexError:
            return None

    def check_yaml(self):
        all_cells = self.all_cells

        if len(all_cells) != len(set(list(all_cells.keys()))):
            dl = list(all_cells.keys())
            dd = list(set(dl))
            for c in dd:
                dl.remove(c)
            warn(stylize_head())
            warn('Found duplicate entries in {}:'.format(CELL_DATA_FILE.name))
            for f in dl:
                warn('    ' + str(f))
            warn(stylize_head())

        missing = []
        for cn, cell in self.standard_cells.items():
            if 'description' not in cell or cell['description'] is None or cell['description'] == '':
                missing.append(cn)

        if missing:
            warn(stylize_head())
            warn('The following standard cells are missing descriptions in the \'{}\'file:'.format(CELL_DATA_FILE.name))
            for mf in missing:
                warn('    ' + str(mf))
            warn(stylize_head())


class LefData(object):
    SIZE_REGEX = re.compile(r'^\s*SIZE\s+(\S+)\s+BY\s+(\S+)\s*;\s*$', re.MULTILINE)

    def __init__(self, lef_file):
        if isinstance(lef_file, Path) or (
                isinstance(lef_file, str) and '\n' not in lef_file and os.path.isfile(lef_file)):
            with open(lef_file, 'r') as f:
                self.c = f.read()
        else:
            self.c = lef_file

    @property
    def size(self):
        size = re.search(self.SIZE_REGEX, self.c)
        if size:
            return size.groups()
        else:
            return ('', '')

    @property
    def height(self):
        return self.size[1]

    @property
    def width(self):
        return self.size[0]

    @staticmethod
    def read_pin(pin_name, text_block):
        res = {}
        res.update({'name': pin_name.strip()})

        for line in text_block.split('\n'):
            if 'DIRECTION ' in line:
                res.update({'direction': line.split('DIRECTION')[1].strip().rstrip(';')})
            elif 'USE ' in line:
                res.update({'use': line.split('USE')[1].strip().rstrip(';')})
            elif 'ANTENNAGATEAREA' in line:
                res.update({'antenna_gate_area': line.split('ANTENNAGATEAREA')[1].strip().rstrip(';')})

        return res

    def get_cell(self, cell_name):
        return re.search(r'(^\s*MACRO {}[\n\s\S]*^\s*END {})'.format(cell_name, cell_name), self.c, re.MULTILINE).group(
            1)

    def cell_info(self, cell_name):
        cell_text = self.get_cell(cell_name)
        if not cell_text:
            return None

        pi = []

        for pinfo in re.findall(r'(^\s*PIN\s+(?P<name>\S*)\n(?:.*\n)*?\s*END\s+\2)', cell_text, re.MULTILINE):
            # found a pin
            pd = LefData.read_pin(pinfo[1], pinfo[0])
            pi.append(pd)
            # elif re.match('^\s*pg_pin \("(.*)"\)', line):
            #     # found a pg_pin
            #     pi.append(read_pg_pin(cc, i))
        return pi


class MagicLibrary(dict):
    def __init__(self, library_root):
        if isinstance(library_root, str):
            library_root = Path(library_root)
        if isinstance(library_root, Path):
            list_of_mag_files = library_root.glob('*.mag')
        elif isinstance(library_root, list):
            list_of_mag_files = library_root

        super().__init__({f.stem: MagicDesign(f) for f in list_of_mag_files})

    def __contains__(self, item):
        return item in [m.long_name for m in self.values()]

    def by_shortname(self, name):
        try:
            return [m for mname, m in self.items() if mname == name][0]
        except IndexError:
            return None

    def by_longname(self, name):
        try:
            return [m for _, m in self.items() if m.long_name == name][0]
        except IndexError:
            return None

    def by_file(self, file):
        try:
            return [m for name, m in self.items() if m.file == file][0]
        except IndexError:
            return None

    def rename_module(self, from_name, to_name):

        for mn, m in self.items():
            if m.long_name == from_name:
                continue
            m.rename_refs(from_name, to_name)

        targ = self.by_longname(from_name)
        if targ:
            targ.rename(to_name)

    def check(self):
        self.check_complete()
        self.check_depends()
        for m in magic_lib.values():
            m.check_port_names()

    def check_complete(self):
        message = []
        mc = []
        for cn, c in cd.all_cells.items():
            if c.long_name not in magic_lib:
                mc.append(c)

        if mc:
            message += ['The following cells are defined in the Cell Index YAML, but are missing in the magic library:']
            for mmc in mc:
                message += ['    ' + mmc.long_name]

        if message:
            warn(stylize_head())
            warn('\n'.join(message))

    def check_depends(self):

        # for mn, c in magic_lib.items():
        #     mm = []
        #     for rr in c.references:
        #         if rr not in magic_lib:
        #             mm.append(rr)
        #
        #     if mm:
        #         message += ['Magic design {} is missing the following refs:'.format(c.file)]
        #         for mmm in mm:
        #             message += ['    {}'.format(mmm)]

        missing = {}
        for m in self.values():
            deps = m.references
            if m.long_name in deps:
                # warn(stylize_head())
                warn('Cell \'{}\' contains instances of itself!'.format(m.long_name))
                warn(stylize_head())

            for d in deps:
                if not (LIB_PATH['mag'] / d).with_suffix('.mag').is_file():
                    if m.long_name in missing:
                        missing[m.long_name] += [d]
                    else:
                        missing.update({m.long_name: [d]})

        if missing:
            # warn(stylize_head())
            warn('Referenced (sub)cells missing from the /mag/ path:')
            for mf, clist in missing.items():
                warn('    {} is missing:'.format(mf))
                for cell in clist:
                    warn('        {}'.format(cell))

            warn(stylize_head())


class MagicDesign(StructuredTextFile):

    MAGIC_PIN_REGEX = re.compile(r'^\s*\wlabel\s+(\S+).*\s+(\S+)\s*\n\s*port\s+(\d+)\s+(.*)$', re.MULTILINE)
    CELL_REF_REGEX = re.compile(r'^\s?use (\w+)', re.MULTILINE)

    def __init__(self, mag_file):
        super().__init__(mag_file)
        self.long_name = mag_file.stem
        try:
            self.short_name = mag_file.stem.split(CONVENTIONS.CELL_PREFIX)[1]
        except:
            self.short_name = mag_file.stem

    @property
    def references(self):
        return list(set(re.findall(self.CELL_REF_REGEX, self.c)))

    @property
    def ports(self):
        match = re.findall(self.MAGIC_PIN_REGEX, self.c)
        return {item[1]: (item[0], item[2], item[3]) for item in match}

    def rename_net(self, old_name, new_name):
        self.c = re.sub(r'(\n\s*[fr]label\s+.*\s+){}\s*\n'.format(re.escape(old_name)),
                        r'\g<1>{}\n'.format(re.escape(new_name)), self.c, re.MULTILINE)

    def rename_port(self, old_name, new_name):
        self.rename_net(old_name, new_name)

    def rename(self, new_name):
        old_file = self.file
        new_file = self.file.with_name(new_name).with_suffix('.mag')
        self.file = new_file
        self.write_file()
        os.remove(old_file)

    def rename_refs(self, old_name, new_name):
        match_pref = r'^use '
        match_suff = r'\s*\w*\s*$'
        need_save = False
        match = re.search(match_pref + old_name + match_suff, self.c, re.MULTILINE)
        if match:
            self.c = re.sub(match_pref + old_name, 'use ' + new_name, self.c, flags=re.MULTILINE)
            self.write_file()

    # def write_file(self):
    #     with open(self.file, 'w') as f:
    #         f.write(self.c)

    @staticmethod
    def file2name(file):
        try:
            return str(file.stem.split(CONVENTIONS.CELL_PREFIX)[1])
        except:
            return str(file.stem)

    @staticmethod
    def name2file(name):
        if not name.startswith(CONVENTIONS.CELL_PREFIX):
            name = CONVENTIONS.CELL_PREFIX + name
        if not name.endswith('.mag'):
            name = name + '.mag'
        return LIB_PATH['mag'] / name

    def check_port_names(self):

        write = False

        for net in self.ports:
            fnet = CONVENTIONS.net_name(net)
            if fnet:
                warn('Found port in \'{}\' whose name should probably be corrected: \'{}\'->\'{}\''.format(
                    self.file,net,fnet))
                self.rename_net(net, fnet)
                write = True

        if write:
            if args.no:
                pass
            elif args.yes or confirm(
                    'Would you like to write the capitalized-net-corrected file {} ?'.format(self.file.name),
                    False):
                self._save()
                warn('wrote capitalized-net-corrected version of {}'.format(self.file.name))


class Magic:
    def __init__(self):
        self.p = None

    def newmagic(self):
        try:

            magicrcfile = os.getenv('MAGICRC')
            if not magicrcfile:
                ourrcfile = Path(TECH_ROOT) / 'magic' / 'sky130A.magicrc'
                if ourrcfile.is_file():
                    magicrcfile = str(ourrcfile)

            techfile = os.getenv('TECHFILE')
            if not techfile:
                ourtechfile = Path(TECH_ROOT) / 'magic' / 'sky130A.tech'
                if ourtechfile.is_file():
                    techfile = str(ourtechfile)

            print('starting Magic')
            odir = os.getcwd()
            os.chdir(LIB_PATH['mag'])

            self.p = REPLWrapper('magic -dnull -noconsole -rcfile "{}" -T "{}"'.format(
                magicrcfile, techfile),
                orig_prompt='%', prompt_change=None)

        except:
            edie('couldn\'t start Magic')

        finally:
            os.chdir(odir)

    def load(self, magic_file):
        try:
            magic_file = Path(magic_file).relative_to(LIB_PATH['mag'])
        except:
            edie('magic file: {} doesn\'t seem to be in the correct /mag/ path'.format(magic_file))
        result = ''
        result += self.p.run_command('drc off')
        result += self.p.run_command('load "{}" -force'.format(magic_file))
        result += self.p.run_command('drc off')
        return result

    def renew(self, source):
        if not self.p or not hasattr(self.p, 'child') or not self.p.child.isalive():
            self.newmagic()
        return self.load(source)

    def make_gds(self, source, target):
        result = self.renew(source)
        result += self.p.run_command('gds readonly true')
        result += self.p.run_command('gds rescale false')
        result += self.p.run_command('gds merge')
        result += self.p.run_command('gds flatten')
        result += self.p.run_command('gds write {}'.format(target))
        return result

    def make_lef(self, source):
        result = self.renew(source)
        result += self.p.run_command('lef write')
        # result += self.p.run_command('lef write')
        return result

    def make_spice(self, source, target):
        result = self.renew(source)
        result += self.p.run_command('extract do all')
        result += self.p.run_command('extract all')
        result += self.p.run_command('ext2spice lvs')
        # result += self.p.run_command('ext2spice format ngspice')
        result += self.p.run_command('ext2spice -m -o {}'.format(target))
        return result

    def is_alive(self):
        return self.p.child.isalive()


def confirm(prompt=None, resp=False):
    """prompts for yes or no response from the user. Returns True for yes and
    False for no.

    'resp' should be set to the default value assumed by the caller when
    user simply types ENTER.

    >>> confirm(prompt='Create Directory?', resp=True)
    Create Directory? [y]|n:
    True
    >>> confirm(prompt='Create Directory?', resp=False)
    Create Directory? [n]|y:
    False
    >>> confirm(prompt='Create Directory?', resp=False)
    Create Directory? [n]|y: y
    True

    """

    if prompt is None:
        prompt = 'Confirm'

    if resp:
        prompt = '%s [%s]|%s: ' % (prompt, 'y', 'n')
    else:
        prompt = '%s [%s]|%s: ' % (prompt, 'n', 'y')

    while True:
        ans = input(prompt)
        if not ans:
            return resp
        if ans not in ['y', 'Y', 'n', 'N']:
            print('please enter y or n.')
            continue
        if ans == 'y' or ans == 'Y':
            return True
        if ans == 'n' or ans == 'N':
            return False


def error(msg):
    print('[ERROR] ' + msg)
    ERRORS.append('[ERROR] ' + msg)


def edie(msg, code=1):
    print(msg, file=STDERR)
    exit(code)


def warn(msg):
    print(msg, file=STDERR)


def make_gds(mf):
    target = (LIB_PATH['gds'] / mf.long_name).with_suffix('.gds')

    try:
        result = magic.make_gds(mf.file, target)
        if not magic.is_alive():
            print(result)
            error("There was a problem during the processing of {}: ".format(mf))

        print('wrote GDS: {}'.format(target.relative_to(rel_root)))

    except BaseException:
        error("There was a problem during the processing of {}:".format(mf))


def make_temp_lef(mf):
    target = (LIB_PATH['temp_lef'] / mf.long_name).with_suffix('.lef')

    # try:

    result = magic.make_lef(mf.file)
    if not magic.is_alive():
        print(result)
        error("There was a problem during the processing of {}: ".format(mf))

    shutil.copy(mf.file.parent / (mf.long_name + '.lef'), target)
    os.remove(mf.file.parent / (mf.long_name + '.lef'))
    print('wrote LEF: {}'.format(target.relative_to(rel_root)))

    # except BaseException:
    #     error("There was a problem (Magic crash?) during the processing of {}:".format(mf))


def make_lef():
    target = (LIB_PATH['lef'] / PDK_VARIANT).with_suffix('.lef')

    for sf in LIB_PATH['temp_lef'].glob('*.lef'):

        example_ = LIB_PATH['temp_lef'] / sf

        with open(example_, 'r') as f:
            ef = f.read()

        header = re.findall(r'[\S\s\n]*(?=MACRO)', ef)[0]
        if header:
            break

    blocks = []

    # only standard cells make it into the merged LEF
    for sf in LIB_PATH['temp_lef'].glob('*.lef'):

        if sf.stem not in cd.standard_cells:
            continue

        cell = cd.by_name(sf.stem)
        try:
            with open(sf, 'r') as f:
                st = f.read()
            blocks.append(
                re.search(r'(MACRO\s+{}[\s\S\n]*?\n\s*END\s+{})'.format(re.escape(cell.long_name), re.escape(cell.long_name)), st).group()
            )

            if args.delete:
                os.remove(sf)
                print('removed individual LEF at {}'.format(sf))

        except:
            warn('Did not find a matching MACRO block in temporary LEF file: {}'.format(sf))

    tot_file = header + '\n\n'.join(blocks + ['END LIBRARY'])

    with open(target, 'w') as f:
        f.write(tot_file)

    print('wrote compiled LEF at {}'.format(LIB_PATH['lef']))


def make_spice(mf):
    target = (LIB_PATH['spice_ext'] / mf.long_name).with_suffix('.spice')

    try:
        result = magic.make_spice(mf.file, target)

        if not magic.is_alive():
            print(result)
            error("There was a problem during the processing of {}: ".format(mf))

        for df in LIB_PATH['mag'].glob('*.ext'):
            os.remove(df)
        print('wrote SPICE: {}'.format(target.relative_to(rel_root)))

        with open(target, 'r') as f:
            tt = f.read()
        with open(target, 'w') as f:
            f.write('* ' + LICENSE_HEAD.replace('\n', '\n* '))
            f.write('\n\n')
            f.write(tt)

    except BaseException:
        error("There was a problem during the processing of {}:".format(mf))


def make_verilog():
    """
    make a skeletal verilog module def for each cell with ports
    :return:
    """

    target = (LIB_PATH['verilog'] / PDK_VARIANT).with_suffix('.v')

    if LIB_PATH['temp_lef'] and LIB_PATH['temp_lef'].is_dir():
        lef_path = LIB_PATH['temp_lef']
    else:
        edie('Must specify \'--temp-lef\' path in order to generate VERILOG.')

    print('deriving VERILOG info from LEF file(s) at {}'.format(lef_path))

    if lef_path.is_dir():
        lef_files = list(lef_path.glob('*.lef'))
    elif lef_path.is_file():
        lef_files = [lef_path]

    cell_names = {}
    for lf in lef_files:
        with open(lf, 'r') as f:
            cc = f.read()
        cell_names.update({lf: re.findall(r'\n\s*MACRO\s+(\S+)', cc)})

    template_loader = jinja2.FileSystemLoader(TEMPLATE_PATH)
    template_env = jinja2.Environment(
        trim_blocks=True,
        lstrip_blocks=True,
        loader=template_loader,
        autoescape=jinja2.select_autoescape(
            disabled_extensions=('.v',),
            default_for_string=True,
            default=True,
        ))

    v_template = template_env.get_template(V_CELL_TEPLATE)

    cell_block = []

    for lef_file, macros in cell_names.items():

        ld = LefData(lef_file)

        for cn in macros:
            print('reading cell info: {}'.format(cn))

            pins = ld.cell_info(cn)
            names = sorted([p['name'] for p in pins])
            unames = sorted(list(set(names)))

            if unames != names:
                pins = [[p for p in pins if p['name'] == pn][0] for pn in unames]

            pg_pins = [p['name'] for p in pins if p['name'] in CONVENTIONS.PG_PIN_NAMES]
            pins = [p['name'] for p in pins if p['name'] not in CONVENTIONS.PG_PIN_NAMES]
            pg_pins.extend(["VNB", "VPB"])

            descr = cd.by_name(cn)
            cell_block.append(v_template.render(
                cell_name=cn,
                pins=pins,
                pg_pins=pg_pins,
                shortname=cn,
                description=descr['description'] if descr else ''
            ))
            print('appended VERILOG info for {}'.format(cn))

    result = '/** ' + LICENSE_HEAD.replace('\n', '\n * ') + '\n */\n\n\n'
    result += '\n\n`define USE_POWER_PINS 1\n\n'
    result += '\n\n'.join(cell_block)

    with open(target, 'w') as f:
        f.write(result)

    print('wrote VERILOG file to {}'.format(target))


def make_lib():
    target = (LIB_PATH['lib'] / PDK_VARIANT).with_suffix('.lib')
    lef_path = (LIB_PATH['lef'] / PDK_VARIANT).with_suffix('.lef')

    print('gen_lib deriving info from LEF file(s) at {}'.format(lef_path))

    if lef_path.is_dir():
        lef_files = list(lef_path.glob('*.lef'))
    elif lef_path.is_file():
        lef_files = [lef_path]
    else:
        raise BaseException('lef source not found')

    cell_names = {}
    for lf in lef_files:
        with open(lf, 'r') as f:
            cc = f.read()
        cell_names.update({lf: re.findall(r'\n\s*MACRO\s+(\S+)', cc)})

    template_loader = jinja2.FileSystemLoader(TEMPLATE_PATH)
    template_env = jinja2.Environment(
        trim_blocks=True,
        lstrip_blocks=True,
        loader=template_loader,
        autoescape=jinja2.select_autoescape(
            disabled_extensions=('.lib',),
            default_for_string=True,
            default=True,
        ))

    lib_template = template_env.get_template(LIB_HEAD_TEMPLATE)
    cell_template = template_env.get_template(LIB_CELL_TEMPLATE)

    cell_block = []

    for file, macros in cell_names.items():

        ld = LefData(file)

        for cn in macros:
            print('reading cell info: {}'.format(cn))

            pins = ld.cell_info(cn)
            if not pins:
                continue

            pg_pins = [p for p in pins if p['name'] in CONVENTIONS.PG_PIN_NAMES]
            pins = [p for p in pins if p['name'] not in CONVENTIONS.PG_PIN_NAMES]

            for pgp in pg_pins:
                pgp.update({
                    'pg_type': 'primary_ground' if pgp['name'] == 'VGND' else 'primary_power',
                    'related_bias_pin': 'VPB' if pgp['name'] == 'VGND' else 'VNB',
                    'voltage_name': pgp['name'],
                })

            pg_pins.append({
                'name': "VNB",
                'pg_type': "nwell",
                'physical_connection': "device_layer",
                'voltage_name': "VNB",
            })

            pg_pins.append({
                'name': "VPB",
                'pg_type': "pwell",
                'physical_connection': "device_layer",
                'voltage_name': "VPB",
            })

            for p in pins:
                # output pins:
                # max_capacitance: 0.1300150000;
                # max_transition: 1.5061030000;
                # input pins:
                # capacitance: 0.0021030000;
                # fall_capacitance: 0.0020150000;
                # max_transition: 1.5000000000;
                p.update({
                    'isclock': 'false',
                    'direction': 'inout',
                    'is_analog': 'true',
                    'function': None,
                    'capacitance': 0.0021030000,
                    'max_transition': 1.5061030000,
                    'related_ground_pin': 'VGND',
                    'related_power_pin': 'VPWR'
                })

            cell_block.append(cell_template.render(
                cell_name=cn,
                leakage_power=None,
                area=None,
                cell_leakage_power=None,
                pg_pins=pg_pins,
                pins=pins,
            ))
            print('appended LIB info for {}'.format(cn))

    result = lib_template.render(cells='\n\n'.join(cell_block))

    with open(target, 'w') as f:
        f.write(result)
    print('wrote LIB file to {}'.format(target))


def merge_lib_summary_and_readme():
    with open(README_HEADER, 'r') as f:
        rh = f.read()
    with open(LIB_PATH['cell_summary'], 'r') as f:
        cs = f.read()
    with open(LIB_PATH['cell_details'], 'r') as f:
        cd = f.read()
    with open(MAIN_README, 'w') as f:
        f.write(rh)
        f.write('\n')
        f.write(cs.replace('CELL_DETAILS.md', ''))
        f.write('\n')
        f.write(cd)
    print('markdown written to {}'.format(MAIN_README))


def make_markdown():
    """
    Create markdown summary of Magic cells in library
    :return:
    """
    make_cell_details_md()
    make_lib_summary_md()
    merge_lib_summary_and_readme()


def make_lib_summary_md():
    template_env = jinja2.Environment(
        trim_blocks=True,
        lstrip_blocks=True,
        loader=jinja2.FileSystemLoader(TEMPLATE_PATH),
        autoescape=jinja2.select_autoescape(
            disabled_extensions=('.v',),
            default_for_string=True,
            default=True,
        ))

    lib_template = template_env.get_template(MD_LIB_TEMPLATE)

    tables = []

    for cat in ['standard-cells', 'primitive-cells', 'test-cells']:
        rows = []
        for cn, cell in cd.by_category(cat).items():
            if cell['description']:
                rows.append('| {:<25} | {:<55} |'.format(
                    '[`{}`]({}#{})'.format(cn, LIB_PATH['cell_details'].relative_to(LIB_PATH['cell_summary'].parent),
                                           cn.replace('_', '-')),
                    cell['description']
                ))
            else:
                rows.append('| {:<25} | {:<55} |'.format(
                    '[`{}`]({}#{})'.format(cn, LIB_PATH['cell_details'].relative_to(LIB_PATH['cell_summary'].parent),
                                           cn.replace('_', '-')),
                    ''
                ))

        tables.append(rows)

    tables = lib_template.render(
        pub_rows=tables[0],
        prim_rows=tables[1],
        test_rows=tables[2],
    )

    # print(tables)
    with open(LIB_PATH['cell_summary'], 'w') as f:
        f.write(tables)
    with open(REF_ROOT / PDK_VARIANT / 'README.md', 'w') as f:
        f.write(tables)
    print('markdown written to {}'.format(LIB_PATH['cell_summary']))
    print('markdown written to {}'.format(REF_ROOT / PDK_VARIANT / 'README.md'))


def make_cell_details_md():
    template_env = jinja2.Environment(
        trim_blocks=True,
        lstrip_blocks=True,
        loader=jinja2.FileSystemLoader(TEMPLATE_PATH),
        autoescape=jinja2.select_autoescape(
            disabled_extensions=('.v',),
            default_for_string=True,
            default=True,
        ))

    cell_template = template_env.get_template(MD_CELL_TEMPLATE)

    tables = '<!--\n' + \
             '    This Markdown text is autogenerated. Do not Modify here. \n' + \
             '-->\n'
    tables += '# Cell Details\n\n'

    for cat in CELL_CATEGORIES:
        tables += '## {}\n\n'.format(cat.upper())
        cells = cd.by_category(cat)

        for cn, cell in cells.items():
            rows = []
            matches = [(k, v) for k, v in magic_lib[cell.long_name].ports.items()]
            matches = sorted(list(set(matches)), key=lambda x: int(x[1][1]))
            for m in matches:
                rows.append(
                    '| {:<20} | {:<20} | {:<20} | {:<20} |'.format(m[1][1], m[0], m[1][0], ','.join(m[1][2].split())))
            ld = LefData((LIB_PATH['temp_lef'] / magic_lib[cell.long_name].file.name).with_suffix('.lef'))
            tables += cell_template.render(
                cell_name=cn,
                description=cell['description'],
                height=ld.height,
                width=ld.width,
                table_rows=rows if rows else ''
            )

    # print(tables)
    with open(LIB_PATH['cell_details'], 'w') as f:
        f.write(tables)

    print('markdown written to {}'.format(LIB_PATH['cell_details']))


def make_nosynth():
    with open(NO_SYNTH_FILE, 'w') as f:
        for cellname in cd.all_cells.keys():
            f.write(cellname+'\n')


def parent_check(path):
    if not path.suffix:
        # treat path as a directory
        try:
            assert path.parent.is_dir()
        except AssertionError:
            edie('I can create the target dir {}, but I won\'nt create its parent'.format(path))

        os.makedirs(path, exist_ok=True)

        try:
            with open(path / 'testfile', 'w') as f:
                f.write('')
            os.remove(path / 'testfile')
        except:
            edie('problem writing to destination dir')

    else:
        # treat path as a file
        os.makedirs(path.parent, exist_ok=True)

        try:
            with open(path, 'w') as f:
                f.write('')
            os.remove(path)
        except:
            edie('problem writing to destination file')


def target_check(magic_file, type):
    if type not in args or getattr(args, type) is False:
        return False

    if type == 'temp_lef':
        suffix = 'lef'
    elif type == 'verilog':
        suffix = 'v'
    elif type == 'markdown':
        suffix = 'md'
    else:
        suffix = type

    if type in ['gds', 'temp_lef', 'spice_ext']:
        target = Path(LIB_PATH[type] / magic_file.long_name).with_suffix('.' + suffix)
        if not args.force and target.is_file() and os.path.getmtime(target) > os.path.getmtime(magic_file.file):
            # short circuit; don't do it
            return False
        # elif magic_file.short_name in cd.standard_cells:
        #     return True
        else:
            return True

    elif type in ['lef', 'lib', 'verilog']:
        target = (LIB_PATH[type] / PDK_VARIANT).with_suffix('.' + suffix)
        if not args.force and \
            (target.is_file() and os.path.getmtime(target) > max([os.path.getmtime(mf) for mf in LIB_PATH['mag'].glob('*.mag')])):
            # short circuit; don't do it
            return False
        elif magic_file is not None and magic_file.short_name in cd.standard_cells:
            return True
        elif magic_file is None:
            return True
        else:
            return False

    elif type == 'markdown':
        target = LIB_PATH['mag'] / 'README.md'
        if not args.force and target.is_file() and os.path.getmtime(target) > max(
                [os.path.getmtime(mf) for mf in LIB_PATH['mag'].glob('*.mag')]):
            # short circuit; don't do it
            return False
        else:
            return True

    else:
        return True

def handle_magic(magic_file):
    if not any([
        target_check(magic_file, 'gds'),
        target_check(magic_file, 'temp_lef'),
        target_check(magic_file, 'spice_ext')
    ]):
        return

    magic.renew(magic_file.file)
    print('loaded file {}'.format(magic_file.file.relative_to(rel_root)))

    if args.gds and target_check(magic_file, 'gds'):
        parent_check(LIB_PATH['gds'])
        make_gds(magic_file)
    if args.temp_lef and target_check(magic_file, 'temp_lef'):
        parent_check(LIB_PATH['temp_lef'])
        make_temp_lef(magic_file)
    if args.spice and target_check(magic_file, 'spice_ext'):
        parent_check(LIB_PATH['spice_ext'])
        make_spice(magic_file)


def check_port_pin_mapping():

    for cn, c in cd.standard_cells.items():
        amp = magic_lib[c.long_name].ports
        try:
            symb = xschem_lib[c.long_name].symbol
        except KeyError:
            continue

        axp = symb.pins

        mpo = []
        xpo = []
        message = []

        for mag_pin in amp:
            if mag_pin not in axp:
                mpo.append(mag_pin)

        for xsch_pin in axp:
            if xsch_pin not in amp:
                xpo.append(xsch_pin)

        if mpo:
            message.append('Magic file for \'{}\' defines ports which are not pins in Xschem symbol:'.format(c.long_name))
            for mmpo in mpo:
                message.append('    {}'.format(mmpo))

        if xpo:
            message.append('Xschem symbol for \'{}\' defines pins which are not ports in Magic file:'.format(c.long_name))
            for xxpo in xpo:
                message.append('    {}'.format(xxpo))

        if message:
            warn(stylize_head())
            warn('\n'.join(message))
            warn(stylize_head())


def check_lvs():
    NETGEN_TCL = TECH_ROOT / 'netgen' / 'sky130_setup.tcl'
    warn(stylize_head('Starting LVS'))
    for m in cd.standard_cells:
        ext_spice = list(LIB_PATH['spice_ext'].glob(CONVENTIONS.CELL_PREFIX + m + '.spice'))
        hand_spice = list(LIB_PATH['spice_hand'].glob(CONVENTIONS.CELL_PREFIX + m + '.spice'))

        if not len(ext_spice) or not len(hand_spice):
            if not len(ext_spice):
                warn('could not find \'{}\''.format(ext_spice))
            if not len(hand_spice):
                warn('could not find \'{}\''.format(hand_spice))
            continue

        # make a temporary spice file for the _ext version which has a top-level instantiation of itself
        with open(ext_spice[0], 'r') as f:
            src = f.read()

        match = re.search(r'^[.]subckt ({} .*)'.format(CONVENTIONS.CELL_PREFIX + m), src, re.MULTILINE)
        if match:
            instance = match.group(1)
        else:
            continue

        instance = 'X999 ' + instance + '\n'
        modsrc = src + instance

        os.makedirs(HILAS_PDK_ROOT / 'LVS_RESULTS', exist_ok=True)
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.spice') as f:
            f.write(modsrc)

            # consider adding the '-blackbox' option to keep empty subcells as meaningful entities
            command = 'netgen -batch lvs {} {} {} {} -json -blackbox'.format(
                f.name,
                hand_spice[0],
                NETGEN_TCL,
                (HILAS_PDK_ROOT / 'LVS_RESULTS' / m).with_suffix('.lvs.log')
            )
            subprocess.run(shlex.split(command), check=False)

    warn(stylize_head('LVS Complete'))


def check_file_names(path, suffix):
    if not suffix.startswith('*.'):
        if suffix.startswith('.'):
            suffix='*'+suffix
        else:
            suffix='*.'+suffix

    for m in Path(path).glob(suffix):
        if not m.stem.startswith(CONVENTIONS.CELL_PREFIX):
            edie('filename does not start with "{}":    {}'.format(CONVENTIONS.CELL_PREFIX, m.name))


def check_hand_spice():
    for file in LIB_PATH['spice_hand'].glob('*.spice'):
        if not file.stem.startswith(CONVENTIONS.CELL_PREFIX):
            warn('spice file {} missing prefix ({})'.format(file.name, CONVENTIONS.CELL_PREFIX))
            if confirm('fix it?', False):
                shutil.move(file, file.with_name(CONVENTIONS.CELL_PREFIX + file.name))


def check_dir_for_prefixes(directory, extension):
    if extension.startswith('*'):
        extension = extension[1:]

    if not extension.startswith('.'):
        extension = '.' + extension

    available = [c.name for c in LIB_PATH[directory].glob('*{}'.format(extension))]
    mp = []
    for avail in available:
        if not avail.startswith(CONVENTIONS.CELL_PREFIX):
            mp += [avail]

    if mp:
        warn(stylize_head())
        warn('    \'{}\' directory contains the following files which are missing the prefix \'{}\':'.format(directory, CONVENTIONS.CELL_PREFIX))
        for exx in mp:
            warn('        {}'.format(exx))
        warn(stylize_head())


def check_dir_for_complete(directory, extension, set):
    if extension.startswith('*'):
        extension = extension[1:]

    if not extension.startswith('.'):
        extension = '.' + extension

    targets = [c.long_name + extension for _,c in set.items()]
    available = [c.name for c in LIB_PATH[directory].glob('*{}'.format(extension))]
    missing_in_dir = []
    extra = []

    for targ in targets:
        if targ not in available:
            missing_in_dir += [targ]

    for avail in available:
        if avail not in targets:
            if extension == '.sym' and avail.endswith('_bb.sym'):
                continue
            extra += [avail]

    if missing_in_dir:
        warn(stylize_head())
        warn('\'{}\' directory is missing the following \'{}\' files:'.format(directory, extension))
        for m in missing_in_dir:
            warn('    {}'.format(m))
        if not extra:
            warn(stylize_head())

    if extra:
        warn('\'{}\' directory contains the following extraneous \'{}\' files:'.format(directory, extension))
        for exx in extra:
            warn('    {}'.format(exx))
        warn(stylize_head())


def check_prefixes():
    for set in [
        ('mag', 'mag'),
        ('png', 'png'),
        ('xschem', 'sch'),
        ('xschem', 'sym'),
        ('spice_hand', 'spice')
    ]:
        check_dir_for_prefixes(*set)


def check_file_presence():
    for set in [
        ('mag', 'mag', cd.all_cells),
        ('png', 'png', cd.standard_cells),
        ('xschem', 'sch', cd.standard_cells),
        ('xschem', 'sym', cd.standard_cells),
        ('spice_hand', 'spice', cd.standard_cells)
    ]:
        check_dir_for_complete(*set)


def run_rename_magic_module(spec_string):
    old_n, new_n = [x.strip() for x in spec_string.strip().split(':')]
    magic_lib.check()
    magic_lib.rename_module(from_name=old_n, to_name=new_n)


def run_rename_xschem_circuit(spec_string):
    old_n, new_n = [x.strip() for x in spec_string.strip().split(':')]
    xschem_lib.check()
    xschem_lib._rename_module(from_name=old_n, to_name=new_n)


def run_rename_xschem_pin(module, old_name, new_name):
    if old_name not in xschem_lib[module].symbol.pins:
        edie('\'{}\' is not a pin of \'{}.sym\'.'.format(old_name, module))
    if xschem_lib[module].schematic and old_name not in xschem_lib[module].schematic.pins:
        edie('\'{}\' is not a pin of \'{}.sch\'.'.format(old_name, module))

    xschem_lib[module].rename_pin(old_name, new_name)
    xschem_lib[module]._save()


def run_rename_magic_port(module, old_name, new_name):
    if old_name not in magic_lib[module].ports:
        edie('\'{}\' is not a port of \'{}\'.'.format(old_name, module))
    magic_lib[module].rename_port(old_name, new_name)
    magic_lib[module]._save()


def run_basic_checks():
    check_file_names(LIB_PATH['mag'], '.mag')
    check_file_names(LIB_PATH['xschem'], '.sym')
    check_file_names(LIB_PATH['xschem'], '.sch')
    check_file_presence()
    cd.check_yaml()
    magic_lib.check()
    xschem_lib.check()
    check_port_pin_mapping()
    check_hand_spice()


ERRORS = []
cd = None
mf = None
magic = None
magic_lib = None
xschem_lib = None
args = None
rel_root = None


def read_cell_index():
    global cd

    if args.lint_yaml:

        warn(stylize_head('Running YAML linter on {}'.format(CELL_DATA_FILE.name)))
        try:
            yamllintcli.run([str(CELL_DATA_FILE)])

        except:
            pass

        finally:
            warn(stylize_head())

    cd = LibraryInfo(CELL_DATA_FILE)


def main():
    global magic, args, rel_root, cd, magic_lib, xschem_lib

    ap = argparse.ArgumentParser()

    ############  Target Selection  ####################################################################################
    ap.add_argument('-e', '--lef', action='store_true', help='Create LEF file', default=False)
    ap.add_argument('-g', '--gds', action='store_true', help='Create GDS files', default=False)
    ap.add_argument('-i', '--lib', action='store_true', help='Create LIB file', default=False)
    ap.add_argument('-m', '--markdown', action='store_true',
                    help='Create a pretty, human-readable markdown summary of cell pins',
                    default=False)
    ap.add_argument('-n', '--nosynth', action='store_true', help='Create \"no_synth.cells\" file')
    ap.add_argument('-s', '--spice', action='store_true', help='Create Spice files', default=False)
    ap.add_argument('-t', '--temp-lef', action='store_true',
                    help='Create temporary individual LEF files', default=False)
    ap.add_argument('-v', '--verilog', action='store_true', help='Directory in which to put synthetic Verilog output',
                    default=False)
    ap.add_argument('--refresh', action='store_true', help='Same as: -egimnstvDF')

    ############  Checking  ############################################################################################
    ap.add_argument('-l', '--lvs', action='store_true', help='run LVS checks (with netgen)', default=False)
    ap.add_argument('-C', '--basic-checks', action='store_true', help='Run basic cell consistency checks.', default=False)
    ap.add_argument('-L', '--lint-yaml', action='store_true', help='Run linter on the CELL_INDEX.yml file')

    ############  Basic Options ########################################################################################
    ap.add_argument('--delete', action='store_true', help='Delete temporary (individual) LEF files after consolidation')
    ap.add_argument('-F', '--force', action='store_true', help='Overwrite existing collateral.', default=False)
    ap.add_argument('-N', '--no', action='store_true', help='Assume a \'no\' answer to all prompts.')
    ap.add_argument('-Y', '--yes', action='store_true', help='Assume a \'yes\' answer to all prompts.')

    ############  Naming Tools  ########################################################################################
    ap.add_argument('--rename-xschem-circuit', nargs=2, action='store', help='Rename modules in xschem library and update references.  '
                                                            'Usage: \'--rename-xschem <fromname> <toname>\'')
    ap.add_argument('--rename-magic-module', nargs=2, action='store', help='Rename magic modules and update references.'
                                                           '    Usage: \'--rename-magic <fromname> <toname>\'')

    ap.add_argument('--rename-magic-port', nargs=3, help='rename port in magic cell. Usage: --rename-magic-port <cell-name> <old-name> <new-name>')
    ap.add_argument('--rename-xschem-pin', nargs=3, help='rename pin in xschem circuit. Usage: --rename-xschem-pin <circuit-name> <old-name> <new-name>')

    args = ap.parse_args()
    if args.refresh:
        for arg in [
        'lef',
        'gds',
        'lib',
        'markdown',
        'nosynth',
        'spice',
        'temp_lef',
        'verilog',
        'force'
        ]:
            setattr(args, arg, True)

    rel_root = Path.cwd()

    read_cell_index()
    magic_lib = MagicLibrary(LIB_PATH['mag'])
    xschem_lib = XschemLibrary(LIB_PATH['xschem'])

    if args.basic_checks:
        run_basic_checks()

    if args.rename_magic_module:
        exit(run_rename_magic_module(args.rename_magic))

    if args.rename_xschem_circuit:
        exit(run_rename_xschem_circuit(args.rename_xschem))

    if args.rename_magic_port:
        exit(run_rename_magic_port(*args.rename_magic_port))

    if args.rename_xschem_pin:
        exit(run_rename_xschem_pin(*args.rename_xschem_pin))
    # Items here on done on a per-cell basis with Magic opening each one
    magic = Magic()
    for m in magic_lib.values():
        handle_magic(m)

    # The following items can be done on the batch level:
    if args.lvs:
        check_lvs()

    if args.lef and target_check(None, 'lef'):
        # consolidate all temp LEFs
        parent_check(LIB_PATH['lef'])
        make_lef()

    if args.lib and target_check(None, 'lib'):
        # make single LIB from single LEF
        parent_check(LIB_PATH['lib'])
        make_lib()

    if args.verilog and target_check(None, 'verilog'):
        parent_check(LIB_PATH['verilog'])
        make_verilog()

    if args.markdown and target_check(None, 'markdown'):
        # make a markdown pin summary file based on the Magic file source (text)
        make_markdown()

    if args.nosynth:
        make_nosynth()


def stylize_head(text=''):
    if text:
        cblock = '  ' + text + '  '
    else:
        cblock = ''
    hashlen = int((80-len(cblock))/2)
    return '#'*hashlen + cblock + '#'*hashlen


if __name__ == '__main__':
    exit(main())
