viewer = evince
document_name = document
images = 


.PHONY: all show clean

all: $(document_name).pdf

show: $(document_name).pdf
	$(viewer) $< 2>&1>/dev/null &

$(document_name).pdf: $(document_name).md $(document_name).latex refs.bib $(images)
	pandoc -o $@ -V geometry:margin=2.5cm --variable fontsize=12pt \
	--bibliography refs.bib --csl csl/default.csl --template $(document_name).latex $<

clean:
	rm -f $(document_name).pdf $(images)