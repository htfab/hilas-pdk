#!/bin/bash

for f in $(find . -maxdepth 1 -iname "*.sch" -or -iname "*.sym" ); do
    #echo "found file $f"
    if [[ ! "$f" =~ ^sky130_hilas_ ]]; then

        oname="${f#./}"
        oname="${oname%.*}"

        newname=sky130_hilas_"${oname}"

        set -x
        python3 ../../../scripts/magic_gen.py --rename-xschem "${oname}:${newname}"
        unset -x

    fi
done
