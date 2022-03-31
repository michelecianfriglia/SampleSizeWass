test_that("\"is.number\" works correctly", {
  expect_equal(is.number(4.5), TRUE)
  expect_equal(is.number(5, int = TRUE), TRUE)
  expect_equal(is.number(c(4.5, 5)), FALSE)
  expect_equal(is.number(NaN), FALSE)
})
