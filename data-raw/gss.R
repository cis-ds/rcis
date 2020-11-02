library(tidyverse)
library(recipes)

set.seed(123)

# get GSS data from poliscidata
data(gss, package = "poliscidata")
gss <- as_tibble(gss)

# select subset of data frame
gss <- gss %>%
  select(
    id, wtss, colrac,
    age, authoritarianism, black, cohort, colath, colmslm,
    degree, egalit_scale, grass, hispanic_2, income06,
    owngun, partyid_3, polviews, pray, pres08, race,
    sex, social_cons3, south, tolerance, wordsum, zodiac
  )

# use this in the package
usethis::use_data(gss, overwrite = TRUE)
