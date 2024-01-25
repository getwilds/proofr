#' Cancel/stop PROOF Cromwell server
#'
#' @export
#' @references <https://github.com/FredHutch/proof-api#delete-cromwell-server>
#' @inheritSection proof_status Timeout
#' @return A list with a single field:
#' - `message` (character)
proof_cancel <- function() {
  response <- DELETE(
    make_url("cromwell-server"),
    proof_header(),
    timeout(proofr_env$timeout_sec)
  )
  # FIXME: better error handling - surface error messages
  stop_for_status(response)
  content(response, as = "parsed")
}
