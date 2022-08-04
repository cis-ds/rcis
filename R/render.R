#' cfss_slides
#'
#' \lifecycle{deprecated} \cr
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

#' Default base size for \code{\link{ggplot}} objects
#'
#' Default base size for \code{\link{ggplot}} objects intended to render in lecture slides.
#'
#' @format A numeric value
#' @export
"base_size"

base_size <- 24

#' xaringan
#'
#' Function to generate slides for class using \code{\link[xaringan]{moon_reader}}
#'
#'
#' \lifecycle{deprecated} \cr
#' @importFrom magrittr "%>%"
#' @export
#'
xaringan <- function(){
  xaringan::moon_reader(
    css = c("default", "metropolis", "lucy-fonts"),
    lib_dir = "libs",
    nature = list(
      beforeInit = c("https://cfss.uchicago.edu/slides/macros.js",
                     "https://platform.twitter.com/widgets.js"),
      highlightLanguage = "r",
      highlightStyle = "github",
      highlightLines = TRUE,
      countIncrementalSlides = FALSE
    )
  )
}

#' xaringan_wide
#'
#' Function to generate slides for class using \code{\link[xaringan]{moon_reader}}.
#' Must pair with output from \code{xaringantheemer}
#'
#'
#' @importFrom magrittr "%>%"
#' @export
#'
xaringan_wide <- function(){
  xaringan::moon_reader(
    css = "xaringan-themer.css",
    nature = list(
      highlighStyle = "solarized-light",
      highlightLanguage = c("r"),
      highlightLines = TRUE,
      ratio = "16:9",
      countIncrementalSlides = FALSE
    )
  )
}
