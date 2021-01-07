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

all:
	echo "making all"
	$(SCRIPTS)/magic_gen.py \
		-g $(REF_ROOT)/gds \
		-t $(REF_ROOT)/_templef \
		-e $(REF_ROOT)/lef/$(CELL_LIB).lef \
		-i $(REF_ROOT)/lib/$(CELL_LIB).lib \
		-s $(REF_ROOT)/spice \
		$(MAG_ROOT)
	make pins

gds: $(MAG_CELLS)
	echo "extracting gds"
	$(SCRIPTS)/magic_gen.py \
		-g $(REF_ROOT)/gds \
		$(MAG_ROOT)

lef: $(MAG_CELLS)
	echo "extracting lef views"
	$(SCRIPTS)/magic_gen.py \
		-t $(REF_ROOT)/_templef \
		-e $(REF_ROOT)/lef/$(CELL_LIB).lef \
		$(MAG_ROOT)

lib: $(MAG_CELLS)
	echo "making lib file"
	$(SCRIPTS)/magic_gen.py \
		-t $(REF_ROOT)/_templef \
		-e $(REF_ROOT)/lef/$(CELL_LIB).lef \
		-i $(REF_ROOT)/lib/$(CELL_LIB).lib \
		$(MAG_ROOT)

spice: $(MAG_CELLS)
	echo "making lib file"
	$(SCRIPTS)/magic_gen.py \
		-s $(REF_ROOT)/spice \
		$(MAG_ROOT)

pin-md: $(MAG_CELLS)
	@$(HILAS_ROOT)/scripts/magic_gen.py -p $(MAG_ROOT)/README.md $(MAG_ROOT)

pins: pin-md
	bash -c 'cat $(HILAS_ROOT)/summary.md <(echo; echo; echo;) \
	 $(MAG_ROOT)/README.md > $(HILAS_ROOT)/README.md'


# vvvvvvvvv         CLEANING          vvvvvvvvvvvvvv

.PHONY: clean
clean: clean-gds clean-lef clean-lib clean-pins clean-spice clean-tlef

.PHONY: clean-gds
clean-gds:
	-rm $(REF_ROOT)/gds/*.gds

.PHONY: clean-lef
clean-lef:
	-rm $(REF_ROOT)/lef/*.lef

.PHONY: clean-tlef
clean-tlef:
	-rm $(REF_ROOT)/_templef/*.lef

.PHONY: clean-lib
clean-lib:
	-rm $(REF_ROOT)/lib/*.lib

.PHONY: clean-pins
clean-pins:
	-rm $(MAG_ROOT)/README.md
	-rm $(HILAS_ROOT)/README.md
	-cp $(HILAS_ROOT)/summary.md $(HILAS_ROOT)/README.md

.PHONY: clean-spice
clean-spice:
	-rm $(REF_ROOT)/spice/*.spice