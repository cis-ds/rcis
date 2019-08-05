library(tidyverse)

# get data from 538 repo
gun_deaths_raw <- read_csv("https://raw.githubusercontent.com/fivethirtyeight/guns-data/master/full_data.csv")

gun_deaths <- gun_deaths_raw %>%
  # fix missing column name
  rename(id = X1) %>%
  # remove hispanic column
  select(-hispanic) %>%
  # change month column to abbreviated label
  mutate(month = as.numeric(month) %>%
           factor(levels = 1:12, labels = month.abb) %>%
           as.character()) %>%
  # clean up education column
  mutate(education = ifelse(education == 5, NA, education),
         education = factor(education, levels = c(1:4),
                            labels = c("Less than HS", "HS/GED", "Some college", "BA+")))

# store in package
usethis::use_data(gun_deaths, overwrite = TRUE)
