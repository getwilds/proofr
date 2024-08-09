error_body <- function(response) {
  parsed <- resp_body_json(response)
  glue::glue(
    "Additional context: {parsed$message}"
  )
}
