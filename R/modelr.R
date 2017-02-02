#' Compute model quality for a given dataset
#'
#' \code{mse} is the mean-squared-error. Based on \code{\link[modelr]{rmse}}.
#' \code{mse.glm} works for \code{\link{glm}} models with binary response variables.
#'
#' @param model A model
#' @param data The dataset
#' @name model-quality-rcfss
#' @export
#' @examples
#' mod <- lm(mpg ~ wt, data = mtcars)
#' mse(mod, mtcars)
mse <- function (model, data){
  x <- modelr:::residuals(model, data)
  mean(x ^ 2, na.rm = TRUE)
}

#' @export
#' @rdname model-quality-rcfss
mse.glm <- function (model, data){
  residuals.glm <- function(model, data) {
    modelr:::response(model, data) - stats::predict(model, data, type = "response")
  }

  x <- residuals(model, data)
  mean(x^2, na.rm = TRUE)
}
