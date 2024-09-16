#' @keywords internal
#' @section Base URL for PROOF API:
#' The base URL for the PROOF API can be changed by setting the environment
#' variable `PROOF_API_BASE_URL`. It can be set for an R session or for
#' function by function use as we check that env var in each function call
#' to the API
"_PACKAGE"

## usethis namespace: start
#' @importFrom httr2 request req_perform req_headers
#' req_timeout req_body_json req_method req_error
#' resp_status resp_body_json
## usethis namespace: end
NULL
