#! /usr/bin/env python3

import argparse
import os
import re
import tempfile
import shutil
import jinja2

from pexpect.replwrap import REPLWrapper
from pathlib import Path

CELL_TEMPLATE = 'min_inverter.template.lib'
LIB_TEMPLATE = 'head.template.lib'
PG_PIN_NAMES = ['VPB', 'VPWRIN', 'LOWLVPWR', 'VGND', 'VPWR', 'VNB', 'KAPWR']

this_dir = Path(__file__).parent


def edie(msg, code=1):
    print(msg)
    exit(code)


def newmagic():
    try:
        os.chdir(tempdir)
        return REPLWrapper('magic -dnull -noconsole -rcfile "{}" -T "{}"'.format(
            os.getenv('MAGICRC'), os.getenv('TECHFILE')),
            orig_prompt='%', prompt_change=None)
    except:
        edie('couldn\'t start Magic')


def magic_load(magic_file):
    result = ''
    result += magic.run_command('drc off')
    result += magic.run_command('load "{}" -force'.format(magic_file))
    result += magic.run_command('drc off')
    return result


def renew_magic(source):
    global magic

    if 'magic' not in globals() or not hasattr(magic, 'child') or not magic.child.isalive():
        magic = newmagic()

    return magic_load(source)


def magic_gds(source, target):
    result = renew_magic(source)
    result += magic.run_command('gds readonly true')
    result += magic.run_command('gds rescale false')
    result += magic.run_command('gds merge')
    result += magic.run_command('gds flatten')
    result += magic.run_command('gds write {}'.format(target))
    return result


def magic_lef(source):
    result = renew_magic(source)
    result += magic.run_command('lef write')
    # result += magic.run_command('lef write')
    return result


def magic_spice(source, target):
    result = renew_magic(source)
    result += magic.run_command('extract do all')
    result += magic.run_command('extract all')
    result += magic.run_command('ext2spice lvs')
    # result += magic.run_command('ext2spice format ngspice')
    result += magic.run_command('ext2spice -m -o {}'.format(target))
    return result


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


def read_cell_info(cell_name, lef_path):

    if isinstance(lef_path, Path):

        if lef_path.is_dir():
            # treat it as the directory containing the desired LEF file
            try:
                with open(lef_path / (cell_name+'.lef'), 'r') as f:
                    cc = f.read()
            except:
                edie('no file named {}'.format(lef_path / (cell_name+'.lef')))

        elif lef_path.is_file():
            with open(lef_path, 'r') as f:
                cc = f.read()

    elif isinstance(lef_path, str):
        # treat it as the contents of a single LEF file
        cc = lef_path

    pi = []

    for pinfo in re.findall(r'(^\s*PIN\s+(?P<name>\S*)\n(?:.*\n)*?\s*END\s+\2)', cc, re.MULTILINE):
        # found a pin
        pi.append(read_pin(pinfo[1], pinfo[0]))
        # elif re.match('^\s*pg_pin \("(.*)"\)', line):
        #     # found a pg_pin
        #     pi.append(read_pg_pin(cc, i))
    return pi


def make_gds(mf):

    target = paths['gds'] / mf.with_suffix('.gds')

    try:
        result = magic_gds(mf, target)
        print('wrote GDS: {}'.format(target))

    except BaseException:
        print("[ERROR] There was a problem during the processing of {}:".format(mf))
        print(result)

    if not magic.child.isalive():
        print("[ERROR] There was a problem during the processing of {}: ".format(mf))
        print(result)


def make_temp_lef(mf):

    target = paths['tlef'] / Path(mf.stem).with_suffix('.lef')

    try:
        result = magic_lef(mf)
        if not magic.child.isalive():
            print("[ERROR] There was a problem during the processing of {}: ".format(mf))
            print(result)

        try:
            shutil.copy(tempdir / (mf.stem+'.lef'), target)
        except FileNotFoundError:
            try:
                shutil.copy(mf.parent / (mf.stem + '.lef'), target)
            except:
                edie('[ERROR] LEF creation appears successful, but I can\'t find the LEF file')

        print('wrote LEF: {}'.format(target))

    except BaseException:
        print("[ERROR] There was a problem (Magic crash?) during the processing of {}:".format(mf))


def make_spice(mf):

    target = paths['spice'] / Path(mf.stem).with_suffix('.spice')

    try:
        result = magic_spice(mf, target)
        print('wrote SPICE: {}'.format(target))

    except BaseException:
        print("[ERROR] There was a problem during the processing of {}:".format(mf))
        print(result)

    if not magic.child.isalive():
        print("[ERROR] There was a problem during the processing of {}: ".format(mf))
        print(result)


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

    if type == 'lef' or type == 'lib':
        target = paths[type]
        if target.is_file() and os.path.getmtime(target) > max([os.path.getmtime(mf) for mf in paths['mag'].glob('*.mag')]):
            # short circuit; don't do it
            return False
        else:
            return True

    else:
        if type == 'tlef':
            suffix = 'lef'
        else:
            suffix = type
        target = paths[type] / Path(magic_file.stem).with_suffix('.'+suffix)

        if target.is_file() and os.path.getmtime(target) > os.path.getmtime(magic_file):
            # short circuit; don't do it
            return False
        else:
            return True


