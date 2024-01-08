#' Cancel/stop PROOF Cromwell server
#'
#' @export
#' @references <https://github.com/FredHutch/proof-api#delete-cromwell-server>
#' @return A list with a single field:
#' - `message` (character)
proof_cancel <- function() {
  response <- DELETE(make_url("cromwell-server"), proof_header())
  # FIXME: better error handling - surface error messages
  stop_for_status(response)
  content(response, as = "parsed")
}
