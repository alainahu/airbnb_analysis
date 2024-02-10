#### Preamble ####
# Purpose: Replicated graphs from... [...UPDATE THIS...]
# Author: Alaina Hu
# Date: 08 February 2024 
# Contact: alaina.hu@utoronto.ca 
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
install.packages("ggplot2")
install.packages("haven")
install.packages("dplyr")
install.packages("readr")
install.packages("lm()")
library(haven)
library(dplyr)
library(ggplot2)
library(readr)
library(nlme)
#### Load data ####
data <- read_dta("~/Downloads/reduced_data.dta")
# write_csv(data, "inputs/data/reduced_data.csv") 
#### Replication ####
df <- read_csv("inputs/data/reduced_data.csv")
df <- df |> filter(df$new_price < 501)
ggplot(df, aes(x=new_price)) +
  geom_histogram(aes(y = ..density..), binwidth = (500 - 25) / 100, fill = "gray", color = "black") +
  scale_x_continuous(breaks = seq(25, 500, by = 75), limits = c(25, 500), name = "Price") +
  theme_minimal() +
  theme(plot.background = element_rect(fill = "white"),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank())