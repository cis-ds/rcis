#' cfss_document
#'
#' Function to generate slides/notes/etc. for class.
#'
#' @param inputFile Rmd file to be rendered
#' @param encoding
#'
#' @export
#'
cfss_document <- function(inputFile, encoding) {
  out_dir <- sub(".*_", "", tools::file_path_sans_ext(inputFile));
  if(out_dir == "slides") {
    out_format <- "revealjs::revealjs_presentation"
  } else {
    out_format <- "html_document"
  }
  rmarkdown::render(inputFile,
                    encoding = encoding,
                    output_file = file.path(dirname(inputFile),
                                            out_dir,
                                            gsub(".Rmd", ".html", basename(inputFile))),
                    output_format = out_format)
}

