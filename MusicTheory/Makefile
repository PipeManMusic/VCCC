CHAPTERS := $(sort $(wildcard chapters/*.md))
SCORE_SRCS := $(wildcard scores/*.ly)
SCORES_PDF := $(patsubst scores/%.ly,build/scores/%.cropped.pdf,$(SCORE_SRCS))
SCORES_SVG := $(patsubst scores/%.ly,build/scores/%.cropped.svg,$(SCORE_SRCS))

PANDOC ?= pandoc
LILYPOND ?= lilypond

TEMPLATE := templates/template.tex
CSS := styles/style-epub.css
FILTER := filters/lilypond-image.lua

.PHONY: all pdf epub scores clean

all: pdf epub

pdf: build/book.pdf

epub: build/book.epub

scores: $(SCORES_PDF) $(SCORES_SVG)

build:
	mkdir -p build

build/scores:
	mkdir -p build/scores

build/scores/%.cropped.pdf: scores/%.ly | build/scores
	$(LILYPOND) -I $(CURDIR) -dcrop --pdf -o build/scores/$* $<

build/scores/%.cropped.svg: scores/%.ly | build/scores
	$(LILYPOND) -I $(CURDIR) -dcrop -f svg -o build/scores/$* $<

build/book.pdf: $(CHAPTERS) $(SCORES_PDF) $(TEMPLATE) $(FILTER) | build
build/book.pdf: $(CHAPTERS) $(SCORES_PDF) $(TEMPLATE) $(FILTER) by-sa.eps | build
	$(PANDOC) $(CHAPTERS) \
		--template=$(TEMPLATE) \
		--top-level-division=chapter \
		--lua-filter=$(FILTER) \
		--pdf-engine=xelatex \
		--resource-path=.:build \
		-o $@

build/book.epub: $(CHAPTERS) $(SCORES_SVG) $(CSS) $(FILTER) | build
build/book.epub: $(CHAPTERS) $(SCORES_SVG) $(CSS) $(FILTER) by-sa.svg | build
	$(PANDOC) $(CHAPTERS) \
		--top-level-division=chapter \
		--css=$(CSS) \
		--lua-filter=$(FILTER) \
		--toc \
		--resource-path=.:build \
		-o $@

clean:
	rm -rf build