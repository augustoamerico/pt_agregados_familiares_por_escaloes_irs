html:
	Rscript --quiet _render.R "rmarkdown::html_document_base"

html_document:
	Rscript --quiet _render.R "rmarkdown::html_document"

pdf:
	Rscript --quiet _render.R "bookdown::pdf_book"

gitbook:
	cp docs/CNAME .
	Rscript _render.R "bookdown::gitbook"
	rm -rf docs 
	mv _book docs 
	mv CNAME docs
all:
	Rscript --quiet _render.R
