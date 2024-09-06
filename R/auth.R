find_token <- function(token = NULL) {
  if (!is.null(token)) {
    return(token)
  }
  token <- Sys.getenv("PROOF_TOKEN")
  if (identical(token, "")) {
    stop("token not found - see ?proof_authenticate")
  }
  token
}

#' Get header for PROOF API calls
#'
#' @export
#' @param req An `httr2` request. required
#' @param token (character) PROOF API token. optional
#' @return An `httr2_request` S3 class adding an HTTP header for
#' `Authorization` with the value in `token`
proof_header <- function(req, token = NULL) {
  req_headers(req, Authorization = paste0("Bearer ", find_token(token)))
}

#' Authenticate with PROOF API
#'
#' @export
#' @param username (character) HutchNet username
#' @param password (character) HutchNet password
#' @inheritSection proof_status Timeout
#' @return A single token (character) for bearer authentication with
#' the PROOF API
#' @details We strongly recommend to not supply `password` as plain text like
#' `proof_authenticate(username = "jane", password = "mypassword")`, but rather
#' pull in your password from an environment variable stored outside of R like
#' `proof_authenticate(username = "jane", password = Sys.getenv("HUTCH_PWD"))`
proof_authenticate <- function(username, password) {
  assert(username, "character")
  assert(password, "character")

  request(make_url("authenticate")) |>
    req_body_json(list(
      username = username,
      password = password
    )) |>
    req_timeout(proofr_env$timeout_sec) |>
    req_perform() |>
    resp_body_json() |>
    {\(x) x$token}()
}
