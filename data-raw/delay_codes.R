library(dplyr)
library(readxl)
library(janitor)

delay_codes <- read_excel("data-raw/Subway & SRT Log Codes.xlsx") %>%
  clean_names()

delay_codes <- delay_codes  %>%
  select(code = sub_rmenu_code, description = code_description_3) %>%
  remove_empty("rows") %>%
  bind_rows(
    delay_codes  %>%
      select(code = srt_rmenu_code, description = code_description_7) %>%
      remove_empty("rows")
  )

# Add codes that are in data, but not code lookup

missing_codes <- tribble(
  ~code, ~description,
  "MUNCA", "No Collector Available - Non E.S.A. Related",
  "TRNCA", "No Collector Available",
  "PUEO", "Delay Description Unknown"
)

delay_codes <- delay_codes %>%
  bind_rows(missing_codes)

usethis::use_data(delay_codes)
