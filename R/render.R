#' cfss_slides
#'
#' Function to generate slides for class.
#'
#'
#' @export
#'
cfss_slides <- function(incremental = TRUE) {
  css <- system.file("reports/styles.css", package = "rcfss")
  revealjs::revealjs_presentation(theme = "simple",
                                  highlight = "pygments",
                                  incremental = incremental,
                                  transition = "fade",
                                  center = FALSE,
                                  css = css,
                                  reveal_options = list(center = FALSE,
                                                        previewLinks = TRUE))
}

#' cfss_notes
#'
#' Function to generate notes for class.
#'
#'
#' @export
#' @importFrom magrittr "%>%"
#'
cfss_notes <- function() {
  rmarkdown::html_document(theme = "readable",
                           highlight = "pygments",
                           toc = TRUE,
                           toc_float = TRUE)
}

#' Default base size for `ggplot()` objects
#'
#' Default base size for `ggplot()` objects intended to render in lecture slides.
#'
#' @format A numeric value
#' @export
"base_size"

base_size <- 24
