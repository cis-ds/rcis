library(tidyverse)
library(rscorecard)

# authenticate API token
sc_key(getOption("scorecard_token"))

scorecard_2013 <- sc_init() %>%
  # only 4 year institutions
  sc_filter(highdeg == 3:4) %>%
  # select subset of variables based on data dictionary
  sc_select(unitid, instnm, stabbr, control,
            adm_rate, sat_avg, costt4_a,
            avgfacsal, pctpell, c150_4, first_gen, debt_mdn_supp) %>%
  # get 2013 observations
  sc_year(2013) %>%
  # process query and store as tibble
  sc_get() %>%
  as_tibble()

# clean the data set
scorecard <- scorecard_2013 %>%
  # drop year column
  select(-year) %>%
  # add text labels for type column and
  # convert average faculty salary to annual salary
  mutate(control = factor(control, levels = 1:3,
                          labels = c("Public", "Private, nonprofit",
                                     "Private, for-profit")),
         avgfacsal = avgfacsal * 9) %>%
  # clean up names
  rename(name = instnm,
         state = stabbr,
         type = control,
         cost = costt4_a,
         admrate = adm_rate,
         satavg = sat_avg,
         comprate = c150_4,
         firstgen = first_gen,
         debt = debt_mdn_supp) %>%
  # remove observations with NA for admissions rate
  drop_na(admrate)

# store in package
usethis::use_data(scorecard, overwrite = TRUE)
