#' Get PROOF API job status - is job running, what's its URL...
#'
#' @export
#' @references <https://github.com/FredHutch/proof-api#get-cromwell-server>
#' @section Timeout:
#' If the PROOF API is unavailable, this function will timeout after
#' 5 seconds. Contact the package maintainer if you get a timeout error.
#' See [proof_timeout()].
#' @return A list with fields:
#' - `canJobStart` (logical): can a job to make a Cromwell server be started?
#' `FALSE` if server already running; `TRUE` if server not running
#' - `jobStatus` (character): status of the job that controls the Cromwell
#' server. e.g., "RUNNING". `NULL` if server not running
#' - `cromwellUrl` (character): the URL for the Cromwell server. `NULL` if
#' server not running
#' - `jobInfo` (list): metadata on the Cromwell server. All slots `NULL`
#' if server not running
proof_status <- function() {
  response <- GET(
    make_url("cromwell-server"),
    proof_header(),
    timeout(proofr_env$timeout_sec)
  )
  stop_for_status(response)
  content(response, as = "parsed")
}
