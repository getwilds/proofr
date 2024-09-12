test_that("proof_cancel - success", {
  stub_registry_clear()
  stub_request("delete", make_url("cromwell-server")) |>
    to_return(
      body = jsonlite::toJSON(response_cancel_success, auto_unbox = TRUE),
      status = 200L,
      headers = list("Content-type" = "application/json")
    )

  enable(quiet = TRUE)

  withr::with_envvar(c("PROOF_TOKEN" = "notarealtoken"), {
    cancel_res <- proof_cancel()
  })

  expect_type(cancel_res, "list")
  expect_type(cancel_res$message, "character")
  expect_match(cancel_res$message, "cancelled")


  stub_registry_clear()
  disable(quiet = TRUE)
})

test_that("proof_cancel - not running, can not cancel", {
  stub_request("delete", make_url("cromwell-server")) |>
    to_return(
      body = jsonlite::toJSON(response_cancel_conflict, auto_unbox = TRUE),
      status = 409L,
      headers = list("Content-type" = "application/json")
    )

  enable(quiet = TRUE)

  withr::with_envvar(c("PROOF_TOKEN" = "notarealtoken"), {
    expect_error(proof_cancel(), "HTTP 409 Conflict")
    expect_error(proof_cancel(), "Additional context")
  })


  stub_registry_clear()
  disable(quiet = TRUE)
})
