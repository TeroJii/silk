
<!-- README.md is generated from README.Rmd. Please edit that file -->

# silk <img src="man/figures/logo.png" align="right" height="139" alt="" />

<!-- badges: start -->
<!-- badges: end -->

The goal of silk is to make curves with outliers smooth as silk.

## Installation

You can install the development version of silk from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("TeroJii/silk")
```

## Example

The objective of this package is to provide a simple way to correct
individual outlier values. The package includes two main functions:
`find_outliers()` and `correct_outliers()`, for finding and correcting
outliers, respectively.

Let’s take a look at these functions in action.

### Detecting outliers in example data

The package contains an example dataset `silk_data1` which we can use to
demonstrate the functionality of the package.

``` r
library(silk)
## basic example code
data("silk_data1")

silk_data1 |> 
  head()
#>   time         y   group
#> 1    1  8.584244 series1
#> 2    2  9.159694 series1
#> 3    3  9.717704 series1
#> 4    4 10.249923 series1
#> 5    5 10.748432 series1
#> 6    6 11.205878 series1
```

If we visualize the data, we see that there are a few unusual values in
the data.

``` r
library(ggplot2)

silk_data1 |> 
  ggplot2::ggplot(ggplot2::aes(x = time, y = y, color = group)) +
  ggplot2::geom_line() +
  ggplot2::theme_bw() +
  ggplot2::facet_wrap(~group)
```

<img src="man/figures/README-visualize-example-data-1.png" width="100%" />

We can detect these unsual data points usign the `silk::find_outliers()`
function, which takes a data.frame and a column name as input, and
returns a modified version of the input data.frame.

``` r
silk_data1 |> 
  silk::find_outliers(col = "y", group_col = "group") |>
  head()
#>   time         y   group  .median     .mad .outlier
#> 1    1  8.584244 series1 8.065949 2.713192    FALSE
#> 2    2  9.159694 series1 8.065949 2.713192    FALSE
#> 3    3  9.717704 series1 8.065949 2.713192    FALSE
#> 4    4 10.249923 series1 8.065949 2.713192    FALSE
#> 5    5 10.748432 series1 8.065949 2.713192    FALSE
#> 6    6 11.205878 series1 8.065949 2.713192    FALSE
```

<!--
You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this.
&#10;You can also embed plots, for example:
&#10;
&#10;In that case, don't forget to commit and push the resulting figure files, so they display on GitHub and CRAN.
-->
