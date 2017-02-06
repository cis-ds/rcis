#' Convert log-odds to predicted probabilities
#'
#' Function to convert log-odds to predicted probabilities.
#'
#' @param x A vector of log-odds.
#' @export
logit2prob <- function(x){
  exp(x) / (1 + exp(x))
}
