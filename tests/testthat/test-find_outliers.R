df <- data.frame(x = 1:10, y = "val1")

# A data.frame is returned
test_that("data.frame as a return value", {
  expect_s3_class(find_outliers(x = df, col = "x", group_col = "y"), "data.frame")
})

test_that("invalid group_col throws an error", {
  expect_error(find_outliers(x = df, col = "x", group_col = "col_not_in_df"))
})

test_that("returned data.frame contains column .median, .mad and .outlier", {
  testthat::expect_contains(
    object = names(find_outliers(x = df, col = "x", group_col = "y")),
    expected = c(".median", ".mad", ".outlier")
  )
})


test_that("Non-implemented feature throws an error", {
  expect_error(find_outliers(x = df, col = "x"))
})
