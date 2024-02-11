#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Alaina Hu and Ahad Qureshi
# Date: 11 February 2024 
# Contact: alaina.hu@utoronto.ca & ahad.qureshi@mail.utoronto.ca
# License: MIT
# Pre-requisites: Have the original data from replication package as well as cleaned version


#### Workspace setup ####
library(tidyverse)
library(haven)

#### Download data ####
#Main public art data set
airbnb_data <- read_dta("~/Downloads/airbnb_data.dta")


#### Save data ####

write_csv(airbnb_data, "inputs/data/airbnb_data.csv") 


