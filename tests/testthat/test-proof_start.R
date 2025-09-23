test_that("proof_start - success", {
  stub_request("post", make_url("cromwell-server")) |>
    to_return(
      body = jsonlite::toJSON(response_start_success, auto_unbox = TRUE),
      status = 200L,
      headers = list("Content-type" = "application/json")
    )

  enable(quiet = TRUE)

  withr::with_envvar(c("PROOF_TOKEN" = "notarealtoken"), {
    start_res <- proof_start()
  })

  expect_type(start_res, "list")
  expect_type(start_res$job_id, "character")
  expect_type(start_res$info, "character")

  stub_registry_clear()
  disable(quiet = TRUE)
})

test_that("proof_start - already running", {
  stub_request("post", make_url("cromwell-server")) |>
    to_return(
      body = jsonlite::toJSON(response_start_conflict, auto_unbox = TRUE),
      status = 409L,
      headers = list("Content-type" = "application/json")
    )

  enable(quiet = TRUE)

  withr::with_envvar(c("PROOF_TOKEN" = "notarealtoken"), {
    expect_error(proof_start(), "409")
    expect_error(proof_cancel(), "Job is already running")
  })

  stub_registry_clear()
  disable(quiet = TRUE)
})
