viewer=xdg-open
documents=$(wildcard *.md)
pdfs=$(patsubst %.md, %.pdf, $(documents))
font=Georgia
fontsize=12pt
margin=2cm
csl=plos

# images generated by Make (not static images)
images = 


.PHONY: all show clean

all: pdf

pdf: $(pdfs)

show: $(pdfs)
	$(viewer) $< 2>&1>/dev/null &

clean:
	rm -f *.pdf $(images)

%.pdf: %.md template.latex refs.bib $(images)
	pandoc -o $@ -V geometry:margin=$(margin) \
	--variable fontsize=$(fontsize) \
	--variable mainfont="$(font)" --latex-engine=xelatex \
	--bibliography refs.bib --csl csl/$(csl).csl \
	--template template.latex $<
