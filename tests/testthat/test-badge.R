test_that("badge doesn't change unexpected", {
  expect_snapshot(cat(badge("deprecated")))
  expect_snapshot(cat(badge("experimental")))
  expect_snapshot(cat(badge("unknown")), error = TRUE)
})
