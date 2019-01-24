#' Mean squared error
#'
#' @param data
#' @param ...
#'
#' @return
#' @export
#'
mse <- function(data, ...) {
  UseMethod("mse")
}

#' @export
#' @rdname mse
mse.data.frame <- function(data, truth, estimate, na_rm = TRUE, ...) {

  metric_summarizer(
    metric_nm = "mse",
    metric_fn = mse_vec,
    data = data,
    truth = !! rlang::enquo(truth),
    estimate = !! rlang::enquo(estimate),
    na_rm = na_rm,
    ...
  )

}

#' @export
#' @rdname mse
mse_vec <- function(truth, estimate, na_rm = TRUE, ...) {

  mse_impl <- function(truth, estimate) {
    mean((truth - estimate) ^ 2)
  }

  metric_vec_template(
    metric_impl = mse_impl,
    truth = truth,
    estimate = estimate,
    na_rm = na_rm,
    cls = "numeric",
    ...
  )

}
