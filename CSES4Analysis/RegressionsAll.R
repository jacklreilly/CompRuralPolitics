#CSES Module 4
#Author: Jennifer Lin
#Purpose: Run Regressions between variables
#Lives in the R project for Comparative Rural Politics


#Load some packages
library(dplyr)
library(dotwhisker)
library(broom)
library(coefplot)
library(car)

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

#Use Rural as Factor to determine average self-ideo for each country
data$rurality <- factor(data$rural, 
                             levels = c(1, 2, 3, 4),
                             labels = c("Rural", "Twon", "Suburban", "City"))
data$rurality
groups <- group_by(data, election, rurality)

library(forcats)
data$rurality.complete <- fct_explicit_na(data$rurality, na_level = "(Missing)")

descrip.ideo <- summarise(groups,
                          mean = mean(selfideo, na.rm=TRUE),
                          sd = sd(selfideo, na.rm=TRUE),
                          n = n(),
                          se=sd/sqrt(n),
                          ci = qt(0.975,df=n-1)*se)

descrip.ideo