# load required package
library(tidyverse)

# import original bechdel file
bechdel_raw <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/movies.csv')

bechdel <- bechdel_raw %>%
  # keep relevant columns
  select(year, title, binary, budget_2013, domgross_2013, intgross_2013, rated,
         metascore, imdb_rating, genre) %>%
  # clean columns for tidymodels demo
  # make simple factor column for bechdel test outcome
  mutate(test = factor(binary, levels = c("FAIL", "PASS"), labels = c("Fail", "Pass"))) %>%
  select(year, title, test, everything(), -binary) %>%
  # ensure numeric columns are numeric and in millions of dollars
  mutate(across(.cols = c(domgross_2013, intgross_2013), .fns = parse_number)) %>%
  mutate(across(.cols = ends_with("_2013"), .fns = ~ . / 1e07)) %>%
  # only keep rated of common ratings
  filter(rated %in% c("G", "PG", "PG-13", "R", "NC-17") | is.na(rated)) %>%
  # only keep first value for genre
  mutate(genre = str_split_fixed(string = genre, pattern = ",", n = Inf)[,1] %>%
           na_if("")) %>%
  # drop rows with NAs
  drop_na()

# store in package
usethis::use_data(bechdel, overwrite = TRUE)
