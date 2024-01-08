proof_base <- "https://proof-api.fredhutch.org"

make_url <- function(...) {
  file.path(proof_base, ...)
}
