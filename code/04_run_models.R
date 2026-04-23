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

model_hs <- lm(
  pct_adults_25plus_hs_or_higher ~ pct_population_below_poverty,
  data = project_data
)

model_bachelors <- lm(
  pct_adults_25plus_bachelors_or_higher ~ pct_population_below_poverty,
  data = project_data
)
capture.output(summary(model_hs), file = here::here("output", "model_hs.txt"))
capture.output(summary(model_bachelors), file = here::here("output", "model_bachelors.txt"))

print(summary(model_hs))
print(summary(model_bachelors))
