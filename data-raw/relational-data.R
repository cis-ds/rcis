library(tidyverse)

superheroes <- "
    name,    alignment, gender,         publisher
 Magneto,          bad,   male,            Marvel
  Batman,         good,   male,                DC
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
