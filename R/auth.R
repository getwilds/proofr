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
#' @param token (character) PROOF API token. optional
#' @return A `request` S3 class with the HTTP header that can be passed
#' to `httr::GET()`, `httr::POST()`, etc.
proof_header <- function(token = NULL) {
  add_headers(Authorization = paste0("Bearer ", find_token(token)))
}

#' Authenticate with PROOF API
#'
#' @export
#' @param username (character) HutchNet username
#' @param password (character) HutchNet password
#' @return A single token (character) for bearer authentication with
#' the PROOF API
#' @examples
#' # Sys.getenv("PROOF_TOKEN")
#' # x <- proof_authenticate("username", "password")
#' # Sys.getenv("PROOF_TOKEN")
proof_authenticate <- function(username, password) {
  response <- POST(make_url("authenticate"), body = list(
    username = username,
    password = password
  ), encode = "json")
  stop_for_status(response)
  parsed <- content(response, as = "parsed")
  token <- parsed$token
  Sys.setenv(PROOF_TOKEN = token)
  token
}
