# library(tidyverse)
#
# raw_text <- readLines("docs/thesis.tex")
# #new_text <- gsub("\\oe", "\\\\oe", raw_text)
# new_text <- gsub("Lœvenbruck", "L\\\oe venbruck", raw_text)
# writeLines(new_text, con = "docs/thesis2.tex")

library(pandocfilters)

# example from https://cran.r-project.org/web/packages/pandocfilters/vignettes/pandocfilters.pdf

# raw_text <- readLines("docs/thesis.tex")
# raw_text <- system.file("docs/thesis.tex")

icon <- textConnection(pandoc_to_json("docs/thesis.tex", from = "latex") )
ocon <- textConnection("modified_ast", open = "w")

symbol <- function(key, value, ...) {

  if (key == "Str") {

    gsub("oe", "OE", value)

  }

}

filter(symbol, input = icon, output = ocon)
pandoc_from_json(modified_ast, to = "latex")
close(icon)
close(ocon)
