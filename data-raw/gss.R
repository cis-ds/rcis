library(tidyverse)
library(recipes)

set.seed(123)

# get GSS data from poliscidata
data(gss, package = "poliscidata")
gss <- as_tibble(gss)

# select subset of data frame
gss_subset <- gss %>%
  select(
    age, authoritarianism, black,
    colrac, degree, egalit_scale,
    grass, hispanic_2, income06,
    owngun, partyid_3, polviews, pray,
    sex, social_cons3, south,
    tolerance, wordsum, zodiac
  )

# impute the dataset for learning purposes
gss_rec <- recipe(colrac ~ ., data = gss_subset) %>%
  step_knnimpute(all_predictors(), all_outcomes()) %>%
  step_integer(income06)

# generate imputed dataset
trained_rec <- prep(gss_rec)
gss_colrac <- juice(trained_rec) %>%
  mutate_if(.predicate = is.numeric, .funs = round) %>%
  select(colrac, everything())

usethis::use_data(gss_colrac, overwrite = TRUE)
