report <- "src/papg.Rmd"

cat("iterando a linha", linha)

render(report, output_format = c("pdf_document", "word_document"), output_file = linha, output_dir = "./output")