df <- data.frame(x = 1:10, y = "val1")


test_that("outlier correction throws an error due to missing .outlier-column", {
  expect_error(correct_outliers(x = df, col = "x"))
})

test_that("supplying a non-string argument to col throws an error", {
  expect_error(correct_outliers(x = df, col = 1))
})


test_that("Corrected example data has a smaller mean than raw data with outliers", {
  expect_true(
    object = {
      corrected_dat <- silk_data1 |>
        find_outliers("y", group_col = "group") |>
        correct_outliers(col = "y")


      mean(corrected_dat$y) < mean(silk_data1$y)
    }
  )
})
