#! /usr/bin/env python3

import sys
import re
import os
import argparse

import jinja2
from pathlib import Path

this_dir = Path(__file__).parent
# STD_CELLS_PATH = this_dir / '..' / '..' / 'magic'
# TARGET_LIB_PATH = this_dir/'..'/'hilas.lib'
CELL_TEMPLATE = 'min_inverter.template.lib'
LIB_TEMPLATE = 'head.template.lib'
PG_PIN_NAMES = ['VPB', 'VPWRIN', 'LOWLVPWR', 'VGND', 'VPWR', 'VNB', 'KAPWR']


def edie(message,code=1):
    print(message)
    sys.exit(code)


# def read_pg_pin(lineno, text):
#     fake=True


def read_pin(text, lino):
    res = {}
    res.update({'name': text[lino].split('PIN')[1].strip()})
    endi = re.search('END\s+{}'.format(res['name']), ''.join(text[lino:])).end()
    text = ''.join(text[lino:])[:endi].split('\n')

    for line in text:
        if 'DIRECTION ' in line:
            res.update({'direction': line.split('DIRECTION')[1].strip().rstrip(';')})
        elif 'USE ' in line:
            res.update({'use': line.split('USE')[1].strip().rstrip(';')})
        elif 'ANTENNAGATEAREA' in line:
            res.update({'antenna_gate_area': line.split('ANTENNAGATEAREA')[1].strip().rstrip(';')})

    return res


def read_cell_info(cell_file):
    pi = []
    with open(cell_file, 'r') as f:
        cc = f.readlines()
    for i, line in enumerate(cc):

        if re.match('^\s*PIN (.*)\s*\n', line):
            # found a pin
            pi.append(read_pin(cc, i))


        # elif re.match('^\s*pg_pin \("(.*)"\)', line):
        #     # found a pg_pin
        #     pi.append(read_pg_pin(cc, i))
    return pi


def main():
    ap = argparse.ArgumentParser(description='Generates a *.lib file given cells in *.mag format')
    ap.add_argument('LEF_dir', help="Path to LEF source file directory")
    ap.add_argument('output', help='Path/name of the generated Liberty file')
    args = ap.parse_args()

    try:
        lef_path = Path(args.LEF_dir)
        assert lef_path.is_dir()
    except AssertionError:
        edie('bac LEF source path')

    cell_names = [x.split('.lef')[0] for x in os.listdir(lef_path) if x.endswith('.lef')]

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
    for cn in cell_names:

        pins = read_cell_info(lef_path/( cn+'.lef'))

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
            #output pins:
                # max_capacitance: 0.1300150000;
                # max_transition: 1.5061030000;
            #input pins:
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

    result = lib_template.render(cells='\n\n'.join(cell_block))
    with open(args.output, 'w') as f:
        f.write(result)


if __name__ == '__main__':
    sys.exit(main())