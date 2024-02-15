#### Preamble ####
# Purpose: Tests Real Airbnb Dataset based on Simulation Tests
# Author: Alaina Hu and Abdul Ahad Qureshi
# Date: 14 February 2023 
# Contact: alaina.hu@mail.utoronto.ca & ahad.qureshi@mail.utoronto.ca
# License: MIT
# Pre-requisites: Have access to simulation script and download data script 



#### Workspace setup ####
library(tidyverse)


#### Test data ####

#Making sure that each observation in the data set has at least one review
airbnb$review |> 
  min() == 1

#Making sure the ratings fall within the given range. 
#Overall Guest Satisfaction rating should be between 0 and 100.
# Accuracy, Cleanliness, Location, and Value ratings should be between 0 and 10.
airbnb$guest_satisfaction_overall |> min() >= 0 
airbnb$guest_satisfaction_overall |> max() <= 100 

airbnb$accuracy_rating |> min() >= 0
airbnb$accuracy_rating |> max() <= 10

airbnb$cleanliness_rating |> min() >= 0
airbnb$cleanliness_rating |> max() <= 10

airbnb$location_rating |> min() >= 0
airbnb$location_rating |> max() <= 10

airbnb$value_rating |> min() >= 0
airbnb$value_rating |> max() <= 10

airbnb$city |>
  unique() == c("toronto", "vancouver")

airbnb$new_price |> min() >= 0

#Checking the class of the variables
airbnb$guest_satisfaction_overall |> class() == "numeric"

airbnb$accuracy_rating |> class() == "numeric"

airbnb$cleanliness_rating |> class() == "numeric"

airbnb$location_rating |> class() == "numeric"

airbnb$value_rating |> class() == "numeric"

airbnb$review |> class() == "numeric"

airbnb$new_price |> class() == "numeric"

airbnb$city |> class() == "character"

