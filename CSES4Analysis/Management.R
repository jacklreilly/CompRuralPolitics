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

library(ggpubr)

library(corrplot)

#Recode data using the car package and CrossTab to make sure the variable was recoded correctly
#D2031 - Rural-Urban Divide
data$rural<-car::recode(data$D2031, "7:9 = 'NA'")
CrossTable(data$D2031, data$rural)

#D3014 - Self-Placement on Ideology scale
data$selfideo <- car::recode(data$D3014, "95:99 = 'NA'")
CrossTable(data$D3014, data$selfideo)

#D2001_Y - Year of birth
data$year <- car::recode(data$D2001_Y, "9997:9999 = 'NA'")
CrossTable(data$D2001_Y, data$year)
data$currentyear <- 2019
which( colnames(data)=="year" )
data$year <- as.numeric(as.character(data$year), na.rm=TRUE)
data$currentyear <- as.numeric(as.character(data$currentyear), na.rm=TRUE)
data$age <- data[,488]-data[,487] 
data$age
hist(data[,489])

#D2002 - Gender of Respondent
data$gender <- car::recode(data$D2002, "7:9 = 'NA'")
CrossTable(data$D2002, data$gender)

#D2003 - Education
data$educ <- car::recode(data$D2003, "96:99 = 'NA'")
CrossTable(data$D2003, data$educ)

#D2012 - Socio-Economic Status
data$ses <- car::recode(data$D2012, "7:9 = 'NA'")
CrossTable(data$D2012, data$ses)

#Issue Stance Variables
#D3001_1 - Health
data$health <- car::recode(data$D3001_1, "7:9 = 'NA'")

#D3001_2 - Education
data$isveduc <- car::recode(data$D3001_2, "7:9 = 'NA'")

#D3001_3 - Unemployment Benefits
data$unemploy <- car::recode(data$D3001_3, "7:9 = 'NA'")

#D3001_4 - Defense
data$defense <- car::recode(data$D3001_4, "7:9 = 'NA'")

#D3001_5 - Old-Age Pensions
data$pensions <- car::recode(data$D3001_5, "7:9 = 'NA'")

#D3001_6 - Business and Industry
data$industry <- car::recode(data$D3001_6, "7:9 = 'NA'")

#D3001_7 - Police and law Enforcement
data$police <- car::recode(data$D3001_7, "7:9 = 'NA'")

#D3001_8 - Welfare benefits
data$welfare <- car::recode(data$D3001_8, "7:9 = 'NA'")

#D3004 - Government action on income levels
data$incomeineq <- car::recode(data$D3004, "7:9 = 'NA'")

#Coding of the Issue Stances Scale 6 (min) to 36 (max)

#destring all variables and ignore the missing variables (NA) in the computations
data$health <- as.numeric(as.character(data$health), na.rm=TRUE)
data$isveduc <- as.numeric(as.character(data$isveduc), na.rm=TRUE)
data$unemploy <- as.numeric(as.character(data$unemploy), na.rm=TRUE)
data$defense <- as.numeric(as.character(data$defense), na.rm=TRUE)
data$pensions <- as.numeric(as.character(data$pensions), na.rm=TRUE)
data$industry <- as.numeric(as.character(data$industry), na.rm=TRUE)
data$police <- as.numeric(as.character(data$police), na.rm=TRUE)
data$welfare <- as.numeric(as.character(data$welfare), na.rm=TRUE)
data$incomeineq <- as.numeric(as.character(data$incomeineq), na.rm=TRUE)

#View All data in Liberalism series
data$health 
data$isveduc
data$unemploy #Rid 495
data$defense #rid 496
data$pensions
data$industry #rid 498
data$police 
data$welfare 
data$incomeineq
#NOTE: For some reason not noticed before, the Unemployment, defense, and Industry spending variables are all missing and thus obmitted from Liberalism scale here

#Find Colnames
which( colnames(data)=="health" ) #493

#Add the Columns
data$liberalism <- data[,493]+data[,494]+data[,497]+data[,499]+data[,500]+data[,501]
data$liberalism
hist(data[,502])

#Create a subset liberalism frame
libvars <- data[, c(493, 494, 497, 499, 500, 501)]

#Correlation between liberalism variables

cor(libvars,  method = "pearson", use = "complete.obs")

pairs(libvars, jiggle=TRUE,factor=2)
pairs(libvars, method="pearson", pch = 20, lm=TRUE, cor=TRUE, jiggle=TRUE,factor=2, smoother=FALSE, stars=FALSE, ci=FALSE, alpha=.05)
