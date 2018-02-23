THIS = chalkdust-tex
HERE = $(shell pwd)
OUTPUT = $(HERE)
MYTMP = $(HERE)/tmp
TEXOUT = $(OUTPUT)
STYOUT = $(OUTPUT)

.PHONY: all ctan sty doc zip

all: sty doc ctan

ctan: sty doc zip

sty:
	mkdir -p $(STYOUT);latex -output-directory=$(STYOUT) chalkdust-tex.ins

doc:
	mkdir -p $(TEXOUT);pdflatex -output-directory=$(TEXOUT) chalkdust-tex.dtx

zip:
	mkdir -p $(OUTPUT);rm -rf $(MYTMP);mkdir -p $(MYTMP)/zip/$(THIS);cd $(MYTMP)/zip;cp $(HERE)/README.md $(TEXOUT)/chalkdust-tex.pdf $(HERE)/chalkdust-tex.dtx $(HERE)/chalkdust-tex.ins $(THIS);zip -r chalkdust-tex .;cp chalkdust-tex.zip $(OUTPUT)
