library(tidyverse)
library(gssr)
library(haven)

set.seed(123)

# get GSS data for 2018
gss18 <- gss_get_yr(2018)

# select subset of data frame
gss <- gss18 %>%
  select(
    id, wtss,
    grass,
    age,
    colath,
    colmslm,
    degree,
    hispanic, # could be useful with step_other()
    income16,
    owngun,
    partyid, # collapse to three categories
    polviews,
    pray,
    pres16,
    race,
    sex,
    region, # recode to south
    wordsum,
    zodiac,
    wrkstat, # labor force status
    hrs1, # number of hours worked last week
    gunlaw, # gun permit
    letdie1, # euthanasia
    sexfreq, # frequency of sex during last year
    happy, # general happiness
    backpain, # R had back pain in the past 12 months
    courts, # courts dealing with criminals
  ) %>%
  # fix all NAs to regular R NAs
  zap_missing() %>%
  # convert labels to unordered factors
  mutate(across(
    .cols = c(
      grass, colath, colmslm, owngun, pray,
      pres16, race, sex, region, region, zodiac,
      wrkstat, gunlaw, letdie1, backpain, courts, hispanic
    ),
    .fn = as_factor
  )) %>%
  # convert labels to ordered factors
  mutate(across(
    .cols = c(degree, income16, partyid, polviews, sexfreq, happy),
    .fn = as_factor, ordered = TRUE
  )) %>%
  # convert labels to numeric
  mutate(across(.cols = where(is.numeric), .fn = as.numeric)) %>%
  # replace IAP with NA
  mutate(across(.cols = where(is.factor), .fn = na_if, y = "IAP")) %>%
  mutate(across(.cols = where(is.factor), .fn = na_if, y = "iap")) %>%
  # order columns alphabetically except for id and wtss
  select(id, wtss, sort(current_vars()))

# use this in the package
usethis::use_data(gss, overwrite = TRUE)
