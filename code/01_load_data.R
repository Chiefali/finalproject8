library(dplyr)
library(here)

data <- readRDS(here::here("data", "merged_clean.RDS"))

project_data <- data %>%
  select(
    county,
    pct_population_below_poverty,
    pct_adults_25plus_hs_or_higher,
    pct_adults_25plus_bachelors_or_higher
  ) %>%
  slice_head(n = 200)
  
  saveRDS(project_data, here::here("output", "project_data.rds"))
  print(head(project_data))
  