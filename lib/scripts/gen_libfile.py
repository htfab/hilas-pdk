#! /usr/bin/env python3

import sys
import re
import os
import argparse

from pathlib import Path

this_dir = Path(__file__).parent
STD_CELLS_PATH = this_dir / '..' / '..' / 'magic'
# TARGET_LIB_PATH = this_dir/'..'/'hilas.lib'
REF_CELL_PATH = this_dir/'min_inverter_template.lib.cell'
LIB_TEMPLATE = this_dir/'template_nocells.lib'


def main():
    ap = argparse.ArgumentParser(description='Generates a *.lib file given cells in *.mag format')
    ap.add_argument('output', help='Path/name of the generated Liberty file')
    args = ap.parse_args()

    cell_names = [x.strip('.mag') for x in os.listdir(STD_CELLS_PATH) if x.endswith('.mag')]

    with open(REF_CELL_PATH, 'r') as f:
        ref_cell = f.read()

    with open(LIB_TEMPLATE, 'r') as f:
        template = f.read()

    cell_block = []
    for cn in cell_names:
        cell_block.append(re.sub('\{\{cell_name\}\}', cn, ref_cell))

    with open(args.output, 'w') as f:
        f.write(re.sub(r'\{\{cells\}\}', '\n\n'.join(cell_block), template))


if __name__ == '__main__':
    sys.exit(main())