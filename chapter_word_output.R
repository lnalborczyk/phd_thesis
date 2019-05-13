library(bookdown)

preview_chapter(
  input = "01-chap1.Rmd",
  output_format = "bookdown::word_document2",
  output_file = paste0("thesis-intro-", format(Sys.Date(), ("%d-%m-%y") ), ".docx")
  #output_dir = "chapter_preview"
  #new_session = TRUE
  #output_options = list(reference_docx = "word-style-ref.docx")
  )
