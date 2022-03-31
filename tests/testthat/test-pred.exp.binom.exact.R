test_that("\"pred.exp.binom.exact\" returns a numeric value", {
  expect_type(pred.exp.binom.exact(10, 2, 3, 4, 5, 6, 7, 1, 100), "double")
  expect_equal(length(pred.exp.binom.exact(10, 2, 3, 4, 5, 6, 7, 1, 100)), 1)
})
