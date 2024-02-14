#### Preamble ####
# Purpose: Simulates the data for the Airbnb analysis of reviews and price
# Author: Alaina Hu and Ahad Qureshi
# Date: 13 February 2024 
# Contact: alaina.hu@utoronto.ca & ahad.qureshi@mail.utoronto.ca
# License: MIT
# Pre-requisites: Find the master data set in the replication package of the original article
# Any other information needed? NA


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####

#Assuming that there are 100 Airbnb listings across Toronto and Vancouver
#Assuming that Airbnb prices lie between $25 and $500 per night
#Each row is a listing 

#Setting seed to get the same simulated results
set.seed(106)
simulated_airbnb <- tibble(review = sample(1:500, size = 100, replace = TRUE),
                           guest_satisfaction_overall = sample(0:100, size = 100, replace = TRUE),
                           accuracy_rating = sample(0:10, size = 100, replace = TRUE),
                           cleanliness_rating = sample(0:10, size = 100, replace = TRUE),
                           location_rating = sample(0:10, size = 100, replace = TRUE),
                           value_rating = sample(0:10, size = 100, replace = TRUE), 
                           city = sample(c("toronto", "vancouver"), size = 100, replace = TRUE),
                           price = sample(25:500, size = 100, replace = TRUE))

#### Tests ####

#Making sure that each observation in the data set has at least one review
simulated_airbnb$review |> 
  min() == 1

#Making sure the ratings fall within the given range. 
#Overall Guest Satisfaction rating should be between 0 and 100.
# Accuracy, Cleanliness, Location, and Value ratings should be between 0 and 10.
simulated_airbnb$guest_satisfaction_overall
