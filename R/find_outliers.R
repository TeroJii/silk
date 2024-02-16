#' Find outliers in a dataset
#'
#' @param x A data.frame with the data
#' @param col The column to find outliers from
#' @param group_col The column to group by
#'
#' @return A data.frame with something
#' @export
#'
#' @examples
#'  # Examples here
find_outliers <- function(x, col, group_col = NULL) {

  stopifnot(is.data.frame(x))
  stopifnot(is.character(col))
  stopifnot(is.null(group_col) || is.character(group_col))

  return(x)
}




record_median <- function(x, col, group_col){

  stopifnot(is.data.frame(x))
  stopifnot(is.character(col))
  stopifnot(is.character(group_col))

  medians <- x |>
    dplyr::group_by(.data[[group_var]]) |>
    dplyr::summarise(
      median_speed = stats::median(.data[[col]], na.rm = TRUE),
      mad = stats::mad(.data[[col]], na.rm = TRUE)
    ) |>
    dplyr::ungroup()

  return(medians)
}


# suppress undefined global functions or variables during R CMD check
.data <- group_var <- NULL
