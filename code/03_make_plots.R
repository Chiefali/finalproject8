library(dplyr)
library(ggplot2)
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

plot_hs <- ggplot(project_data, aes(x = pct_population_below_poverty,
                                    y = pct_adults_25plus_hs_or_higher)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Poverty and High School Attainment",
    x = "Population Below Poverty (%)",
    y = "Adults 25+ with High School or Higher (%)"
  ) +
  theme_minimal()

plot_bachelors <- ggplot(project_data, aes(x = pct_population_below_poverty,
                                           y = pct_adults_25plus_bachelors_or_higher)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Poverty and Bachelor's Degree Attainment",
    x = "Population Below Poverty (%)",
    y = "Adults 25+ with Bachelor's Degree or Higher (%)"
  ) +
  theme_minimal()

ggsave(here::here("output", "plot_hs.png"), plot_hs, width = 7, height = 5)
ggsave(here::here("output", "plot_bachelors.png"), plot_bachelors, width = 7, height = 5)