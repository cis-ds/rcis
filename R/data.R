#' College affordability from College Scorecard
#'
#' A dataset containing a sample of observations and variables
#' from the Department of Education's College Scorecard (data is for the 2018-19 academic year)
#'
#' @format A data frame with 1849 rows and 11 variables:
#' \describe{
#'   \item{unitid}{Unit ID for institution}
#'   \item{name}{Name of the college}
#'   \item{state}{State abbreviation}
#'   \item{type}{Type of college (Public; Private, nonprofit; Private, for-profit)}
#'   \item{admrate}{Undergraduate admissions rate (from 0-100\%)}
#'   \item{satavg}{Average SAT equivalent score of students admitted}
#'   \item{cost}{The average annual total cost of attendance, including tuition and fees,
#'   books and supplies, and living expenses}
#'   \item{netcost}{The average annual net cost of attendance (annual cost of attendance
#'   minus the average grant/scholarship aid)}
#'   \item{avgfacsal}{Average faculty salary (9 month)}
#'   \item{pctpell}{Percentage of undergraduates who receive a Pell Grant}
#'   \item{comprate}{Rate of first-time, full-time students at four-year institutions
#'   who complete their degree within six years}
#'   \item{firstgen}{Share of first-generation students}
#'   \item{debt}{Median debt of students after leaving school}
#'   \item{locale}{Locale of institution}
#'   \item{openadmp}{Open admissions policy indicator}
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
#'   \item{month}{Month the death occurred}
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

#' Voter turnout and mental health
#'
#' A subset of data from the 1998 General Social Survey including
#' questions about voter turnout and mental health.
#'
#' @format A data frame with 1317 rows and 5 variables:
#' \describe{
#'   \item{vote96}{1 if the respondent voted in the 1996 presidential
#'   election, 0 otherwise}
#'   \item{age}{Age of respondent}
#'   \item{educ}{Number of years of formal education completed by the respondent}
#'   \item{female}{1 if respondent is female, 0 if male}
#'   \item{mhealth}{Index variable which assesses the respondent's
#'   mental health, ranging from 0 (an individual with no depressed mood) and
#'   9 (an individual with the most severe depressed mood).}
#' }
#' @source \url{http://gss.norc.org/}
"mental_health"

#' Emotion scores from 2016 presidential debate
#'
#' A data frame containing predicted emotion scores from the first 2016
#' US presidential debate. Each row is the score for each emotion type for either
#' Trump or Clinton in each frame of the video. Emotion scores calculated using the
#' \href{https://www.microsoft.com/cognitive-services/en-us/emotion-api}{Microsoft Emotion API}.
#'
#' @format A data frame with 128,688 rows and 11 variables:
#' \describe{
#'   \item{start}{The start time of the first event, in ticks. In this video there are
#'   30000 ticks per second.}
#'   \item{duration}{The length of the fragment, in ticks.}
#'   \item{interval}{The length of each event within the fragment, in ticks.}
#'   \item{id}{Trump or Clinton.}
#'   \item{x}{X coordinate of top-left corner of face.}
#'   \item{y}{Y coordinate of top-left corner of face.}
#'   \item{width}{Width of face.}
#'   \item{height}{Height of face.}
#'   \item{row_id}{ID of video frame.}
#'   \item{key}{Type of emotion measured.}
#'   \item{value}{Probability that the facial expression expresses this emotion.}
#' }
#' @source \url{https://blog.exploratory.io/analyzing-emotions-using-facial-expressions-in-video-with-microsoft-ai-and-r-8f7585dd0780}
"emotion"

#' A sample dataset containing labeled bills from the United State Congress.
#'
#' A sample dataset containing labeled bills from the United States Congress,
#' compiled by Professor John D. Wilkerson at the University of Washington, Seattle
#' and E. Scott Adler at the University of Colorado, Boulder.
#'
#' @format A \code{tibble} containing six columns.
#' \describe{
#'   \item{ID}{A unique identifier for the bill.}
#'   \item{cong}{The session of congress in which the bill first appeared.}
#'   \item{billnum}{The number of the bill as it appears in the congressional docket.}
#'   \item{h_or_sen}{A field specifying whether the bill was introduced in
#'   the House (HR) or the Senate (S).}
#'   \item{major}{A manually labeled topic code corresponding to the subject of the bill.}
#'   \item{text}{A short text description of the bill.}
#' }
#'
#'
#' @source First included in the \href{https://github.com/timjurka/RTextTools}{\code{RTextTools}}
#' package (now deprecated). Original source is \url{http://www.congressionalbills.org/}.
"USCongress"

