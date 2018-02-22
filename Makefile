THIS = chalkdust-maths
HERE = $(shell pwd)
OUTPUT = output
OUT = $(HERE)/$(OUTPUT)
TMP = /tmp
MYTMP = $(TMP)/$(THIS)

TEXOUT = $(MYTMP)
STYOUT = $(MYTMP)

.PHONY: all ctan

all: sty doc ctan

ctan: doc
	mkdir -p $(OUTPUT);rm -rf $(MYTMP)/zip;mkdir -p $(MYTMP)/zip/$(THIS);cd $(MYTMP)/zip;cp $(HERE)/chalkdust-maths.tex $(HERE)/README.md $(TEXOUT)/chalkdust-maths.pdf $(HERE)/chalkdust-maths.dtx $(HERE)/chalkdust-maths.ins $(THIS);zip -r chalkdust-maths .;cp chalkdust-maths.zip $(OUT)

sty:
	mkdir -p $(STYOUT);latex -output-directory=$(STYOUT) chalkdust-maths.ins; cp $(STYOUT)/chalkdust-maths.sty $(OUTPUT);cp $(STYOUT)/chalkdust-maths.sty $(HERE)

doc:
	mkdir -p $(TEXOUT);pdflatex -output-directory=$(TEXOUT) chalkdust-maths.tex;cp $(TEXOUT)/chalkdust-maths.pdf $(OUTPUT)
