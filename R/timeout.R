#' Set the timeout for all requests to the PROOF API
#'
#' @export
#' @param sec (integer/numeric) number of seconds after which
#' requests will timeout. default: 10 sec (10000 ms)
#' @references <https://httr.r-lib.org/reference/timeout.html>
#' @return nothing, side effect of setting the timeout for requests
proof_timeout <- function(sec = 10) {
  assert(sec, c("integer", "numeric"))
  proofr_env$timeout_sec <- sec
}
