#' Generate template for data cleaning
#'
#' @description Opens a template of steps for cleaning the month's delays data.
#'
#' @param report_month Month of report
#' @param report_year Year of report
#'
#' @export
data_cleaning <- function(report_month, report_year){
  report_path <- fs::path("reports", report_year, report_month)

  usethis::use_template(template = "data_cleaning.R",
                        save_as = paste0(report_path, "/02-data_cleaning.R"),
                        data = list(report_month = report_month,
                                    report_year = report_year),
                        package = "delaysreport",
                        open = TRUE)
}
