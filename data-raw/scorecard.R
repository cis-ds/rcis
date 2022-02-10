library(tidyverse)
library(rscorecard)

# authenticate API token
sc_key(getOption("scorecard_token"))

scorecard_raw <- sc_init() %>%
  # only 4 year institutions
  sc_filter(highdeg == 3:4) %>%
  # select subset of variables based on data dictionary
  sc_select(
    unitid, instnm, stabbr, control,
    adm_rate, sat_avg, costt4_a, npt4_pub, npt4_priv,
    avgfacsal, pctpell, c150_4, par_ed_pct_1stgen, debt_mdn_supp,
    locale
  ) %>%
  # get latest observations
  sc_year("latest") %>%
  # process query and store as tibble
  sc_get() %>%
  as_tibble()

# clean the data set
scorecard <- scorecard_raw %>%
  # drop year column
  select(-year) %>%
  mutate(
    # add text labels for type column
    control = factor(control,
      levels = 1:3,
      labels = c(
        "Public", "Private, nonprofit",
        "Private, for-profit"
      )
    ),
    # convert average faculty salary to annual salary
    avgfacsal = avgfacsal * 9,
    # add text labels for locale
    locale = factor(locale,
      levels = c(11:13, 21:23, 31:33, 41:43),
      labels = c(
        rep("City", 3),
        rep("Suburb", 3),
        rep("Town", 3),
        rep("Rural", 3)
      )
    )
  ) %>%
  # collapse net-price columns to a single variable
  unite(col = "npt4", starts_with("npt4"), na.rm = TRUE) %>%
  mutate(npt4 = parse_number(npt4)) %>%
  # store all integer columns as double values
  mutate(across(.cols = where(is.integer), .fns = as.double)) %>%
  # clean up names
  rename(
    name = instnm,
    state = stabbr,
    type = control,
    cost = costt4_a,
    netcost = npt4,
    admrate = adm_rate,
    satavg = sat_avg,
    comprate = c150_4,
    firstgen = par_ed_pct_1stgen,
    debt = debt_mdn_supp,
    locale = locale
  ) %>%
  # remove observations with NA for admissions rate
  drop_na(admrate)

# store in package
usethis::use_data(scorecard, overwrite = TRUE)
