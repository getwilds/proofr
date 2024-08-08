test_that("proof_info - success", {
  stub_request("get", make_url("info")) %>%
    to_return(
      body = jsonlite::toJSON(response_info_success, auto_unbox = TRUE),
      status = 200L,
      headers = list("Content-type" = "application/json")
    )

  enable(quiet = TRUE)

  withr::with_envvar(c("PROOF_TOKEN" = "notarealtoken"), {
    info_res <- proof_info()
  })

  expect_type(info_res, "list")


  stub_registry_clear()
  disable(quiet = TRUE)
})
