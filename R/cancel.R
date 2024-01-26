#' Cancel/stop PROOF Cromwell server
#'
#' @export
#' @references <https://github.com/FredHutch/proof-api#delete-cromwell-server>
#' @inheritSection proof_status Timeout
#' @return On success, a list with a single field:
#' - `message` (character)
#'
#' If run when there's no Cromwell server running, an HTTP error
proof_cancel <- function() {
  response <- DELETE(
    make_url("cromwell-server"),
    proof_header(),
    timeout(proofr_env$timeout_sec)
  )
  stop_for_message(response)
  content(response, as = "parsed")
}
