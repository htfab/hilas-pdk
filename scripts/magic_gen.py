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
import tempfile
import shutil
import jinja2
import yaml

from collections import OrderedDict
from sys import stderr as STDERR
from pexpect.replwrap import REPLWrapper
from pathlib import Path

#######################################################################################
PDK_VARIANT = 'sky130_hilas_sc'
CELL_PREFIX = 'sky130_hilas_'
PG_PIN_NAMES = {'VPB': [],  # net names appearing in the lists will be converted to the key
                'VPWRIN': [],
                'LOWLVPWR': [],
                'VGND': ['GND'],
                'VPWR': ['VDD'],
                'VNB': [],
                'KAPWR': []
                }
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

ERRORS = []
cd = None
mf = None


class CellData(OrderedDict):

    def __init__(self, yaml_dict):
        cd = OrderedDict()
        for cat in CELL_CATEGORIES:
            cd.update({cat: OrderedDict()})
            sorted_keys = sorted(yaml_dict[cat].keys())
            for k in sorted_keys:
                cd[cat].update({k: yaml_dict[cat][k]})
        super().__init__(cd)

    @property
    def all_cells(self):
        return OrderedDict({cn: cell for cat, cells in self.items() for cn, cell in cells.items() if 'description' in cell})

    @property
    def standard_cells(self):
        return OrderedDict({cn: cell for cn, cell in self['standard-cells'].items() if 'description' in cell})

    @property
    def component_cells(self):
        return OrderedDict({cn: cell for cn, cell in self['component-cells'].items() if 'description' in cell})

    @property
    def primitive_cells(self):
        return OrderedDict({cn: cell for cn, cell in self['primitive-cells'].items() if 'description' in cell})

    @property
    def test_cells(self):
        return OrderedDict({cn: cell for cn, cell in self['test-cells'].items() if 'description' in cell})

    def by_name(self, cell_name):
        if cell_name.startswith(CELL_PREFIX):
            cell_name = cell_name.split(CELL_PREFIX)[1]
        try:
            return [cell for cat in self.values() for cn, cell in cat.items() if cn == cell_name][0]
        except IndexError:
            return None

    def by_cat(self, category_name):
        return OrderedDict({cn: cell for cn, cell in self[category_name].items() if cn != 'description'})


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
            pi.append(LefData.read_pin(pinfo[1], pinfo[0]))
            # elif re.match('^\s*pg_pin \("(.*)"\)', line):
            #     # found a pg_pin
            #     pi.append(read_pg_pin(cc, i))
        return pi


class MagicLibrary(dict):
    def __init__(self, list_of_mag_files):
        super().__init__({MagData.file2name(f): MagData(f) for f in list_of_mag_files})

    def byname(self, name):
        return [m for mname, m in self.items() if mname == name][0]

    def byfile(self, file):
        return [m for name, m in self.items() if m.file == file][0]


