#! /usr/bin/env python3

import argparse
import os
import re
from pexpect.replwrap import REPLWrapper

from subprocess import run
from pathlib import Path, PurePath


# first argument is path to magic files


def edie(msg, code=1):
    print(msg)
    exit(code)


def newmagic():
    try:
        return REPLWrapper('magic -dnull -noconsole -rcfile "{}" -T "{}"'.format(
            os.getenv('MAGICRC'), os.getenv('TECHFILE')),
            orig_prompt='%', prompt_change=None)
    except:
        edie('couldn\'t start Magic')


def do_it(source_file, magic):
    if not magic.child.isalive():
        magic = newmagic()

    result = ''
    result += magic.run_command('drc off')
    result += magic.run_command('load "{}" -force'.format(source_file))
    result += magic.run_command('drc off')
    result += magic.run_command('gds readonly true')
    result += magic.run_command('gds rescale false')
    result += magic.run_command('gds merge')
    result += magic.run_command('gds flatten')
    result += magic.run_command('gds write')
    # magic.run_command('quit -noprompt')
    return magic, result


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('mag_src', help='Path to directory containing Magic cell source files')
    ap.add_argument('target', help='Directory in which to put GDS output')

    args = ap.parse_args()

    src_dir = Path(args.mag_src)
    targ_file = Path(args.target)

    try:
        assert src_dir.is_dir()
    except AssertionError:
        edie('source path should be a directory containing .mag Magic files')

    source_files = list(src_dir.glob('*.mag'))

    try:
        assert source_files is not None
    except AssertionError:
        edie('didn\'t find any *.mag files on the source path')

    try:
        assert targ_file.is_dir()
    except AssertionError:
        edie('Target argument should be a path to put all \'*.gds\' files.')

    try:
        with open(targ_file / 'testfile', 'w') as f:
            f.write('')
        os.remove(targ_file / 'testfile')
    except:
        edie('problem writing to destination dir')

    os.chdir(targ_file)
    successes = [True] * len(source_files)

    magic = newmagic()

    for i, f in enumerate(source_files):
        try:
            print("Generating GDS from: {}".format(f))
            magic, result = do_it(f, magic)

        except BaseException:
            print("[ERROR] There was a problem during the processing of {}:".format(f))
            print(result)
            successes[i] = False

        if not magic.child.isalive():
            print("[ERROR] There was a problem during the processing of {}: ".format(f))
            print(result)
            successes[i] = False


if __name__ == '__main__':
    exit(main())