#' GSS dataset for in-class exercise
#'
#' \lifecycle{deprecated} \cr
#' The General Social Survey polls individuals about their attitudes and beliefs.
#' This dataset is contains a selection of variables relevant to predicting attitudes
#' towards racist college professors.
#'
#' @format A data frame with 1,974 rows and 19 variables:
#' \describe{
#'   \item{colrac}{College Teaching: Allow Racist to Teach}
#'   \item{age}{Respondent's Age}
#'   \item{authoritarianism}{Authoritarianism Scale}
#'   \item{black}{Is Respondent African American?}
#'   \item{degree}{Respondent's Highest Degree}
#'   \item{egalit_scale}{Egalitarianism Scale}
#'   \item{grass}{Should Marijuana Be Made Legal?}
#'   \item{hispanic_2}{Is Respondent Hispanic?}
#'   \item{income06}{Total Family Income}
#'   \item{owngun}{Have Gun in Home}
#'   \item{partyid_3}{Party Id: 3 Categories}
#'   \item{polviews}{Ideological Self-Placement}
#'   \item{pray}{How Often Does Respondent Pray}
#'   \item{sex}{Respondent's Sex}
#'   \item{social_cons3}{Social Conservatism}
#'   \item{south}{Respondent from South?}
#'   \item{tolerance}{Tolerance Scale}
#'   \item{wordsum}{Number Words Correct in Vocabulary Test}
#'   \item{zodiac}{Respondent's Astrological Sign}
#' }
#' @source 2012 General Social Survey.
"gss_colrac"

#' US Mass Shootings
#'
#' A dataset containing records on all identifiable mass shootings in the
#' United States from 1982-2021.
#'
#' @format A data frame with 124 rows and 14 variables:
#' \describe{
#'   \item{case}{Short name of the incident.}
#'   \item{year}{Year in which the shooting occurred.}
#'   \item{month}{Month in which the shooting occurred.}
#'   \item{day}{Day in which the shooting occurred.}
#'   \item{location}{City and state where the shooting occurred.}
#'   \item{summary}{Brief text description of the mass shooting incident.}
#'   \item{fatalities}{Number of fatal victims in the incident (excluding the shooter).}
#'   \item{injured}{Number of injured, non-fatal victims in the incident (excluding the shooter).}
#'   \item{total_victims}{Number of total victims in the incident (excluding the shooter).}
#'   \item{location_type}{Generic location in which the shooting occurred.}
#'   \item{male}{Logical value indicating if the perpetrator was a male.}
#'   \item{age_of_shooter}{Age of the perpetrator when the incident occurred.}
#'   \item{race}{Race of the shooter.}
#'   \item{prior_mental_illness}{Did the perpetrator show evidence of mental illness prior to the incident?}
#' }
#' @source \url{https://www.motherjones.com/politics/2012/12/mass-shootings-mother-jones-full-data/}
"mass_shootings"

#' World Bank indicators
#'
#' A dataset containing both quantitative variables and qualitative variables for six countries from 2005 to 2017.
#' The countries included are: Argentina, China, United Kingdom, Indonesia, Norway, and United States.
#'
#' @format A data frame with 78 rows and 14 variables:
#' \describe{
#'   \item{iso3c}{Country code ISO3.}
#'   \item{date}{Year in which the data is for.}
#'   \item{iso2c}{Country code ISO2.}
#'   \item{country}{Name of the country.}
#'   \item{perc_energy_fosfuel}{Fossil fuel energy consumption ( \% of total).}
#'   \item{rnd_gdpshare}{Research and development expenditure (\% of GDP).}
#'   \item{percgni_adj_gross_savings}{Adjusted savings: gross savings (\% of GNI).}
#'   \item{real_netinc_percap}{Adjusted net national income per capita (constant 2010 US$).}
#'   \item{gdp_capita}{GDP per capita (current USD).}
#'   \item{top10perc_incshare}{Income share held by highest 10 \%.}
#'   \item{employment_ratio}{Employment to population ratio, 15+, total (\%) (national estimate).}
#'   \item{life_exp}{Life expectancy at birth, total (years).}
#'   \item{pop_growth}{Population growth (annual \%).}
#'   \item{pop}{Total population.}
#' }
#' @source \url{https://databank.worldbank.org/home.aspx}
"worldbank"

