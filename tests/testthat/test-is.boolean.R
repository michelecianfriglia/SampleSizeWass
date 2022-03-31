test_that("\"is.boolean\" works correctly", {
  expect_equal(is.boolean(TRUE), TRUE)
  expect_equal(is.boolean(FALSE), TRUE)
  expect_equal(is.boolean(NA), FALSE)
  expect_equal(is.boolean(c(TRUE, FALSE)), FALSE)
})
