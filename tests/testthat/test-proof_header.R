# These tests do not touch the API

test_that("proof_header", {
  # errors if no env var set and no string supplied
  expect_error(proof_header(request("")), "token not found")

  # returns token if given
  expect_match(proof_header(request(""), "adf")$headers[[1]], "adf")

  # If PROOF_TOKEN env var set, fxn can find it
  withr::with_envvar(c("PROOF_TOKEN" = "notarealtoken"), {
    expect_match(proof_header(request(""))$headers[[1]],
      "notarealtoken")
  })
})
