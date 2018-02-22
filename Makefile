THIS = maths
HERE = $(shell pwd)
OUTPUT = output
OUT = $(HERE)/$(OUTPUT)
TMP = /tmp
MYTMP = $(TMP)/$(THIS)

TEXOUT = $(MYTMP)
STYOUT = $(MYTMP)

.PHONY: all ctan

all: sty doc ctan

ctan: sty doc
	mkdir -p $(OUTPUT);rm -rf $(MYTMP)/zip;mkdir -p $(MYTMP)/zip;cd $(MYTMP)/zip;cp $(TEXOUT)/README.md $(TEXOUT)/maths.pdf $(STYOUT)/maths.sty .;zip -r ctan .;cp ctan.zip $(OUT)

sty:
	mkdir -p $(STYOUT);latex -output-directory=$(STYOUT) maths.ins

doc:
	mkdir -p $(TEXOUT);pdflatex -output-directory=$(TEXOUT) maths.tex;cp README.md $(TEXOUT)
