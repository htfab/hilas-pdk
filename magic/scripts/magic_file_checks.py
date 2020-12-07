#! /usr/bin/env python3

import argparse
import sys
import os
import pathlib
import re

from difflib import get_close_matches


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


def edie(message, code=1):
    print(message)
    sys.exit(code)


def missing(inuse, path):
    avail = [item.rstrip('.mag') for item in os.listdir(path)]
    missing = []
    for mod in inuse:
        if mod not in avail:
            missing.append(mod)
    return (list(set(missing)), avail)


def print_missing(missing):
    [print('\n    {}'.format(mod)) for mod in missing]


def fix(target, inuse, missing, available):
    for m in missing:
        mats = get_close_matches(m.lower(), [a.lower() for a in available], n=1, cutoff=0.25)
        if mats:
            for a in available:
                if mats[0] == a.lower():
                    mats[0] = a
                    break
            print('{} is missing, but I found a close match: {}'.format(m, mats[0]))
            if confirm('Do you want to replace references to {} with {}?'.format(m, mats[0]), resp=False):
                rename_refs(target, m, mats[0])
        else:
            print('{} is missing, and I could not find a candidate match.'.format(m))
        print('')


def rename_refs(target, old_name, new_name):
    with open(target, 'r') as f:
        all_lines = f.readlines()
    for i, line in enumerate(all_lines):
        if re.match('^\s?use {}'.format(old_name), line):
            all_lines[i] = line.replace(old_name, new_name)
    with open(target, 'w') as f:
        f.writelines(all_lines)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('design', help="The name of the magic design to check.")
    ap.add_argument('--missing', '-m', action='store_true', help="Print missing submodules (same path).")
    ap.add_argument('--fix', '-f', action='store_true', help="Attempt to fix missing submodules.")
    ap.add_argument('--rename-refs', '-R', nargs=2, help="Rename references of <arg1> to <arg2>.")
    ap.add_argument('--used', '-u', action='store_true', help="Report submodules in use by file.")
    args = ap.parse_args()

    if not 'design' in args or not args.design:
        edie('missing/bad design file', 1)

    target = pathlib.Path(args.design)

    if not target.is_file():
        edie('missing/bad design file', 1)

    inuse = []
    with open(target, 'r') as f:
        for line in f.readlines():
            match = re.match('^\s?use (\w+)', line)
            if match:
                inuse.append(match.group(1))

    inuse = list(set(inuse))

    if args.rename_refs:
        print('renaming {} to {}'.format(args.rename_refs[0], args.rename_refs[1]))
        # rename_refs(target, args.rename_refs[0], args.rename_refs[1])
    if args.missing or args.fix:
        miss, avail = missing(inuse, target.parent)
        if not args.fix:
            print_missing(miss)
        elif args.fix:
            fix(target, inuse, miss, avail)

    elif args.used:
        for iu in inuse:
            print('    ' + iu)


if __name__ == '__main__':
    sys.exit(main())
