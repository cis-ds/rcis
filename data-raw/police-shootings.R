# import and clean data from Washington Post database on fatal police shootings
# source: https://github.com/washingtonpost/data-police-shootings

library(tidyverse)
library(tidymodels)

# get police-shootings data
police_shootings_raw <- read_csv(file = "https://raw.githubusercontent.com/washingtonpost/data-police-shootings/master/fatal-police-shootings-data.csv")

# select only relevant columns
police_shootings <- police_shootings_raw %>%
  select(manner_of_death, armed, age, gender, race, state,
         signs_of_mental_illness, threat_level, flee, body_camera) %>%
  # recode variables for easier tidymodeling
  mutate(
    # convert logical columns to factors
    signs_of_mental_illness = factor(signs_of_mental_illness,
                                     labels = c("No", "Yes")),
    body_camera = factor(body_camera, labels = c("No", "Yes")),
    # fix gender miscoding - typo of D which probably meant F
    gender = if_else(gender == "D", "F", gender),
    # use full labels for categorical variables
    gender = recode(.x = gender,
                    "M" = "Male",
                    "F" = "Female"),
    race = recode(.x = race,
                  "A" = "Asian",
                  "B" = "Black, non-Hispanic",
                  "H" = "Hispanic",
                  "N" = "Native American",
                  "O" = "Other",
                  "W" = "White, non-Hispanic")
  ) %>%
  # use sentence case for all character columns
  mutate(across(.cols = c(where(is.character), -state), .fns = str_to_sentence)) %>%
  # keep only complete observations for pedagogical purposes
  drop_na()

# store in package
usethis::use_data(police_shootings, overwrite = TRUE)