class MagData(object):
    MAGIC_PIN_REGEX = re.compile(r'^\s*\wlabel\s+(\S+).*\s+(\S+)\s*\n\s*port\s+(\d+)\s+(.*)$', re.MULTILINE)
    CELL_REF_REGEX = re.compile(r'^\s?use (\w+)', re.MULTILINE)

    def __init__(self, mag_file):
        if isinstance(mag_file, Path) or (
                isinstance(mag_file, str) and '\n' not in mag_file and os.path.isfile(mag_file)):
            with open(mag_file, 'r') as f:
                self.c = f.read()
        else:
            self.c = mag_file

        self.file = mag_file
        self.long_name = mag_file.stem
        self.short_name = mag_file.stem.split(CELL_PREFIX)[1]

    def referenced_mods(self):
        return list(set(re.findall(self.CELL_REF_REGEX, self.c)))

    def ports(self):
        match = re.findall(self.MAGIC_PIN_REGEX, self.c)
        return {item[1]: (item[0], item[2], item[3]) for item in match}

    def rename_net(self, old_name, new_name):
        self.c = re.sub(r'(\n\s*[fr]label\s+.*\s+){}\s*\n'.format(re.escape(old_name)),
                        r'\g<1>{}\n'.format(re.escape(new_name)), self.c, re.MULTILINE)

    def write_file(self):
        with open(self.file, 'w') as f:
            f.write(self.c)

    @staticmethod
    def file2name(file):
        return file.stem.split(CELL_PREFIX)[1]

    @staticmethod
    def name2file(name):
        if not name.startswith(CELL_PREFIX):
            name = CELL_PREFIX + name
        if not name.endswith('.mag'):
            name = name + '.mag'
        return LIB_PATH['mag'] / name


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
    print(msg)
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
        sh_name = sf.stem.split(CELL_PREFIX)[1]
        if sh_name not in cd.standard_cells:
            continue

        try:
            with open(sf, 'r') as f:
                st = f.read()
            cn = sf.stem
            blocks.append(
                re.search(r'(MACRO\s+{}[\s\S\n]*?\n\s*END\s+{})'.format(re.escape(cn), re.escape(cn)), st).group()
            )
        except:
            pass

        if args.delete:
            os.remove(sf)
            print('removed individual LEF at {}'.format(sf))

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

            if pins:
                fake = True
            pg_pins = [p['name'] for p in pins if p['name'] in PG_PIN_NAMES]
            pins = [p['name'] for p in pins if p['name'] not in PG_PIN_NAMES]
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

    result = '/** ' + LICENSE_HEAD.replace('\n', '\n * ') + '\n */\n\n\n' + '\n\n'.join(cell_block)

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

            pg_pins = [p for p in pins if p['name'] in PG_PIN_NAMES]
            pins = [p for p in pins if p['name'] not in PG_PIN_NAMES]

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
        for cn, cell in cd.by_cat(cat).items():
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
        cells = cd.by_cat(cat)

        for cn, cell in cells.items():
            rows = []
            matches = [(k, v) for k, v in mag_files[cn].ports().items()]
            matches = sorted(list(set(matches)), key=lambda x: int(x[1][1]))
            for m in matches:
                rows.append(
                    '| {:<20} | {:<20} | {:<20} | {:<20} |'.format(m[1][1], m[0], m[1][0], ','.join(m[1][2].split())))
            ld = LefData((LIB_PATH['temp_lef'] / mag_files[cn].file.name).with_suffix('.lef'))
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


def check_count():
    all_cells = cd.all_cells
    magic_files = [f.name for f in LIB_PATH['mag'].glob('*.mag')]

    if len(all_cells) != len(set(list(all_cells.keys()))):
        dl = list(all_cells.keys())
        dd = list(set(dl))
        for c in dd:
            dl.remove(c)
        warn('######################################################################################################')
        warn('Found duplicate entries in {}:'.format(CELL_DATA_FILE.name))
        for f in dl:
            warn('    ' + str(f))
        warn('######################################################################################################')

    ml = list(magic_files)
    mm = []
    for cn, c in all_cells.items():
        mag_name = 'sky130_hilas_' + cn + '.mag'
        if mag_name in ml:
            ml.remove(mag_name)
        else:
            mm.append(cn)

    if mm:
        warn('######################################################################################################')
        warn('Entries in {} without /mag/ files:'.format(CELL_DATA_FILE.name))
        for mf in mm:
            warn('    ' + str(mf))
        warn('######################################################################################################')

    if ml:
        warn('######################################################################################################')
        warn('Magic files missing entries in {}:'.format(CELL_DATA_FILE.name))
        for mf in ml:
            warn('    ' + str(mf))
        warn('######################################################################################################')


