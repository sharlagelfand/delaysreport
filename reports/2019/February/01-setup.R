# Top 5 delays by TTC Line for February 2019

# Step 1: Download the data.
# Go to https://portal0.cf.opendata.inter.sandbox-toronto.ca/dataset/ttc-subway-delay-data/
# Download this month's data. Save it in /reports/2019/February/
# Name it delays_February_2019_raw.xlsx

# Step 2: Clean the data
delaysreport::data_cleaning(report_month = "February",
                            report_year = "2019")

# Step 3: Run the report!
# Set render to TRUE if you would like the report to render automatically; keep it as FALSE if you want the .Rmd file to open and to render it yourself.
delaysreport::delays_report(report_month = "February",
                            report_year = "2019",
                            render = TRUE)
