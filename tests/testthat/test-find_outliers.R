df <- data.frame(x = 1:10, y = "x")

# A data.frame is returned
test_that("data.frame as a return value", {
  expect_s3_class(find_outliers(x = df, col = "x"), "data.frame")
})

test_that("invalid group_col throws an error", {
  expect_error(find_outliers(x = df, col = "x", group_col = "col_not_in_df"))
})
