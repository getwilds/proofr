#' Cancel/stop PROOF Cromwell server
#'
#' @export
#' @inheritParams proof_start
#' @inheritSection proof_status Timeout
#' @return On success, a list with a single field:
#' - `message` (character)
#'
#' If run when there's no Cromwell server running, an HTTP error
proof_cancel <- function(token = NULL) {
  request(make_url("cromwell-server")) |>
    req_method("DELETE") |>
    proof_header(token) |>
    req_timeout(proofr_env$timeout_sec) |>
    req_error(body = error_body) |>
    req_perform() |>
    resp_body_json()
}
