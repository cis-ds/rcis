#' cfss_slides
#'
#' Function to generate slides for class.
#'
#'
#' @export
#'
cfss_slides <- function() {
  revealjs::revealjs_presentation(theme = "simple",
                                  highlight = "pygments",
                                  incremental = TRUE,
                                  transition = "fade",
                                  center = FALSE,
                                  # css = css,
                                  reveal_options = list(center = FALSE,
                                                        previewLinks = TRUE))
}

#' cfss_notes
#'
#' Function to generate notes for class.
#'
#'
#' @export
#'
cfss_notes <- function() {
  rmarkdown::html_document(theme = "readable",
                           highlight = "pygments",
                           toc = TRUE,
                           toc_float = TRUE)
}

