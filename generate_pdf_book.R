library(rmarkdown)
library(bookdown)

bookdown::pdf_book(
  includes = includes(in_header = "latex/preamble.tex", before_body = "latex/before_body.tex"),
  latex_engine = "xelatex", # lualatex or xelatex
  citation_package = "none", # needs to be "none" in order to use the csl file
  keep_tex = TRUE, # keeps the .tex file
  toc_appendix = TRUE, # adds the appendix part to the toc
  dev = "cairo_pdf",
  toc = FALSE # deactivates default table of contents
  # highlight = pygments, # code highlighting
  # pandoc_args = list("--csl", "./csl/apa6.csl") # specifies the csl file to be used
  )

tinytex::latexmk(
  "docs/thesis.tex",
  engine = "xelatex",
  #bib_engine = c("bibtex", "biber"),
  engine_args = NULL, emulation = FALSE,
  max_times = 10, install_packages = emulation && tlmgr_available(),
  pdf_file = gsub("tex$", "pdf", file), clean = TRUE
  )
