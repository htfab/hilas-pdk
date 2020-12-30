SHELL = /usr/bin/env bash

HILAS_ROOT != pwd
CELL_LIB = sky130_hilas_sc
REF_ROOT = ${HILAS_ROOT}/libs.ref/${CELL_LIB}
TECH_ROOT = $(HILAS_ROOT)/libs.tech
MAG_ROOT = $(REF_ROOT)/mag
MAG_CELLS = $(wildcard $(MAG_ROOT)/*.mag)
SCRIPTS = $(HILAS_ROOT)/scripts

export MAGICRC = $(TECH_ROOT)/magic/sky130A.magicrc
export TECHFILE = $(TECH_ROOT)/magic/sky130A.tech

.DEFAULT_GOAL := all

all: gds lef lib pins

gds: $(MAG_CELLS)
	echo "extracting gds"
	$(SCRIPTS)/gen_gds $(MAG_ROOT) $(REF_ROOT)/gds

lef: $(MAG_CELLS)
	echo "extracting lef views"
	$(SCRIPTS)/gen_lef $(MAG_ROOT) $(REF_ROOT)/lef

lib: $(MAG_CELLS)
	echo "making lib file"
	$(SCRIPTS}/gen_libfile.py $(REF_ROOT)/lef $(REF_ROOT)/lib/sky130A_hilas.lib

pin-md: $(MAG_CELLS)
	@$(HILAS_ROOT)/scripts/make_pin_markdown -o $(MAG_ROOT)/README.md -m $(MAG_CELLS)

pins: pin-md
	bash -c 'cat $(HILAS_ROOT)/summary.md <(echo; echo; echo;) \
	 $(MAG_ROOT)/README.md > $(HILAS_ROOT)/README.md'


# vvvvvvvvv         CLEANING          vvvvvvvvvvvvvv

.PHONY: clean
clean: clean-gds clean-lef clean-lib clean-pins

.PHONY: clean-gds
clean-gds:
	-rm $(REF_ROOT)/gds/*.gds

.PHONY: clean-lef
clean-lef:
	-rm $(REF_ROOT)/lef/*.lef

.PHONY: clean-lib
clean-lib:
	-rm $(REF_ROOT)/lib/*.lib

.PHONY: clean-pins
clean-pins:
	-rm $(MAG_ROOT)/README.md
	-rm $(HILAS_ROOT)/README.md
	-cp $(HILAS_ROOT)/summary.md $(HILAS_ROOT)/README.md
