#### Preamble ####
# Purpose: Cleans airbnb_data.csv for analysis
# Author: Alaina Hu and Ahad Qureshi
# Date: 11 February 2024 
# Contact: alaina.hu@utoronto.ca & ahad.qureshi@mail.utoronto.ca
# License: MIT
# Pre-requisites: Have access to airbnb_data.csv


#### Workspace setup ####
library(tidyverse)


#### Clean data ####
uncleaned_data <- read_csv("inputs/data/airbnb_data.csv")
cleaned_data <- na.omit(uncleaned_data) |>
  select(review, 
         guest_satisfaction_overall, 
         accuracy_rating,
         cleanliness_rating,
         location_rating,
         value_rating,
         city,
         new_price, log_price) |>
  filter(is.finite(new_price), !is.na(new_price))

#### Save data ####
write_csv(cleaned_data, "inputs/data/airbnb_cleaned_data.csv")

