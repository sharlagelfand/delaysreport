# {{{ report_month }}} {{{ report_year }}} TTC delays data cleaning

library(readxl)
library(dplyr)
library(here)
library(janitor)
library(assertr)

delays <- read_excel(here("reports", "{{{ report_year }}}", "{{{ report_month }}}", "delays_{{{ report_month }}}_{{{ report_year }}}_raw.xlsx")) %>%
  clean_names()

# Check 1: Check that line is one of YU, BD, SHP, SRT --------------------------

delays %>%
  assert(in_set("YU", "BD", "SHP", "SRT"), line)

# If it's not, look at the lines that violate this assumption

delays %>%
  filter(!(line %in% c("YU", "BD", "SHP", "SRT"))) %>%
  count(line)

# Recode if necessary -- e.g. Y/U to YU.
# Some may not be captured below, add them as you see fit!

delays <- delays %>%
  mutate(line = case_when(line %in% c("B/D", "BD LINE") ~ "BD",
                          line == "YUS" ~ "YU",
                          TRUE ~ line))

# Exclude cases where the line still isn't a thing

delays <- delays %>%
  filter(line %in% c("YU", "BD", "SHP", "SRT"))

# Check 2: All codes have a corresponding description --------------------------

# Add descriptions

delays <- delays %>%
  left_join(delaysreport::delay_codes,
            by = "code")

# Check where it's missing

delays %>%
  assert(not_na, description)

# If any are missing, try to google them and find out what they are.

delays %>%
  filter(is.na(description)) %>%
  count(code)

# No luck? Recode any remaining missing to "Delay Description Unknown"

delays <- delays %>%
  mutate(description = case_when(is.na(description) ~ "Delay Description Unknown",
                                 TRUE ~ description))

# Save clean data --------------------------------------------------------------

saveRDS(delays, here("reports", "{{{ report_year }}}", "{{{ report_month }}}", "delays_{{{ report_month }}}_{{{ report_year }}}_clean.rds"))
