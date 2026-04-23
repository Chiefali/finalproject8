library(dplyr)
library(here)
library(knitr)

data <- readRDS(here::here("data", "merged_clean.RDS"))

project_data <- data %>%
  select(
    county,
    pct_population_below_poverty,
    pct_adults_25plus_hs_or_higher,
    pct_adults_25plus_bachelors_or_higher
  ) %>%
  slice_head(n = 200)

summary_table <- project_data %>%
  summarise(
    Mean_Poverty = mean(pct_population_below_poverty, na.rm = TRUE),
    SD_Poverty = sd(pct_population_below_poverty, na.rm = TRUE),
    Mean_HS = mean(pct_adults_25plus_hs_or_higher, na.rm = TRUE),
    SD_HS = sd(pct_adults_25plus_hs_or_higher, na.rm = TRUE),
    Mean_Bachelors = mean(pct_adults_25plus_bachelors_or_higher, na.rm = TRUE),
    SD_Bachelors = sd(pct_adults_25plus_bachelors_or_higher, na.rm = TRUE)
  )

write.csv(summary_table, here::here("output", "summary_table.csv"), row.names = FALSE)
print(summary_table)