02\_wrangle-packages.R
================
User
Thu Oct 04 14:52:57 2018

``` r
## remember to restart R here!

## create a data frame by reading from data/installed-packages.csv
## hint: readr::read_csv() or read.csv()
## idea: try using here::here() to create the file path
library(tidyverse)
```

    ## -- Attaching packages ----------------------------------------------- tidyverse 1.2.1 --

    ## v ggplot2 3.0.0     v purrr   0.2.5
    ## v tibble  1.4.2     v dplyr   0.7.6
    ## v tidyr   0.8.1     v stringr 1.3.1
    ## v readr   1.1.1     v forcats 0.3.0

    ## -- Conflicts -------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(here)
```

    ## here() starts at C:/Users/User/Desktop/explorer-libraries

``` r
tblPack <- readr::read_csv(here("data","installed-packages.csv"))
```

    ## Parsed with column specification:
    ## cols(
    ##   Package = col_character(),
    ##   LibPath = col_character(),
    ##   Version = col_character(),
    ##   Priority = col_character(),
    ##   Built = col_character()
    ## )

``` r
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
```
