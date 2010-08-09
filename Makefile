# name: Sam Tetruashvili
# title: Makefile
# date created: Sat Nov 22 10:19:19 EST 2008
# description: Handles the compilation of The Book of Proofs.

# last modified: Mon Aug  9 00:10:05 PDT 2010

# LaTeX compilation macros.
LATEX = pdflatex
BIBTEX = bibtex

# Directory/repository macros.
ANDREW = stetruas@unix.andrew.cmu.edu
ATEMI = samt@atemi.cdm.cs.cmu.edu
WWW = ~/private/www
LOCALHOST = ~/sites
BACKUP = /Volumes/pooh
IPOD = /Volumes/10.0.0.2

# note: As new chapters are added this variable must be updated to include the
#       newly created chapter.
CHAPTERS = chapters/number-theory.tex chapters/probability-discrete.tex \
           chapters/probability-continuous.tex chapters/appendix-notation.tex \
           chapters/combinatorics.tex chapters/group-theory.tex \
           chapters/analysis.tex chapters/preliminaries.tex \
           chapters/references.tex
REFERENCES = refs/algebra.bib refs/analysis.bib refs/number-theory.bib \
             refs/preliminaries.bib refs/probability.bib

TITLE = bookofproofs

$(TITLE).pdf: $(TITLE).tex proofs-style.sty $(CHAPTERS) $(REFERENCES)
	$(LATEX) $(TITLE)
	$(BIBTEX) $(TITLE)
	$(LATEX) $(TITLE)
	$(LATEX) $(TITLE)
	open $(TITLE).pdf

www: $(TITLE).pdf
	cp $(TITLE).pdf $(WWW)/projects/$(TITLE).pdf
	cp $(TITLE).pdf $(LOCALHOST)/projects/$(TITLE).pdf
	scp $(WWW)/projects/$(TITLE).pdf $(ANDREW):www/projects
	scp $(WWW)/projects/$(TITLE).pdf $(ATEMI):public_html/projects

all: $(TITLE).pdf www backup

backup: clean
	if [ -s $(BACKUP) ]; then cp -r ~/private/math $(BACKUP)/documents; else printf "########## ERROR: $(BACKUP) not connected!!\n"; fi

update-backup: clean
	cp -r ~/private/math ~/downloads
	cp -r $(BACKUP)/documents/math ~/private

andrew: clean
	scp -r ~/private/math/bookofproofs $(ANDREW):private/math

update-andrew: clean
	cp -r ~/private/math ~/downloads
	scp -r $(ANDREW):private/math ~/private

ipod: $(TITLE).pdf
	cp -r $(TITLE).pdf $(IPOD)/books/$(TITLE).pdf
	cp -r TODO $(IPOD)/books/bookofproofs.TODO.txt

clean:
	rm *.pdf *.aux *.log *.out *.toc *.blg *.bbl
	rm chapters/*.aux

