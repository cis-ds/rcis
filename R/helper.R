#' Convert log-odds to predicted probabilities
#'
#' Function to convert log-odds to predicted probabilities.
#'
#' @param x A vector of log-odds.
#' @export
logit2prob <- function(x){
  exp(x) / (1 + exp(x))
}


#' Convert predicted probabilities to log-dds
#'
#' Function to convert predicted probabilities to log-odds.
#'
#' @param x A vector of predicted probabilities.
#' @export
prob2odds <- function(x){
  x / (1 - x)
}


#' Convert probabilities to log-odds
#'
#' Function to convert probabilities to log-odds.
#'
#' @param x A vector of predicted probabilities.
#' @export
prob2logodds <- function(x){
  log(prob2odds(x))
}
