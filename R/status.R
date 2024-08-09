#' Get PROOF API job status - is job running, what's its URL...
#'
#' @export
#' @importFrom cli cli_progress_bar cli_progress_update
#' @inheritParams proof_start
#' @param wait (logical) if `TRUE` wait for the server to be ready to
#' interact with. if `FALSE` return immediately, then you'll want to call
#' this function again until you get the server URL
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
proof_status <- function(wait = FALSE, token = NULL) {
  if (wait) fetch_wait(token) else fetch_status(token)
}

fetch_status <- function(token = NULL) {
  request(make_url("cromwell-server")) |>
    proof_header(token) |>
    req_timeout(proofr_env$timeout_sec) |>
    req_error(body = error_body) |>
    req_perform() |>
    resp_body_json()
}

fetch_wait <- function(token) {
  cli_progress_bar("Checking server status ...")
  not_up <- TRUE
  while (not_up) {
    tmp <- fetch_status(token = token)
    if (tmp$jobStatus == "RUNNING" && !is.null(tmp$cromwellUrl)) {
      not_up <- FALSE
    }
    cli_progress_update()
  }
  tmp
}
