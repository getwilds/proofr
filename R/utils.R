proof_base <- "https://proof-api.fredhutch.org"

make_url <- function(...) {
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
