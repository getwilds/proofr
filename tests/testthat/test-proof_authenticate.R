test_that("proof_authenticate - error behavior", {
  # errors if no username supplied
  expect_error(
    proof_authenticate(),
    '"username" is missing'
  )

  # errors if no password supplied
  expect_error(
    proof_authenticate(username = "apple"),
    '"password" is missing'
  )

  # username should be character
  expect_error(
    proof_authenticate(5),
    "username must be of class character"
  )

  # password should be character
  expect_error(
    proof_authenticate(username = "apple", password = 5),
    "password must be of class character"
  )
})

test_that("proof_start - success", {
  stub_registry_clear()
  stub_request("post", make_url("authenticate")) %>%
    to_return(
      body = jsonlite::toJSON(
        response_authenticate_success,
        auto_unbox = TRUE
      ),
      status = 200L,
      headers = list("Content-type" = "application/json")
    )
  stub_registry()

  enable(quiet = TRUE)

  auth_res <- proof_authenticate("jane", "faketoken")

  expect_type(auth_res, "character")
  expect_equal(auth_res, "somerandomstring")

  stub_registry_clear()
  disable(quiet = TRUE)
  Sys.unsetenv("PROOF_TOKEN")
})
