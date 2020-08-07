library(tidyverse)
library(rscorecard)

# authenticate API token
sc_key(getOption("scorecard_token"))

scorecard_2016 <- sc_init() %>%
  # only 4 year institutions
  sc_filter(highdeg == 3:4) %>%
  # select subset of variables based on data dictionary
  sc_select(unitid, instnm, stabbr, control,
            adm_rate, sat_avg, costt4_a,
            avgfacsal, pctpell, c150_4, first_gen, debt_mdn_supp,
            locale, openadmp) %>%
  # get latest observations in 2016 (last year with data for firstgen)
  sc_year(2016) %>%
  # process query and store as tibble
  sc_get() %>%
  as_tibble()


# clean the data set
scorecard <- scorecard_2016 %>%
  # drop year column
  select(-year) %>%
  # add text labels for type column and
  # convert average faculty salary to annual salary
  # add text labels for locale
  mutate(control = factor(control, levels = 1:3,
                          labels = c("Public", "Private, nonprofit",
                                     "Private, for-profit")),
         avgfacsal = avgfacsal * 9,
         locale = factor(locale, levels=c(11:13,21:23,31:33,41:43),
                         labels = c(rep("City" ,3),
                                    rep("Suburb" ,3),
                                    rep("Town" ,3),
                                    rep("Rural" ,3))),
         openadmp = factor (openadmp, levels= 1:2,
                            labels = c("Yes", "No"))) %>%
  # clean up names
  rename(name = instnm,
         state = stabbr,
         type = control,
         cost = costt4_a,
         admrate = adm_rate,
         satavg = sat_avg,
         comprate = c150_4,
         firstgen = first_gen,
         debt = debt_mdn_supp,
         locale = locale,
         openadmp = openadmp) %>%
  # remove observations with NA for admissions rate
  drop_na(admrate)

# store in package
usethis::use_data(scorecard, overwrite = TRUE)