#' Chicago Public Schools school ratings
#'
#' A dataset containing variables for Chicago Public Schools.
#'
#' @format A data frame with 654 rows and 18 variables:
#' \describe{
#'   \item{school_id}{CPS School ID of the indicated school.}
#'   \item{short_name}{Short Name for each Public School in Chicago.}
#'   \item{school_type}{Type of each Public School in Chicago (example, Neighborhood/Charter/etc.}
#'   \item{primary_category}{ES indicates elementary school; MS indicates middle school;
#'    and HS indicates high school}
#'   \item{student_growth_rating}{Student Growth measures the change in standardized test scores between two points in time.
#'    This growth is compared to the average national growth for schools that started in the same place.
#'     A 50th percentile score means the school grew at the same rate as the national average.}
#'   \item{student_attainment_rating}{Measures how well the school performed on standardized test at a single point in time.
#'    A school's scores are compared to national average scores.
#'     A 50th percentile score means the school is performing at the same level as the national average school.}
#'   \item{culture_climate_rating}{Results are based on student and teacher responses to the My Voice, My School 5Essentials survey.
#'    For more information on this survey and other measures of school culture and climate visit  https://www.5-essentials.org/cps/5e/2018/}
#'   \item{creative_school_certification}{The Creative Schools Certification (CSC) identifies the level of arts instruction in each school in five categories from Emerging to Excelling.}
#'   \item{involved_families}{Category from 5 Essentials survey: does the school partner with families and communities?}
#'   \item{supportive_environment}{Category from 5 Essentials survey: is the school safe and supportive with high expectations?}
#'   \item{ambitious_teaching}{Category from 5 Essentials survey: is instruction focused, challenging, and engaging?}
#'   \item{effective_leaders}{Category from 5 Essentials survey: does leadership focus on results and school improvement?}
#'   \item{school_survey_safety}{Category from 5 Essentials survey: do students feel safe and does the school support positive behavior?}
#'   \item{attainment_math_pct_es}{Students' attainment in math.}
#'   \item{attainment_reading_pct_es}{Students' attainment in reading.}
#'   \item{student_attendance_pct2019}{Attendance of students in each Public School in Chicago for the year 2018-2019.}
#'   \item{teacher_attendance_pct2019}{Attendance of teachers in each Public School in Chicago for the year 2018-2019.}
#'   \item{chronic_truancy_pct}{A chronic truant is a student with 9 or more unexcused absences for the school year
#'    (5 percent or more of days enrolled).}
#' }
#' @source \url{https://data.cityofchicago.org/Education/Chicago-Public-Schools-School-Progress-Reports-SY1/dw27-rash}
"cps"

#' GSS dataset for in-class exercise
#'
#' The General Social Survey polls individuals about their attitudes and beliefs.
#' This dataset is contains a selection of variables relevant to predicting attitudes
#' towards racist college professors.
#'
#' @format A data frame with 1,974 rows and 25 variables:
#' \describe{
#'   \item{id}{Respondent Id Number}
#'   \item{wtss}{Weight Variable}
#'   \item{colrac}{College Teaching: Allow Racist to Teach}
#'   \item{age}{Respondent's Age}
#'   \item{authoritarianism}{Authoritarianism Scale}
#'   \item{black}{Is Respondent African American?}
#'   \item{cohort}{Year of birth}
#'   \item{colath}{College Teaching: Allow Anti-Religionist to Teach}
#'   \item{colmslm}{College Teaching: Allow Anti-American Muslim Clergymen to Teach}
#'   \item{degree}{Respondent's Highest Degree}
#'   \item{egalit_scale}{Egalitarianism Scale}
#'   \item{grass}{Should Marijuana Be Made Legal?}
#'   \item{hispanic_2}{Is Respondent Hispanic?}
#'   \item{income06}{Total Family Income}
#'   \item{owngun}{Have Gun in Home}
#'   \item{partyid_3}{Party Id: 3 Categories}
#'   \item{polviews}{Ideological Self-Placement}
#'   \item{pray}{How Often Does Respondent Pray}
#'   \item{pres08}{Vote Obama or Mccain}
#'   \item{race}{Race of Respondent}
#'   \item{sex}{Respondent's Sex}
#'   \item{social_cons3}{Social Conservatism}
#'   \item{south}{Respondent from South?}
#'   \item{tolerance}{Tolerance Scale}
#'   \item{wordsum}{Number Words Correct in Vocabulary Test}
#'   \item{zodiac}{Respondent's Astrological Sign}
#' }
#' @source 2012 General Social Survey.
"gss"


