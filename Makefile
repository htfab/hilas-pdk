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
	$(SCRIPTS)/magic_gen.py \
		-g \
		-t \
		-e \
		-i \
		-s \
		-v \
		-m \
		-n \
		-Y

force: clean-all
	$(SCRIPTS)/magic_gen.py -F -L -g -t -e -i -s -v -m -n -Y

refresh: clean-all
	$(SCRIPTS)/magic_gen.py --refresh

check:
	$(SCRIPTS)/magic_gen.py -C -L

gds: $(MAG_CELLS)
	$(SCRIPTS)/magic_gen.py -g

lef: $(MAG_CELLS)
	$(SCRIPTS)/magic_gen.py -t -e

lib: $(MAG_CELLS)
	$(SCRIPTS)/magic_gen.py -t -e -i

spice: $(MAG_CELLS)
	$(SCRIPTS)/magic_gen.py -s

markdown: lef
	$(SCRIPTS)/magic_gen.py -m

nosynth:
	$(SCRIPTS)/magic_gen.py -n -F

lvs:
	$(SCRIPTS)/magic_gen.py --lvs

# vvvvvvvvv         CLEANING          vvvvvvvvvvvvvv

.PHONY: clean
clean: clean-all

.PHONY: clean-all
clean-all: clean-gds clean-lef clean-tlef clean-lib clean-spice clean-verilog clean-markdown

.PHONY: clean-markdown
clean-markdown: clean-cell-details clean-cell-summary clean-readme

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

.PHONY: clean-spice
clean-spice:
	-rm $(REF_ROOT)/spice/*.spice

.PHONY: clean-verilog
clean-verilog:
	-rm $(REF_ROOT)/verilog/*.v

.PHONY: clean-cell-details
clean-cell-details:
	-rm $(REF_ROOT)/CELL_DETAILS.md

.PHONY: clean-cell-summary
clean-cell-summary:
	-rm $(REF_ROOT)/README.md
	-rm $(REF_ROOT)/CELL_SUMMARY.md

.PHONY: clean-readme
clean-readme:
	-rm $(HILAS_ROOT)/README.md
	-cp $(SCRIPTS)/templates/README.md $(HILAS_ROOT)/README.md
