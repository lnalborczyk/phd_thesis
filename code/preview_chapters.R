bookdown::preview_chapter(
  "02-chap2.Rmd",
  output_format = "bookdown::pdf_document2",
  # output_format = "bookdown::word_document2",
  output_file = paste0("thesis-chap2-", format(Sys.Date(), ("%d-%m-%y") ), ".pdf"),
  output_dir = "previews"
  # output_options = list(reference_docx = "word-style-ref.docx")
  )
