gitbook:
	cp docs/CNAME .
	Rscript _render.R "bookdown::gitbook"
	rm -rf docs 
	mv _book docs 
	mv CNAME docs
all:
	Rscript --quiet _render.R
