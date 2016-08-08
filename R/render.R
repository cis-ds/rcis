#' cfss_slides
#'
#' Function to generate slides for class.
#'
#' @param inputFile Rmd file to be rendered
#' @param encoding
#'
#' @export
#'
cfss_slides <- function(inputFile, encoding) {
  # call revealjs to generate output format
  out_format <- revealjs::revealjs_presentation(theme = "simple",
                                                highlight = "pygments",
                                                incremental = TRUE,
                                                transition = "fade",
                                                center = FALSE,
                                                # css = css,
                                                reveal_options = list(center = FALSE,
                                                                      previewLinks = TRUE))

  # render using rmarkdown
  rmarkdown::render(inputFile,
                    encoding = encoding,
                    output_format = out_format)
}

#' cfss_notes
#'
#' Function to generate notes for class.
#'
#' @param inputFile Rmd file to be rendered
#' @param encoding
#'
#' @export
#'
cfss_notes <- function(inputFile, encoding) {
  # call the base html_document function
  out_format <- rmarkdown::html_document(theme = "simple",
                           highlight = "pygments",
                           toc = TRUE,
                           toc_float = TRUE)

  # render using rmarkdown
  rmarkdown::render(inputFile,
                    encoding = encoding,
                    output_format = out_format)
}

