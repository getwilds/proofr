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

  # also works w/o token as it's not needed for this fxn
  info_res_wo_token <- proof_info()

  expect_type(info_res_wo_token, "list")

  stub_registry_clear()
  disable(quiet = TRUE)
})
