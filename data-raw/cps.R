library(tidyverse)
library(RSocrata)

#importing city of chicago report card 2018-2019 data using RSocrata
reportcards <- read.socrata(
  "https://data.cityofchicago.org/Education/Chicago-Public-Schools-School-Progress-Reports-SY1/dw27-rash"
)
#growth rating: Student Growth measures the change in standardized test scores between two points in time compared other CPS school and schools nationwide. The score is based on an average of the available PSAT and SAT growth measures listed below.

qualvars <- c("school_type", "primary_category", "student_growth_rating", "student_attainment_rating", "culture_climate_rating",
              "creative_school_certification", "school_survey_involved", "school_survey_supportive",
              "school_survey_ambitious", "school_survey_effective", "school_survey_safety")
quantvars <- c("attainment_math_pct_es", "attainment_reading_pct_es", "student_attendance_year_2", "teacher_attendance_year_2", "chronic_truancy_pct")
myvars <- c("school_id", "short_name", qualvars, quantvars)

cps <- reportcards[myvars] %>%
  # clean up names
  rename(
    involved_families = school_survey_involved,
    supportive_environment = school_survey_supportive,
    ambitious_teaching = school_survey_ambitious,
    effective_leaders = school_survey_effective,
    student_attendance_pct2019 = student_attendance_year_2,
    teacher_attendance_pct2019 = teacher_attendance_year_2
  ) %>%
  na_if("NO DATA AVAILABLE") %>%
  na_if("NOT ENOUGH DATA") %>%
  na_if("INCOMPLETE DATA") %>%
  mutate(
    student_growth_rating = factor (
      student_growth_rating,
      c(
        "FAR BELOW AVERAGE",
        "BELOW AVERAGE",
        "AVERAGE",
        "ABOVE AVERAGE",
        "FAR ABOVE AVERAGE"
      )
    ),
    ambitious_teaching = factor (
      ambitious_teaching,
      c("WEAK", "NEUTRAL", "STRONG", "VERY STRONG")
    ),
    student_attainment_rating = factor (
      student_attainment_rating,
      c(
        "FAR BELOW EXPECTATIONS",
        "BELOW EXPECTATIONS",
        "MET EXPECTATIONS",
        "ABOVE EXPECTATIONS",
        " FAR ABOVE EXPECTATIONS",
        "FAR BELOW AVERAGE",
        "BELOW AVERAGE",
        "AVERAGE",
        "ABOVE AVERAGE",
        "FAR ABOVE AVERAGE"
      )
    ),
    culture_climate_rating = factor(
      culture_climate_rating,
      c(
        "NOT YET ORGANIZED",
        "PARTIALLY ORGANIZED",
        "MODERATELY ORGANIZED",
        "ORGANIZED",
        "WELL ORGANIZED"
      )
    ),
    creative_school_certification = factor(
      creative_school_certification,
      c("DEVELOPING", "EMERGING", "EXCELLING", "STRONG")
    ),
    involved_families = factor(
      involved_families,
      c("VERY WEAK", "WEAK", "NEUTRAL", "STRONG", "VERY STRONG")
    ),
    supportive_environment = factor (
      supportive_environment,
      c("VERY WEAK", "WEAK", "NEUTRAL", "STRONG", "VERY STRONG")
    ),
    effective_leaders = factor(
      effective_leaders,
      c("VERY WEAK", "WEAK", "NEUTRAL", "STRONG", "VERY STRONG")
    ),
    school_survey_safety = factor(
      school_survey_safety,
      c("VERY WEAK", "WEAK", "NEUTRAL", "STRONG", "VERY STRONG")
    )
  )


usethis::use_data(cps, overwrite = TRUE)
