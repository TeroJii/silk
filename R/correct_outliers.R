#' Correcting individual outliers
#'
#' Takes the mean of the previous and next value for each outlier observation,
#' and replaces the outlier value with this mean value. Should be used with the
#' [find_outliers()] function.
#'
#' @param x A data.frame with the data including the .outlier column
#' @param col The column to correct outliers from
#'
#' @return Returns a modified version of the input data.frame
#' @export
#'
#' @examples
#' silk_data1 |>
#'   find_outliers("y", group_col = "group") |>
#'   correct_outliers(col = "y") |>
#'   head()
correct_outliers <- function(x, col){
  UseMethod("correct_outliers")
}


#' @export
correct_outliers.data.frame <- function(x, col){

  stopifnot(is.character(col))

  if(!any(names(x) %in% ".outlier")){
    stop("No .outlier column found in the data. Please run find_outliers() on your data.frame first.")
  }

  x |>
    dplyr::mutate(
      {{col}} := dplyr::if_else(
        .outlier,
        true = (dplyr::lag(.data[[col]]) + dplyr::lead(.data[[col]]))/2,
        false = .data[[col]]
      )
    )
}


# suppress undefined global functions or variables during R CMD check
.outlier <- NULL
utils::globalVariables(':=')
