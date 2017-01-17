#' College affordability from College Scorecard
#'
#' A dataset containing a sample of observations and variables
#' from the Department of Education's College Scorecard (data is for 2013)
#'
#' @format A data frame with 1849 rows and 11 variables:
#' \describe{
#'   \item{unitid}{Unit ID for institution}
#'   \item{name}{Name of the college}
#'   \item{state}{State abbreviation}
#'   \item{type}{Type of college (Public; Private, nonprofit; Private, for-profit)}
#'   \item{cost}{The average annual total cost of attendance, including tuition and fees,
#'   books and supplies, and living expenses, minus the average grant/scholarship aid}
#'   \item{admrate}{Undergraduate admissions rate}
#'   \item{satavg}{Average SAT equivalent score of students admitted}
#'   \item{avgfacsal}{Average faculty salary (9 month)}
#'   \item{pctpell}{Percentage of undergraduates who receive a Pell Grant}
#'   \item{comprate}{Rate of first-time, full-time students at four-year institutions
#'   who complete their degree within six years}
#'   \item{firstgen}{Share of first-generation students}
#'   \item{debt}{Median debt of students after leaving school}
#' }
#' @source \url{https://collegescorecard.ed.gov/data/}
"scorecard"

#' Gun Deaths in America
#'
#' A dataset containing records on all firearm deaths in the United
#' States (excluding non-U.S. residents) from 2012-2014.
#'
#' @format A data frame with 100,798 rows and 10 variables:
#' \describe{
#'   \item{id}{Row number of the observation}
#'   \item{year}{Year the death occurred}
#'   \item{month}{Month the death occurred (1 = January, 2 = February, etc.)}
#'   \item{intent}{Intent of the death (homicide, suicide, accidental, unknown)}
#'   \item{police}{Indicator if the death was the result of an officer-involved shooting}
#'   \item{sex}{Victim's sex}
#'   \item{age}{Victim's age}
#'   \item{race}{Victim's race (White, Black, Hispanic, Asian/Pacific Islander,
#'   Native American/Native Alaskan)}
#'   \item{place}{Location where the shooting occurred}
#'   \item{education}{Highest level of education of the victim}
#' }
#' @source \url{http://fivethirtyeight.com/features/gun-deaths/}
"gun_deaths"

#' Dadmom
#'
#' A dataset for practicing converting from long-to-wide data form.
#'
#' @format A data frame with 3 rows and 5 variables:
#' \describe{
#'   \item{famid}{Unit ID for family}
#'   \item{named}{Name of the dad}
#'   \item{incd}{Income of the dad}
#'   \item{namem}{Name of the mom}
#'   \item{incm}{Income of the mom}
#' }
#' @source \url{http://www.ats.ucla.edu/stat/stata/modules/reshapel.htm}
"dadmom"

#' Superheroes
#'
#' A dataset for practicing relational joins.
#'
#' @format A data frame with 7 rows and 4 variables:
#' \describe{
#'   \item{name}{Name of superhero}
#'   \item{alignment}{Is the superhero good or bad?}
#'   \item{gender}{Gender of superhero}
#'   \item{publisher}{Publisher which created the superhero}
#' }
#' @source \url{http://stat545.com/bit001_dplyr-cheatsheet.html}
"superheroes"

#' Publishers
#'
#' A dataset for practicing relational joins.
#'
#' @format A data frame with 3 rows and 2 variables:
#' \describe{
#'   \item{publisher}{Name of publisher}
#'   \item{yr_founded}{Year the publisher was founded}
#' }
#' @source \url{http://stat545.com/bit001_dplyr-cheatsheet.html}
"publishers"
