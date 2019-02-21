#CSES Module 4 Data Cleaning 
#Author: Jennifer Lin
#Purpose: Clean Data - Also, generate an R version of Stata analysis

#Read in Data
data <- read.csv("/Users/JenniferLin/Desktop/Working/CSES/cses4.csv", header=TRUE)
#Set Working Directory

setwd("~/Desktop/Working/CompRuralPolitics/CSES4Analysis")

#Load Packages for the Analysis here
library(car) #statistics
library(gmodels) #Crosstabulations

#Recode data using the car package and CrossTab to make sure the variable was recoded correctly
#D2031 - Rural-Urban Divide
data$rural<-car::recode(data$D2031, "7:9 = '.'")
CrossTable(data$D2031, data$rural)

#D3014 - Self-Placement on Ideology scale
data$selfideo <- car::recode(data$D3014, "95:99 = '.'")
CrossTable(data$D3014, data$selfideo)

#D2001_Y - Year of birth
data$year <- car::recode(data$D2001_Y, "9997:9999 = '.'")
CrossTable(data$D2001_Y, data$year)
data$currentyear <- 2019
data$age <- data$currentyear - data$year
hist(data$age)

#D2002 - Gender of Respondent
data$gender <- car::recode(data$D2002, "7:9 = '.'")
CrossTable(data$D2002, data$gender)

#D2003 - Education
data$educ <- car::recode(data$D2003, "96:99 = '.'")
CrossTable(data$D2003, data$educ)

#D2012 - Socio-Economic Status
data$ses <- car::recode(data$D2012, "7:9 = '.'")
CrossTable(data$D2012, data$ses)

#Issue Stance Variables
#D3001_1 - Health
data$health <- car::recode(data$D3001_1, "7:9 = '.'")

#D3001_2 - Education
data$isveduc <- car::recode(data$D3001_2, "7:9 = '.'")

#D3001_3 - Unemployment Benefits
data$unemploy <- car::recode(data$D3001_3, "7:9 = '.'")

#D3001_4 - Defense
data$defense <- car::recode(data$D3001_4, "7:9 = '.'")

#D3001_5 - Old-Age Pensions
data$pensions <- car::recode(data$D3001_5, "7:9 = '.'")

#D3001_6 - Business and Industry
data$industry <- car::recode(data$D3001_6, "7:9 = '.'")

#D3001_7 - Police and law Enforcement
data$police <- car::recode(data$D3001_7, "7:9 = '.'")

#D3001_8 - Welfare benefits
data$welfare <- car::recode(data$D3001_8, "7:9 = '.'")

#D3004 - Government action on income levels
data$incomeineq <- car::recode(data$D3004, "7:9 = '.'")

#Coding of the Issue Stances Scale 9 (min) to 45 (max)
data$liberalism <- (data$health + data$isveduc + data$pensions + data$benefits + data$defense + data$industry + data$police + data$welfare + data$incomeineq)

