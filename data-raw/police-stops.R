library(tidyverse)
library(here)
library(lubridate)

# import Nashville, TN traffic stop data
# downloaded from https://openpolicing.stanford.edu/data/
nashville <- read_rds(here("data-raw", "yg821jf8611_tn_nashville_2020_04_01.rds"))

police_stops <- nashville %>%
  select(date, time, lat, lng, precinct, starts_with("subject"),
         type, violation, search_conducted) %>%
  drop_na() %>%
  filter(year(date) == 2015)

usethis::use_data(police_stops, overwrite = TRUE)
