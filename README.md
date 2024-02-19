
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

This is a basic example which shows you how to solve a common problem:

``` r
library(silk)
## basic example code
data("silk_data1")

silk_data1 |> 
  find_outliers("time", group_col = "group") |>
  head()
#>   time         y   group .median   .mad .outlier
#> 1    1  8.584244 series1   500.5 370.65    FALSE
#> 2    2  9.159694 series1   500.5 370.65    FALSE
#> 3    3  9.717704 series1   500.5 370.65    FALSE
#> 4    4 10.249923 series1   500.5 370.65    FALSE
#> 5    5 10.748432 series1   500.5 370.65    FALSE
#> 6    6 11.205878 series1   500.5 370.65    FALSE
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
