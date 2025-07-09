#' Start PROOF Cromwell server
#'
#' @export
#' @param slurm_account (character) PI name in the form `last_f`, where last
#' is the last name of the PI and f is the first name, e.g., "Jane Doe"
#' would be `doe_j`; only needed if user is in more than one SLURM account.
#' optional
#' @param token (character) token for bearer authentication with
#' the PROOF API. default is `NULL`. we do not recommend passing your token
#' here as a string. Either pass it using [Sys.getenv()] or save your
#' token as an env var and then passing nothing to this param and we'll find
#' it
#' @param regulated_data (logical) whether to use a scratch directory
#' in regulated storage.
#' @details Does not return PROOF/Cromwell server URL, for that you have to
#' periodically call [proof_status()], or wait for the email from the
#' PROOF API
#' @inheritSection proof_status Timeout
#' @section Cromwell Server uptime:
#' The Cromwell server started by this function will run for 7 days
#' and then shut down. However, your data persists across different
#' instances of Cromwell servers created by running this function.
#' You do however need to have a Cromwell server up and running to
#' retrieve data.
#' @return A list with fields:
#' - `job_id` (character) - the job ID =
#' - `info` (character) - message
proof_start <- function(
  slurm_account = NULL,
  token = NULL,
  regulated_data = FALSE
) {
  request(make_url("cromwell-server")) |>
    req_body_json(list(
      slurm_account = slurm_account,
      regulated_data = regulated_data
    )) |>
    proof_header(token) |>
    req_timeout(proofr_env$timeout_sec) |>
    req_error(body = error_body) |>
    req_perform() |>
    resp_body_json()
}