def check_depends():
    missing = {}
    for m in mag_files.values():
        deps = m.referenced_mods()
        if m.long_name in deps:
            warn('######################################################################################################')
            warn('    Cell \'{}\' contains instances of itself!'.format(m.long_name))
            warn('######################################################################################################')

        for d in deps:
            if not (LIB_PATH['mag'] / d).with_suffix('.mag').is_file():
                if m.long_name in missing:
                    missing[m.long_name] += [d]
                else:
                    missing.update({m.long_name: [d]})

    if missing:
        warn('######################################################################################################')
        warn('Referenced (sub)cells missing from the /mag/ path:')
        for mf, clist in missing.items():
            warn('    {} is missing:'.format(mf))
            for cell in clist:
                warn('        {}'.format(cell))

        warn('######################################################################################################')


def check_descriptions():
    missing = []
    for cn, cell in cd.all_cells.items():
        if 'description' not in cell or cell['description'] is None or cell['description'] == '':
            missing.append(cn)
    if missing:
        warn('######################################################################################################')
        warn('The following standard cells are missing descriptions in the \'{}\'file:'.format(CELL_DATA_FILE.name))
        for mf in missing:
            warn('    ' + str(mf))
        warn('######################################################################################################')


def check_net_names():
    for m in mag_files.values():
        write = False
        nets = m.ports()
        for net in nets:
            if '+' in net:
                warn('Found \'+\' in net name \'{}\' in {}'.format(net, m.file.name))
                newname = net.replace('+', 'P')
                m.rename_net(net, newname)
                net = newname
                write = True
            if '-' in net:
                warn('Found \'-\' in net name \'{}\' in {}'.format(net, m.file.name))
                newname = net.replace('-', 'N')
                m.rename_net(net, newname)
                net = newname
                write = True
            if net.upper() != net:
                warn('Found non-capitalized net name \'{}\' in {}'.format(net, m.file.name))
                newname = net.upper()
                m.rename_net(net, newname)
                net = newname
                write = True
        if write:
            if args.no:
                pass
            elif args.yes or confirm(
                    'Would you like to write the capitalized-net-corrected file {} ?'.format(m.file.name), False):
                m.write_file()
                warn('wrote capitalized-net-corrected version of {}'.format(m.file.name))


def check_power_nets():
    for m in mag_files.values():
        write = False
        hit_list = [item for list in PG_PIN_NAMES.values() for item in list]
        for old_net in m.ports():
            if old_net in hit_list:
                for new_net, list in PG_PIN_NAMES.items():
                    if old_net in list:
                        break
                warn(
                    'Found net \'{}\' in {} which is probably meant to be \'{}\''.format(old_net, m.file.name, new_net))
                m.rename_net(old_net, new_net)
                write = True

        if write:
            if args.no:
                pass
            elif args.yes or confirm(
                    'Would you like to write the power-net-corrected file {} ?'.format(m.file.name), False):
                m.write_file()
                warn('wrote power-net-corrected version of {}'.format(m.file.name))


def check_lvs():
    for m in mag_files.values():
        spicefile = Path(LIB_PATH['spice_hand']).glob(Path(m.file).stem + '.spice')


def check_mag_names():
    for m in Path(LIB_PATH['mag']).glob('*.mag'):
        if not m.stem.startswith(CELL_PREFIX):
            edie('cellname does not start with "{}":    {}'.format(CELL_PREFIX, m.name))


def check_hand_spice():
    for file in LIB_PATH['spice_hand'].glob('*.spice'):
        if not file.stem.startswith(CELL_PREFIX):
            warn('spice file {} missing prefix ({})'.format(file.name, CELL_PREFIX))
            if confirm('fix it?', False):
                shutil.move(file, file.with_name(CELL_PREFIX + file.name))


def check_dir_for_prefixes(directory, extension):
    if extension.startswith('*'):
        extension = extension[1:]

    if not extension.startswith('.'):
        extension = '.' + extension

    available = [c.name for c in LIB_PATH[directory].glob('*{}'.format(extension))]
    mp = []
    for avail in available:
        if not avail.startswith(CELL_PREFIX):
            mp += [avail]

    if mp:
        warn('######################################################################################################')
        warn('    \'{}\' directory contains the following files which are missing the prefix \'{}\':'.format(directory, CELL_PREFIX))
        for exx in mp:
            warn('        {}'.format(exx))
        warn('######################################################################################################')