def handle_magic(magic_file):

    if not any([
        target_check(magic_file, 'gds'),
        target_check(magic_file, 'tlef'),
        target_check(magic_file, 'spice')
    ]):
        return

    try:
        result = renew_magic(magic_file)
        print('loaded file {}'.format(magic_file))
    except:
        print('couldn\'t load magic file: {}'.format(magic_file))
        edie(result)

    if paths['gds'] is not None and target_check(magic_file, 'gds'):
        parent_check(paths['gds'])
        make_gds(magic_file)
    if paths['tlef'] is not None and target_check(magic_file, 'tlef'):
        parent_check(paths['tlef'])
        make_temp_lef(magic_file)
    if paths['spice'] is not None and target_check(magic_file, 'spice'):
        parent_check(paths['spice'])
        make_spice(magic_file)


def consolidate_lef():

    for sf in paths['tlef'].glob('*.lef'):

        example_ = paths['tlef'] / sf

        with open(example_, 'r') as f:
            ef = f.read()

        header = re.findall(r'[\S\s\n]*(?=MACRO)', ef)[0]
        if header:
            break

    blocks = []
    for sf in paths['tlef'].glob('*.lef'):
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

    with open(paths['lef'], 'w') as f:
        f.write(tot_file)
    print('wrote compiled LEF at {}'.format(paths['lef']))


def make_lib():

    target = paths['lib']
    lef_path = paths['lef']

    print('gen_lib deriving info from LEF file(s) at {}'.format(lef_path))

    if lef_path.is_dir():
        lef_files = list(lef_path.glob('*.lef'))
    elif lef_path.is_file():
        lef_files = [lef_path]

    cell_names = {}
    for lf in lef_files:
        with open(lf, 'r') as f:
            cc = f.read()
        cell_names.update({lf: re.findall(r'\n\s*MACRO\s+(\S+)', cc)})

    template_loader = jinja2.FileSystemLoader(this_dir)
    template_env = jinja2.Environment(
        trim_blocks=True,
        lstrip_blocks=True,
        loader=template_loader,
        autoescape=jinja2.select_autoescape(
            disabled_extensions=('.lib',),
            default_for_string=True,
            default=True,
        ))

    lib_template = template_env.get_template(str(LIB_TEMPLATE))
    cell_template = template_env.get_template(str(CELL_TEMPLATE))

    cell_block = []

    for file, macros in cell_names.items():

        for cn in macros:
            print('reading cell info: {}'.format(cn))

            pins = read_cell_info(cn, file)

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


def main():
    global paths, magic, tempdir, args

    ap = argparse.ArgumentParser()
    ap.add_argument('-g', '--gds-path', action='store', help='Directory in which to put GDS output', default=None)
    ap.add_argument('-t', '--temp-lef', action='store',
                    help='Directory in which to put temporary, individual LEF output', default=None)
    ap.add_argument('-e', '--lef-path', action='store', help='Directory in which to put LEF output', default=None)
    ap.add_argument('-i', '--lib-path', action='store', help='Directory in which to put LIB output', default=None)
    ap.add_argument('-s', '--spice-path', action='store', help='Directory in which to put Spice output', default=None)
    ap.add_argument('-D', '--delete', action='store_true', help='Delete temporary (individual) LEF files after consolidation', default=False)
    ap.add_argument('magic_path', help='Path to directory containing Magic cell source files')

    args = ap.parse_args()

    paths = {}

    if args.magic_path is not None:
        p = Path(args.magic_path)
        if not p.is_absolute():
            p = Path.cwd() / p
        paths.update({'mag': p})

    if args.gds_path is not None:
        p = Path(args.gds_path)
        if not p.is_absolute():
            p = Path.cwd() / p
        paths.update({'gds': p})

    if args.temp_lef is not None:
        p = Path(args.temp_lef)
        if not p.is_absolute():
            p = Path.cwd() / p
        paths.update({'tlef': p})

    if args.lef_path is not None:
        p = Path(args.lef_path)
        if not p.is_absolute():
            p = Path.cwd() / p
        paths.update({'lef': p})

    if args.lib_path is not None:
        p = Path(args.lib_path)
        if not p.is_absolute():
            p = Path.cwd() / p
        paths.update({'lib': p})

    if args.spice_path is not None:
        p = Path(args.spice_path)
        if not p.is_absolute():
            p = Path.cwd() / p
        paths.update({'spice': p})

    try:
        assert paths['mag'].is_dir()
    except AssertionError:
        edie('source path should be a directory containing .mag Magic files')

    source_files = list(paths['mag'].glob('*.mag'))

    try:
        assert source_files is not None
    except AssertionError:
        edie('didn\'t find any *.mag files on the source path')

    with tempfile.TemporaryDirectory() as tempdirname:

        tempdir = Path(tempdirname)

        magic = newmagic()

        for mf in source_files:
            handle_magic(mf)

        if paths['lef'] is not None and target_check(None, 'lef'):
            # consolidate all temp LEFs
            parent_check(paths['lef'])
            consolidate_lef()

        if paths['lib'] is not None and target_check(None, 'lib'):
            # make single LIB from single LEF
            parent_check(paths['lib'])
            make_lib()


if __name__ == '__main__':
    exit(main())
