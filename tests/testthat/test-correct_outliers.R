df <- data.frame(x = 1:10, y = "val1")


test_that("outlier correction throws an error due to missing .outlier-column", {
  expect_error(correct_outliers(x = df, col = "x"))
})
