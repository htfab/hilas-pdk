#! /usr/bin/env python3

import sys
import re
import os
import argparse

import jinja2
from pathlib import Path

this_dir = Path(__file__).parent
STD_CELLS_PATH = this_dir / '..' / '..' / 'magic'
# TARGET_LIB_PATH = this_dir/'..'/'hilas.lib'
CELL_TEMPLATE = 'min_inverter.template.lib'
LIB_TEMPLATE = 'head.template.lib'


def main():
    ap = argparse.ArgumentParser(description='Generates a *.lib file given cells in *.mag format')
    ap.add_argument('output', help='Path/name of the generated Liberty file')
    args = ap.parse_args()

    cell_names = [x.strip('.mag') for x in os.listdir(STD_CELLS_PATH) if x.endswith('.mag')]

    templateLoader = jinja2.FileSystemLoader('.')
    templateEnv = jinja2.Environment(
        loader=templateLoader,
        autoescape=jinja2.select_autoescape(
            disabled_extensions=('lib',),
            default_for_string=True,
            default=True,
        ))

    lib_template = templateEnv.get_template(str(LIB_TEMPLATE))
    cell_template = templateEnv.get_template(str(CELL_TEMPLATE))

    cell_block = []
    for cn in cell_names:
        cell_block.append(cell_template.render(cell_name=cn))

    result = lib_template.render(cells='\n\n'.join(cell_block))
    with open(args.output, 'w') as f:
        f.write(result)


if __name__ == '__main__':
    sys.exit(main())