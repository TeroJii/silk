#' Find outliers in a dataset
#'
#' A function for finding outliers in a dataset. Uses Median Absolute Deviation
#' (MAD) to detect values which are a certain distance away from the median
#' value.
#'
#' @param x A data.frame with the data
#' @param col The column to find outliers from
#' @param group_col The column to group by
#' @param threshold The threshold value for finding outliers. Outliers are
#' threshold * MAD away from the median.
#'
#' @return A modified version of the input data.frame, which includes columns for
#' median, MAD and a logical column to indicate outliers.
#' @export
#'
#' @examples
#' silk_data1 |>
#'   find_outliers("y", group_col = "group") |>
#'   head()
find_outliers <- function(x, col, group_col = NULL, threshold = 10) {
  UseMethod("find_outliers")
}

#' @export
find_outliers.data.frame <- function(x, col, group_col = NULL, threshold = 10) {

  stopifnot(is.character(col))
  stopifnot(is.null(group_col) || is.character(group_col))

  # check that group_col is a column in x
  if (!is.null(group_col)) {
    match.arg(arg = group_col, choices = names(x))
  }

  # record the median and mad for each group
  if(!is.null(group_col)){
    medians <- record_median(x, col, group_col)

    # add outliers to the data
    x <- x |>
      dplyr::left_join(medians, by = group_col) |>
      dplyr::mutate(
        .outlier = abs(.data[[col]] - .median) > .median + threshold * .mad
      )

  } else {
    # do something else if there is no grouping column
    # medians <- ...
    stop("Error: not implemented yet")
  }


  return(x)
}




record_median <- function(x, col, group_col){

  stopifnot(is.data.frame(x))
  stopifnot(is.character(col))
  stopifnot(is.character(group_col))

  medians <- x |>
    dplyr::group_by(.data[[group_col]]) |>
    dplyr::summarise(
      ## Perhaps we could also use
      ## ".median_{col}" := stats::median(.data[[col]], na.rm = TRUE)
      .median = stats::median(.data[[col]], na.rm = TRUE),
      .mad = stats::mad(.data[[col]], na.rm = TRUE)
    ) |>
    dplyr::ungroup()

  return(medians)
}


# suppress undefined global functions or variables during R CMD check
.data <- group_var <- .mad <- .median <-  NULL
