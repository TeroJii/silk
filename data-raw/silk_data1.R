## code to prepare `silk_data1` dataset goes here

#######
## data for series 1 ----
#######

df <- data.frame(x = 1:1000) |>
  dplyr::mutate(
    y1 = 3*sin(x = x/10) +5,
    y2 = 2*sin(x = x/7) +3
  ) |>
  dplyr::mutate(
    y = y1+ y2,
    group = "series1"
  ) |>
  dplyr::select(-y1, -y2)

## add outliers
df[c(201, 753), "y"] <- c(78, 102)

#######
## data for series 2 ----
#######

df2 <- data.frame(x = 1:1000) |>
  dplyr::mutate(
    y1 = 2.7*cos(x = x/10) +5,
    y2 = 3.1*sin(x = x/2.7) +3
  ) |>
  dplyr::mutate(
    y = y1+ y2,
    group = "series2"
  ) |>
  dplyr::select(-y1, -y2)

## add outliers
df2[c(251, 648), "y"] <- c(83, 62)

## combine data
silk_data1 <- dplyr::bind_rows(df, df2) |>
  dplyr::rename(time = x)

usethis::use_data(silk_data1, overwrite = TRUE)
