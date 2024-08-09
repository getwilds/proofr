#' Get information about PROOF server
#'
#' @export
#' @references <https://github.com/FredHutch/proof-api?tab=readme-ov-file#get-info>
#' @return A list with fields:
#' - `branch` (character): git branch of API
#' - `commit_sha` (character): SHA of the git commit of the API
#' - `short_commit_sha` (character): the first eight characters of `commit_sha`
#' - `commit_message` (character): the commit message of the API's most recent commit
#' - `tag` (character): tag of most recent commit; if this does not contain a hyphen, it's a release version
proof_info <- function() {
  response <- GET(
    make_url("info"),
    timeout(proofr_env$timeout_sec)
  )
  stop_for_message(response)
  content(response, as = "parsed")
}

