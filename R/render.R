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

#' xaringan_theme
#'
#' Generate custom CSS theme using \code{\link[xaringanthemer]{style_duo_accent}}.
#'
#'
#' @import xaringanthemer
#' @export
#'
xaringan_theme <- function(){
  xaringanthemer::style_duo_accent(
    primary_color = "#800000",
    secondary_color = "#EAAA00",
    inverse_header_color = "#464A53",
    black_color = "#464A53",
    header_font_google = xaringanthemer::google_font("Atkinson Hyperlegible"),
    text_font_google = xaringanthemer::google_font("Atkinson Hyperlegible"),
    code_font_google = xaringanthemer::google_font("Source Code Pro"),
    base_font_size = "24px",
    code_font_size = "20px",
    # title_slide_background_image = "https://github.com/uc-dataviz/course-notes/raw/main/images/hexsticker.svg",
    # title_slide_background_size = "contain",
    # title_slide_background_position = "top",
    header_h1_font_size = "2rem",
    header_h2_font_size = "1.75rem",
    header_h3_font_size = "1.5rem",
    extra_css = list(
      "h1" = list("margin-block-start" = "0.4rem",
                  "margin-block-end" = "0.4rem"),
      "h2" = list("margin-block-start" = "0.4rem",
                  "margin-block-end" = "0.4rem"),
      "h3" = list("margin-block-start" = "0.4rem",
                  "margin-block-end" = "0.4rem"),
      ".tiny" = list("font-size" = "70%"),
      ".small" = list("font-size" = "90%"),
      ".midi" = list("font-size" = "150%"),
      ".tiny .remark-code" = list("font-size" = "70%"),
      ".small .remark-code" = list("font-size" = "90%"),
      ".midi .remark-code" = list("font-size" = "150%"),
      ".large" = list("font-size" = "200%"),
      ".xlarge" = list("font-size" = "600%"),
      ".huge" = list("font-size" = "400%",
                     "font-family" = "'Montserrat', sans-serif",
                     "font-weight" = "bold"),
      ".hand" = list("font-family" = "'Gochi Hand', cursive",
                     "font-size" = "125%"),
      ".task" = list("padding-right"    = "10px",
                     "padding-left"     = "10px",
                     "padding-top"      = "3px",
                     "padding-bottom"   = "3px",
                     "margin-bottom"    = "6px",
                     "margin-top"       = "6px",
                     "border-left"      = "solid 5px #F1DE67",
                     "background-color" = "#F3D03E"),
      ".pull-left" = list("width" = "49%",
                          "float" = "left"),
      ".pull-right" = list("width" = "49%",
                           "float" = "right"),
      ".pull-left-wide" = list("width" = "70%",
                               "float" = "left"),
      ".pull-right-narrow" = list("width" = "27%",
                                  "float" = "right"),
      ".pull-left-narrow" = list("width" = "27%",
                                 "float" = "left"),
      ".pull-right-wide" = list("width" = "70%",
                                "float" = "right"),
      ".blue" = list(color = "#2A9BB7"),
      ".purple" = list(color = "#a493ba"),
      ".yellow" = list(color = "#f1de67"),
      ".gray" = list(color = "#464a53")
    )
  )
}

