#' ---
#' output: github_document
#' ---

## remember to restart R here!

## create a data frame by reading from data/installed-packages.csv
## hint: readr::read_csv() or read.csv()
## idea: try using here::here() to create the file path
library(tidyverse)
library(here)
tblPack <- readr::read_csv(here("data","installed-packages.csv"))


## filter out the base and recommended packages
## keep the variables Package and Built
## if you use dplyr, code like this will work:
tblPack <- tblPack %>%
  filter(! Priority %in% c("base","recommended")) %>%
  select(Package, Built)

## write this new, smaller data frame to data/add-on-packages.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path
write_csv(tblPack,here("data","add-on-packages.csv"))

## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:
tblFreq <- tblPack %>%
  count(Built) %>%
  mutate(prop = n / sum(n))

View(tblFreq)
## write this data frame to data/add-on-packages-freqtable.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path
write_csv(tblFreq,here("data","add-on-packages-freqtable.csv"))
## YES overwrite the files that are there now
## they came from me (Jenny)
## they are just examples
