#CSES Module 4 Data Cleaning 
#Author: Jennifer Lin
#Purpose: Clean Data - Also, generate an R version of Stata analysis

#Read in Data
data <- read.csv("/Users/JenniferLin/Desktop/Working/CSES/cses4.csv")

library(car) #statistics
library(dplyr) #Recoding
library(gmodels) #Crosstabulations

#Recode data using the car package
data$rural <- recode(data$D2031, "7:9 = '.'")
CrossTable(data$D2031, data$rural)

