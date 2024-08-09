
make_url <- function(...) {
  proof_base <- Sys.getenv("PROOF_API_BASE_URL",
                           "https://proof-api.fredhutch.org")
  file.path(proof_base, ...)
}

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!inherits(x, y)) {
      stop(deparse(substitute(x)), " must be of class ",
        paste0(y, collapse = ", "),
        call. = FALSE
      )
    }
  }
}
