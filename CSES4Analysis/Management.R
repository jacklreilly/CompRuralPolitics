#CSES Module 4 Data Cleaning 
#Author: Jennifer Lin
#Purpose: Clean Data - Also, generate an R version of Stata analysis

#Read in Data
data <- read.csv("/Users/JenniferLin/Desktop/Working/CSES/cses4.csv", header=TRUE)
#Set Working Directory
setwd("~/Desktop/Working/CompRuralPolitics/CSES4Analysis")

#Load Packages for the Analysis here
library(car) #statistics
library(dplyr) #Recoding
library(gmodels) #Crosstabulations

#Recode data using the car package and CrossTab to make sure the variable was recoded correctly
#D2031 - Rural-Urban Divide
data$rural <- recode(data$D2031, "7:9 = '.'")
CrossTable(data$D2031, data$rural)

#D3014 - Self-Placement on Ideology scale
data$selfideo <- recode(data$D3014, "95:99 = '.'")
CrossTable(data$D3014, data$selfideo)
