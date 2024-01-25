proofr_env <- new.env() # nocov start

.onLoad <- function(libname, pkgname) {
  # use the same timezone throughout the package
  proofr_env$timeout_sec <<- 5
} # nocov end
