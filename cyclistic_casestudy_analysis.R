library(tidyverse)  #helps wrangle data
library(lubridate)  #helps wrangle date attributes
library(ggplot2)  #helps visualize data
getwd() #displays your working directory
setwd("/Users/gabch/Documents/Case Study/May 2021 - Apr 2022 data/Processed") 

#=====================
# STEP 1: COLLECT DATA
#=====================


Jun_2021 <- read_csv("202106-divvy-tripdata.csv")
Jul_2021 <- read_csv("202107-divvy-tripdata.csv")
Aug_2021 <- read_csv("202108-divvy-tripdata.csv")
Sep_2021 <- read_csv("202109-divvy-tripdata.csv")
Oct_2021 <- read_csv("202110-divvy-tripdata.csv")
Nov_2021 <- read_csv("202111-divvy-tripdata.csv")
Dec_2021 <- read_csv("202112-divvy-tripdata.csv")
Jan_2022 <- read_csv("202201-divvy-tripdata.csv")
Feb_2022 <- read_csv("202202-divvy-tripdata.csv")
Mar_2022 <- read_csv("202203-divvy-tripdata.csv")
Apr_2022 <- read_csv("202204-divvy-tripdata.csv")
May_2022 <- read_csv("202205-divvy-tripdata.csv")

#====================================================
# STEP 2: WRANGLE DATA AND COMBINE INTO A SINGLE FILE
#====================================================

colnames(Jun_2021)
colnames(Jul_2021)
colnames(Aug_2021)
colnames(Sep_2021)
colnames(Oct_2021)
colnames(Nov_2021)
colnames(Dec_2021)
colnames(Jan_2022)
colnames(Feb_2022)
colnames(Mar_2022)
colnames(Apr_2022)
colnames(May_2022)

# Stack individual quarter's data frames into one big data frame
all_trips <- bind_rows(Jun_2021, Jul_2021, Aug_2021, Sep_2021, Oct_2021, Nov_2021, Dec_2021, Jan_2022, Feb_2022, Mar_2022, Apr_2022, May_2022)

# Remove lat, long, birthyear, and gender fields as this data was dropped beginning in 2020
all_trips <- all_trips %>%  
  select(-c(start_lat, start_lng, end_lat, end_lng))
#======================================================
# STEP 3: CLEAN UP AND ADD DATA TO PREPARE FOR ANALYSIS
#======================================================
# Inspect the new table that has been created
colnames(all_trips)  #List of column names
nrow(all_trips)  #How many rows are in data frame?
dim(all_trips)  #Dimensions of the data frame?
head(all_trips)  #See the first 6 rows of data frame.  Also tail(all_trips)
str(all_trips)  #See list of columns and data types (numeric, character, etc)
summary(all_trips)  #Statistical summary of data. Mainly for numerics

