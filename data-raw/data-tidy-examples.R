# all originall from the tidyr package as demo files
# https://github.com/tidyverse/tidyr/tree/0d633f79e85a87a686b2f43de20e2ae74f5c122c/demo
library(tidyverse)

# http://stackoverflow.com/questions/15668870/
grades <- tribble(
   ~ID, ~Test, ~Year, ~Fall, ~Spring, ~Winter,
    1,   "Math",   2008,    15,      16,      19,
    1,   "Math",   2009,    12,      13,      27,
    1,   "Writing",   2008,    22,      22,      24,
    1,   "Writing",   2009,    10,      14,      20,
    2,   "Math",   2008,    12,      13,      25,
    2,   "Math",   2009,    16,      14,      21,
    2,   "Writing",   2008,    13,      11,      29,
    2,   "Writing",   2009,    23,      20,      26,
    3,   "Math",   2008,    11,      12,      22,
    3,   "Math",   2009,    13,      11,      27,
    3,   "Writing",   2008,    17,      12,      23,
    3,   "Writing",   2009,    14,      9,       31
)
usethis::use_data(grades, overwrite = TRUE)

# http://stackoverflow.com/questions/16032858
results <- tibble(
  Ind = rep(str_c("Ind", 1:10), times = 2),
  Treatment = rep(c("Treat", "Cont"), each = 10),
  value = 1:20
)
usethis::use_data(results, overwrite = TRUE)

# http://stackoverflow.com/questions/17481212
race <- tribble(
  ~Name,    ~`50`,  ~`100`,  ~`150`,  ~`200`,  ~`250`,  ~`300`,  ~`350`,
  "Carla",  1.2,  1.8,  2.2,  2.3,  3.0,  2.5,  1.8,
  "Mace",   1.5,  1.1,  1.9,  2.0,  3.6,  3.0,  2.5,
  "Lea",    1.7,  1.6,  2.3,  2.7,  2.6,  2.2,  2.6,
  "Karen",  1.3,  1.7,  1.9,  2.2,  3.2,  1.5,  1.9
)
usethis::use_data(race, overwrite = TRUE)

# http://stackoverflow.com/questions/9684671
set.seed(10)
activities <- tibble(
  id = str_c("x", 1:10),
  trt = sample(c('cnt', 'tr'), size = 10, replace = TRUE),
  work.T1 = runif(10),
  play.T1 = runif(10),
  talk.T1 = runif(10),
  work.T2 = runif(10),
  play.T2 = runif(10),
  talk.T2 = runif(10)
)
usethis::use_data(activities, overwrite = TRUE)
