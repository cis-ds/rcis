library(tidyverse)
library(wbstats)
# Authenticate API token

my_indicators <- c(
  # quantitative vars
  life_exp = "SP.DYN.LE00.IN",
  gdp_capita = "NY.GDP.PCAP.CD",
  pop = "SP.POP.TOTL",
  top10perc_incshare = "SI.DST.10TH.10",
  rnd_gdpshare = "GB.XPD.RSDV.GD.ZS",
  employment_ratio = "SL.EMP.TOTL.SP.NE.ZS",
  # Adjusted net national income per capita (constant 2010 US$)
  real_netinc_percap = "NY.ADJ.NNTY.PC.KD",
  percgni_adj_gross_savings = "NY.ADJ.ICTR.GN.ZS",
  pop_growth = "SP.POP.GROW",
  perc_energy_fosfuel = "EG.USE.COMM.FO.ZS"
)
countries <- c("US", "NO", "ID", "CN", "GB", "AR")

worldbank <- wb(
  country = countries,
  indicator = my_indicators,
  startdate = 2005,
  enddate = 2017,
  return_wide = TRUE
) %>%
  as_tibble() %>%
  rename(my_indicators)

usethis::use_data(worldbank, overwrite = TRUE)
