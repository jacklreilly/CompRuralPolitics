#CSES Module 4
#Author: Jennifer Lin
#Purpose: Run Regressions between variables
#Lives in the R project for Comparative Rural Politics

#Load some packages
library(dplyr)
library(dotwhisker)
library(broom)
library(coefplot)

#View Data
str(data$rural)
data$rural <- as.numeric(as.character(data$rural), na.rm=TRUE)

data$selfideo <- as.numeric(as.character(data$selfideo), na.rm=TRUE)
str(data$selfideo)


#Regression for self-placement ideology
ideology <- lm(selfideo ~ factor(rural), data = data)
summary(ideology)
coefplot(ideology)

#Run regressions variables by country
ideocountry <- data %>% group_by(data$election) %>% do(model = lm(selfideo ~ rural, data = data), na.rm = TRUE)
ideocountry$model

ideo <- lm(selfideo ~ rural + election, data = data)
summary(issue)

#Regression for Liberalism - ALL Issues
issuestance <- lm(liberalism ~ factor(rural), data = data)
summary(issuestance)

#Run Regressions by country
issuecountry <- data %>% group_by(data$election) %>% do(model = lm(liberalism ~ rural, data = data), na.rm = TRUE)
issuecountry$model

issue <- lm(liberalism ~ rural + election, data = data)
summary(issue)