def check_dir_for_complete(directory, extension, set):
    if extension.startswith('*'):
        extension = extension[1:]

    if not extension.startswith('.'):
        extension = '.' + extension

    targets = [CELL_PREFIX+c+extension for c in set]
    available = [c.name for c in LIB_PATH[directory].glob('*{}'.format(extension))]
    missing_in_dir = []
    extra = []

    for targ in targets:
        if targ not in available:
            missing_in_dir += [targ]

    for avail in available:
        if avail not in targets:
            extra += [avail]

    if missing_in_dir:
        warn('######################################################################################################')
        warn('    \'{}\' directory is missing the following files:'.format(directory))
        for m in missing_in_dir:
            warn('        {}'.format(m))
        warn('######################################################################################################')

    if extra:
        warn('######################################################################################################')
        warn('    \'{}\' directory contains the following extraneous files:'.format(directory))
        for exx in extra:
            warn('        {}'.format(exx))
        warn('######################################################################################################')


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


def run_checks():
    check_file_presence()
    check_count()
    check_depends()
    check_hand_spice()
    check_descriptions()
    check_net_names()
    check_power_nets()
    check_lvs()


def main():
    global magic, args, rel_root, cd, mag_files

    ap = argparse.ArgumentParser()
    ap.add_argument('-g', '--gds', action='store_true', help='Create GDS files', default=False)
    ap.add_argument('-t', '--temp-lef', action='store_true',
                    help='Create temporary individual LEF files', default=False)
    ap.add_argument('-e', '--lef', action='store_true', help='Create LEF file', default=False)
    ap.add_argument('-i', '--lib', action='store_true', help='Create LIB file', default=False)
    ap.add_argument('-l', '--lvs', action='store_true', help='run LVS checks (with netgen)', default=False)
    ap.add_argument('-s', '--spice', action='store_true', help='Create Spice files', default=False)
    ap.add_argument('-m', '--markdown', action='store_true',
                    help='Create a pretty, human-readable markdown summary of cell pins',
                    default=False)
    ap.add_argument('-n', '--nosynth', action='store_true', help='Create \"no_synth.cells\" file')
    ap.add_argument('-v', '--verilog', action='store_true', help='Directory in which to put synthetic Verilog output',
                    default=False)

    ap.add_argument('-C', '--checks-only', action='store_true', help='Run consistency checks and quit.', default=True)
    ap.add_argument('-D', '--delete', action='store_true',
                    help='Delete temporary (individual) LEF files after consolidation', default=False)
    ap.add_argument('-F', '--force', action='store_true', help='Overwrite existing collateral.', default=False)
    ap.add_argument('-Y', '--yes', action='store_true', help='Assume a \'yes\' answer to all prompts.')
    ap.add_argument('-N', '--no', action='store_true', help='Assume a \'no\' answer to all prompts.')
    args = ap.parse_args()

    with open(CELL_DATA_FILE, 'r') as f:
        cd = CellData(yaml.load(f, Loader=yaml.SafeLoader))

    rel_root = Path.cwd()

    try:
        assert LIB_PATH['mag'].is_dir()
    except AssertionError:
        edie('source path should be a directory containing .mag Magic files')

    source_files = list(LIB_PATH['mag'].glob('*.mag'))

    try:
        assert source_files is not None
    except AssertionError:
        edie('didn\'t find any *.mag files on the source path')

    check_mag_names()
    mag_files = MagicLibrary(source_files)

    if args.checks_only:
        exit(run_checks())
    else:
        run_checks()

    # Items here on done on a per-cell basis with Magic opening each one
    magic = Magic()
    for m in mag_files.values():
        handle_magic(m)

    # The following items can be done on the batch level:

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


if __name__ == '__main__':
    exit(main())
