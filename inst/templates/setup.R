# Top 5 delays by TTC Line for {{{ report_month }}} {{{ report_year }}}

# Step 1: Download the data.
# Go to https://portal0.cf.opendata.inter.sandbox-toronto.ca/dataset/ttc-subway-delay-data/
# Download this month's data. Save it in /reports/{{{ report_year }}}/{{{ report_month }}}/
# Name it delays_{{{ report_month }}}_{{{ report_year }}}_raw.xlsx

# Step 2: Clean the data
delaysreport::data_cleaning(report_month = "{{{ report_month }}}",
                            report_year = "{{{ report_year }}}")

# Step 3: Run the report!
# Set render to TRUE if you would like the report to render automatically; keep it as FALSE if you want the .Rmd file to open and to render it yourself.
delaysreport::delays_report(report_month = "{{{ report_month }}}",
                            report_year = "{{{ report_year }}}",
                            render = FALSE)
