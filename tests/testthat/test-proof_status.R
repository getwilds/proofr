test_that("proof_status - server IS running", {
  stub_request("get", make_url("cromwell-server")) |>
    to_return(
      body = jsonlite::toJSON(
        response_status_running,
        auto_unbox = TRUE, null = "null"
      ),
      status = 200L,
      headers = list("Content-type" = "application/json")
    )

  enable(quiet = TRUE)

  withr::with_envvar(c("PROOF_TOKEN" = "notarealtoken"), {
    status_res <- proof_status()
  })

  expect_type(status_res, "list")
  expect_type(status_res$canJobStart, "logical")
  expect_type(status_res$jobStatus, "character")
  expect_type(status_res$cromwellUrl, "character")
  expect_type(status_res$jobInfo, "list")
  for (item in status_res$jobInfo) {
    expect_true(inherits(item, c("character", "logical")))
  }


  stub_registry_clear()
  disable(quiet = TRUE)
})

test_that("proof_status - server IS NOT running", {
  stub_request("get", make_url("cromwell-server")) |>
    to_return(
      body = jsonlite::toJSON(
        response_status_not_running,
        auto_unbox = TRUE, null = "null"
      ),
      status = 200L,
      headers = list("Content-type" = "application/json")
    )

  enable(quiet = TRUE)

  withr::with_envvar(c("PROOF_TOKEN" = "notarealtoken"), {
    status_res <- proof_status()
  })

  expect_type(status_res, "list")
  expect_type(status_res$canJobStart, "logical")
  expect_null(status_res$jobStatus)
  expect_null(status_res$cromwellUrl)
  expect_type(status_res$jobInfo, "list")
  for (item in status_res$jobInfo) expect_null(item)


  stub_registry_clear()
  disable(quiet = TRUE)
})
