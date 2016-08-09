#' cfss_slides
#'
#' Function to generate slides for class.
#'
#'
#' @export
#'
cfss_slides <- function() {
  css <- system.file("reports/styles.css", package = "rcfss")
  revealjs::revealjs_presentation(theme = "simple",
                                  highlight = "pygments",
                                  incremental = TRUE,
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
cfss_notes <- function(keep_md = FALSE) {
  bib <- system.file("reports/references.bib", package = "rcfss")
  csl <- system.file("reports/american-political-science-association.csl", package = "rcfss")

  rmarkdown::html_document(theme = "readable",
                           highlight = "pygments",
                           toc = TRUE,
                           toc_float = TRUE,
                           keep_md = keep_md,
                           pandoc_args = c(rbind("--bibliography",
                                                 bib),
                                           rbind("--filter",
                                                 rmarkdown:::pandoc_citeproc()),
                                           rbind("--csl",
                                                 csl)))
}
