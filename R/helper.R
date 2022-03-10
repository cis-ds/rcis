#' Convert log-odds to predicted probabilities
#'
#' \lifecycle{deprecated} \cr
#' Function to convert log-odds to predicted probabilities.
#'
#' @param x A vector of log-odds.
#' @export
logit2prob <- function(x){
  exp(x) / (1 + exp(x))
}


#' Convert predicted probabilities to log-odds
#'
#' \lifecycle{deprecated} \cr
#' Function to convert predicted probabilities to log-odds.
#'
#' @param x A vector of predicted probabilities.
#' @export
prob2odds <- function(x){
  x / (1 - x)
}


#' Convert probabilities to log-odds
#'
#' \lifecycle{deprecated} \cr
#' Function to convert probabilities to log-odds.
#'
#' @param x A vector of predicted probabilities.
#' @export
prob2logodds <- function(x){
  log(prob2odds(x))
}

#' Calculate error rate for a classification model
#'
#' \lifecycle{deprecated} \cr
#' Function to calculate error rate for a classification model.
#'
#' @param model Model estimated using \code{\link[randomForest]{randomForest}}.
#' @param data Dataset used to calculate test error rate.
#' @name err-rate
#' @export
err.rate.rf <- function(model, data) {
  data <- as_tibble(data)
  response <- as.character(model$terms[[2]])

  pred <- predict(model, newdata = data, type = "response")
  actual <- data[[response]]

  return(mean(pred != actual, na.rm = TRUE))
}

#' @export
#' @rdname err-rate
err.rate.tree <- function(model, data) {
  data <- as_tibble(data)
  response <- as.character(model$terms[[2]])

  pred <- predict(model, newdata = data, type = "class")
  actual <- data[[response]]

  return(mean(pred != actual, na.rm = TRUE))
}

#' Generate 95\% confidence intervals
#'
#' \lifecycle{deprecated} \cr
#' Function to generate 95\% confidence intervals using the output
#' from \code{\link[broom]{augment}}. \code{\link{add_ci}} generates 95% confidence intervals
#' using the fitted values and standard errors, and \code{\link{plot_ci}} generates
#' a \code{\link[ggplot2]{ggplot}} line chart.
#'
#' @param df_augment Output of \code{\link[broom]{augment}}.
#' @param df_ci Output of \code{\link{add_ci}}.
#' @param x Name of variable to plot on the x-axis, passed as a string.
#' @name ci
#' @export
#'
add_ci <- function(df_augment) {
  df_augment %>%
    mutate(.fitted.low = .fitted - 1.96 * .se.fit,
           .fitted.high = .fitted + 1.96 * .se.fit)
}

#' @export
#' @rdname ci
plot_ci <- function(df_ci, x){
  ggplot(df_ci, aes_string(x, ".fitted")) +
    geom_line() +
    geom_line(aes(y = .fitted.low), linetype = 2) +
    geom_line(aes(y = .fitted.high), linetype = 2)
}

