correct_outliers <- function(x, col){

  stopifnot(is.data.frame(x))
  stopifnot(is.character(col))

  if(!any(names(x) %in% ".outlier")){
    stop("No .outlier column found in the data. Please run find_outliers() on your data.frame first.")
  }

  x |>
    dplyr::mutate("{{col}}" := dplyr::if_else(
      .outlier,
      true = (dplyr::lag(.data[[col]]) + dplyr::lead(.data[[col]]))/2,
      false = .data[[col]]
    )
    )
}
