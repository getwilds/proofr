#' Start PROOF Cromwell server
#'
#' @export
#' @param pi_name (character) PI name in the form last_f; only needed if user
#' is in more than one SLURM account
#' @references <https://github.com/FredHutch/proof-api#post-cromwell-server>
#' @details Does not return PROOF/Cromwell server URL, for that you have to
#' periodically call [proof_status()], or wait for the email from the
#' PROOF API
#' @return A list with fields:
#' - `job_id` (character)
#' - `info` (character)
proof_start <- function(pi_name = NULL) {
  response <- POST(
    make_url("cromwell-server"),
    proof_header(),
    body = list(pi_name = pi_name),
    encode = "json"
  )
  # FIXME: better error handling - surface error messages
  stop_for_status(response)
  content(response, as = "parsed")
}
