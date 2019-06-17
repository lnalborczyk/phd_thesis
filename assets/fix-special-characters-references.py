library(tidyverse)
library(bibtex)

#bib <- read.bib("bib/thesis.bib")
#new_bib <- gsub("Å", "\\oe", bib)
#write.bib(new_bib, "bib/thesis2.bib")

raw_text <- readLines("bib/thesis.bib")
new_text <- gsub("\\oe", "\\\\oe", raw_text)
writeLines(new_text, con = "bib/thesis.bib")

from panflute import *

def fix_apa_ampersands(elem, doc):
  if type(elem) == Cite:
    # Cite elements consist of text and citations.
    # Replace ampersand with `and` if all the citations are inline.
    all_inline = all([x.mode == "AuthorInText" for x in elem.citations])
    if all_inline:
        # elem.replace_keyword("&", Str("and"))
        elem.replace_keyword("œ", Str("\oe"))
  else:
    return None

def prepare(doc):
    pass

def finalize(doc):
    pass

def main(doc = None):
    return run_filter(fix_apa_ampersands, prepare = prepare,
                      finalize = finalize, doc = doc)

if __name__ == '__main__':
    main()
