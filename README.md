
<!-- README.md is generated from README.Rmd. Please edit that file -->

# delaysreport

The goal of delaysreport is to help automate monthly reporting on the
top 5 causes for delay on each TTC subway line.

It is a toy package intended to accompany [this
blogpost](https://sharla.party/posts/usethis-for-reporting/) on using
`usethis`.

## Installation

You can install the development version of delaysreport from GitHub
with:

``` r
# install.packages("devtools")
devtools::install_github("sharlagelfand/delaysreport")
```

## Reporting

To begin the delays analysis for a given month, use
`delaysreport::setup()`, e.g.:

``` r
delaysreport::setup(report_month = "January", 
                    report_year = "2019")
```
