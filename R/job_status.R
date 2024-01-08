#' Get PROOF API job status - is job running, what's its URL...
#'
#' @export
#' @references <https://github.com/FredHutch/proof-api#get-cromwell-server>
#' @return A list with slots:
#' - `canJobStart`
#' - `jobStatus`
#' - `cromwellUrl`
proof_job_status <- function() {
  response <- GET(make_url("cromwell-server"), proof_header())
  stop_for_status(response)
  content(response, as = "parsed")
}
