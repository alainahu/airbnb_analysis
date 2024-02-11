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
install.packages("broom")
install.packages("stargazer")
install.packages("biglm")
install.packages("psych")
install.packages("knitr")
install.packages("kableExtra")
install.packages("scales")
library(haven)
library(dplyr)
library(ggplot2)
library(readr)
library(stargazer)
library(psych)
library(knitr)
library(kableExtra)
library(scales)
#### Load data ####
df1 <- read_dta("~/Downloads/df1.dta")
df2 <- read_dta("~/Downloads/df2.dta")
df3 <- read_dta("~/Downloads/df3.dta")
write_csv(df1, "inputs/data/df1.csv") 
write_csv(df2, "inputs/data/df2.csv")
write_csv(df3, "inputs/data/df3.csv")
#### Replication ####

#Figure 1
df1 <- read_csv("inputs/data/df1.csv")
df1 <- df1 |> filter(df1$new_price < 501)
ggplot(df1, aes(x=new_price)) +
  geom_histogram(aes(y = ..density..), binwidth = (500 - 25) / 100, fill = "gray", color = "black") +
  scale_x_continuous(breaks = seq(25, 500, by = 75), limits = c(25, 500), name = "Price") +
  theme_minimal() +
  theme(plot.background = element_rect(fill = "white"),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank())

#Table A1 from Appendix
df2 <- read_csv("inputs/data/df2.csv")
col1 <- df2 |> 
  count(city) |> 
  mutate(percentage = n / sum(n) * 100)
df2_unique <- df2 |>
  distinct(newid, .keep_all = TRUE)
col2 <- df2_unique |>
  count(city) |> 
  mutate(percentage = n / sum(n) * 100)


combined_df <- left_join(col1, col2, by = "city", suffix = c("_all", "_unique"))
combined_df <- combined_df |>
  rename(`#` = n_all,
         `share` = percentage_all,
         `  #` = n_unique,
         `  share` = percentage_unique) |>
  mutate(city = case_when(
    city == "amsterdam" ~ "Amsterdam",
    city == "barcelona" ~ "Barcelona",
    city == "berlin" ~ "Berlin",
    city == "boston" ~ "Boston",
    city == "chicago" ~ "Chicago",
    city == "florence" ~ "Florence",
    city == "london" ~ "London",
    city == "los-angeles" ~ "Los Angeles",
    city == "madrid" ~ "Madrid",
    city == "marseille" ~ "Marseille",
    city == "miami" ~ "Miami",
    city == "milan" ~ "Milan",
    city == "montreal" ~ "Montreal",
    city == "new-york" ~ "New York",
    city == "paris" ~ "Paris",
    city == "rome" ~ "Rome",
    city == "san-francisco" ~ "San Francisco",
    city == "toronto" ~ "Toronto",
    city == "vancouver" ~ "Vancouver",
    TRUE ~ city
  )) |>
  mutate(
    across(ends_with("#"), ~comma(., big.mark = ",")),  
    across(ends_with("share"), ~number(., accuracy = 0.01)) 
  )
kable_out <- kable(combined_df, "html", align = c('l', 'r', 'r', 'r', 'r'), escape = FALSE) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) %>%
  add_header_above(c(" " = 1, "Observations" = 2, "Listings" = 2))
kable_out

#Figure A3 from Appendix
df3 <- read_csv("inputs/data/df3.csv")
ggplot(df3[df3$review <= 50, ], aes(x = review)) +
  geom_histogram(aes(y = ..density..), binwidth = 0.5, fill = "gray", color = "black") +
  scale_x_continuous(name = "Number of reviews", breaks = seq(0, 50, by = 10)) +
  theme_minimal() +  # Starting with a minimal theme
  theme(
    plot.background = element_rect(fill = "white", color = NA),  # Set the plot background color
    panel.grid.major = element_blank(),  # Remove major grid lines
    panel.grid.minor = element_blank(),  # Remove minor grid lines
    panel.background = element_rect(fill = "white", color = "black"),  # Set panel background color
    axis.line = element_line(color = "black")  # Set axis line color
  ) +
  labs(x = "Number of reviews", y = "Density")

