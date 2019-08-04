library(tidyverse)
library(lubridate)
library(googlesheets)

# get data from Mother Jones
mass_shootings_raw <- gs_url("https://docs.google.com/spreadsheets/d/1b9o6uDO18sLxBqPwl_Gh9bnhW-ev_dABH83M5Vb5L8o/htmlview?sle=true#gid=0") %>%
  gs_read()

# clean up the data
mass_shootings <- mass_shootings_raw %>%
  # keep only relevant columns
  select(case:prior_signs_mental_health_issues, race, gender) %>%
  # rename columns
  rename(
    location_type = location_1,
    prior_mental_illness = prior_signs_mental_health_issues
  ) %>%
  # extract date info into separate columns
  mutate(
    date = mdy(date),
    year = year(date),
    month = month(date, label = TRUE) %>%
      as.character(),
    day = day(date)
  ) %>%
  select(-date) %>%
  # fix erroneous/confusing string values
  mutate(
    location_type = recode(
      location_type,
      `\nWorkplace` = "Workplace",
      `Other\n` = "Other"
    ),
    prior_mental_illness = na_if(prior_mental_illness, "-"),
    prior_mental_illness = na_if(prior_mental_illness, "TBD"),
    prior_mental_illness = na_if(prior_mental_illness, "Unclear"),
    prior_mental_illness = na_if(prior_mental_illness, "Unknown"),
    race = stringr::str_to_title(race),
    race = na_if(race, "-"),
    race = na_if(race, "Unclear"),
    gender = recode(
      gender,
      F = "Female",
      M = "Male",
      `Male & Female` = "Male"
    ),
    male = gender == "Male"
  ) %>%
  # remove ambiguous male column
  select(-gender) %>%
  # reorder columns
  select(case, year:day, location:location_type, male, age_of_shooter, race, prior_mental_illness)

# store in package
usethis::use_data(mass_shootings, overwrite = TRUE)
