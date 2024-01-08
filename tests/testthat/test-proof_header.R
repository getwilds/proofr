# These tests do not touch the API

test_that("proof_header", {
  # errors if no env var set and no string supplied
  expect_error(proof_header(), "token not found")

  # returns token if given
  expect_match(proof_header("adf")$headers[[1]], "adf")

  # If PROOF_TOKEN env var set, fxn can find it
  withr::with_envvar(c("PROOF_TOKEN" = "world"), {
    expect_match(proof_header()$headers[[1]], "world")
  })
})
