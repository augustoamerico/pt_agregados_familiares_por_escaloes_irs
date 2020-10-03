source(".Rprofile")

quiet = "--quiet" %in% commandArgs(FALSE)
formats = commandArgs(TRUE)

src = (function() {
  attr(body(sys.function()), 'srcfile')
})()$filename
if (is.null(src) || src == '') src = '.'
owd = setwd(dirname(src))

# provide default formats if necessary
if (length(formats) == 0) formats = c(
  'rmarkdown::html_document_base'
)

cmd = sprintf(
  "rmarkdown::render('gerar_timeline_agregados_familiares_escaloes_irs.Rmd', output_format = '%s', output_file = 'docs/index.html')", 
  formats, quiet)
res = bookdown:::Rscript(c('-e', shQuote(cmd)))

if (res != 0) stop('Failed to compile the book to ', formats)

#rmarkdown::render("gerar_timeline_agregados_familiares_escaloes_irs.Rmd", output_format = rmarkdown::html_document(), output_file = "docs/index.html")
#rmarkdown::render("gerar_timeline_agregados_familiares_escaloes_irs.Rmd", output_file = "docs/index.html")