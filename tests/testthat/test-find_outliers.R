df <- data.frame(x = 1:10, y = "x")

# A data.frame is returned
test_that("data.frame as a return value", {
  expect_s3_class(find_outliers(x = df), "data.frame")
})
