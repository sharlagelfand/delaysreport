#' Set up delays report
#'
#' @description Set up delays report, with instructions on how to get the data and helper functions to clean the data and write the report.
#'
#' @param report_month Month of report
#' @param report_year Year of report
#'
#' @export
setup <- function(report_month, report_year){
  report_path <- fs::path("reports", report_year, report_month)
  usethis::use_directory(report_path)

  usethis::use_template(template = "setup.R",
                        save_as = paste0(report_path, "/01-setup.R"),
                        data = list(report_month = report_month,
                                    report_year = report_year),
                        package = "delaysreport",
                        open = TRUE)
}
