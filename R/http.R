stop_for_message <- function(response) {
  if (http_error(response)) {
    parsed <- tryCatch(content(response), error = function(e) e)
    if (inherits(parsed, "error")) stop_for_status(response)
    if (!is.list(parsed)) stop_for_status(response)
    msg <- glue::glue(
      "{http_status(response)$reason}",
      " (HTTP {status_code(response)})",
      " {parsed$message}"
    )
    stop(msg, call. = FALSE)
  }
}
