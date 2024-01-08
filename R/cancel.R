#' Delete PROOF Cromwell server
#'
#' @export
#' @references <https://github.com/FredHutch/proof-api#delete-cromwell-server>
#' @details Does not return PROOF/Cromwell server URL, for that you have to
#' periodically call [proof_job_status()], or wait for the email from the
#' PROOF API
#' @return A list with fields `job_id` and `info`
proof_job_cancel <- function() {
  response <- DELETE(make_url("cromwell-server"), proof_header())
  # FIXME: better error handling - surface error messages
  stop_for_status(response)
  content(response, as = "parsed")
}
