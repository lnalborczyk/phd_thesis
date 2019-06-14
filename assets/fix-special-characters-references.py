
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
