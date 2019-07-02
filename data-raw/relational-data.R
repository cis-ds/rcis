library(tidyverse)

superheroes <- "
    name,    alignment, gender,         publisher
 Magneto,          bad,   male,            Marvel
   Storm,         good, female,            Marvel
Mystique,          bad, female,            Marvel
  Batman,         good,   male,                DC
   Joker,          bad,   male,                DC
Catwoman,          bad, female,                DC
 Sabrina,         good, female,     Archie Comics
"

superheroes <- read_csv(superheroes, skip = 1)

publishers <- "
  publisher, yr_founded
         DC,       1934
     Marvel,       1939
      Image,       1992
"
publishers <- read_csv(publishers, skip = 1)

usethis::use_data(superheroes, overwrite = TRUE)
usethis::use_data(publishers, overwrite = TRUE)
