*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Analysis File

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis/CSES4cleanall.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"


*************************************
*******SUMMARY STATISTICS************
*************************************

*sum place and ideology variables
sum placeclean, detail
sum ideoclean, detail
sum democlean, detail

*************************************
*********DRAW SOME GRAPHS************
*************************************

*Distribution of place in sample
graph bar (count), over(placeclean) ytitle(Number of Repondents) title(Distribution of Residents)


*************************************
***********REGRESSIONS***************
*************************************

*Regression: Ideology as the dependent variable with Place as the independent
*Treat Place as a categorical Dummy variable (1 = Rural area or Village is the defaul baseline)
regress ideoclean i.placeclean
rvfplot


*Regression: Same as above but factoring the level of democracy in the regime, treated here as a continuous variable

regress ideoclean i.placeclean democlean
rvfplot

*Regression: Ideology and the interaction between place and level of democratization

regress ideoclean i.placeclean##c.democlean
rvfplot

*Margins: Effects of place at each level of democratization
margins, at(democlean=(-10(1)10))
marginsplot

margins, dydx(placeclean) at(democlean=(-10(1)10))
marginsplot

********************************
*********SORT BY POLITY*********
********************************

*Run Regression of Polity
bys polity: reg ideoclean i.placeclean

*By Each level of Democracy, Regress place on ideology
bys democlean: reg ideoclean i.placeclean

*By Electoral Formula, regress place on ideology
bys formulaclean: reg ideoclean i.placeclean

*By Regime Age, regress place on ideology
bys regageclean: reg ideoclean i.placeclean

*if bys polity and reg ideoclean placeclean democlean/regageclean, stata will omit the latter variables due to colinearity.
*Treat Regime Age as part of the regression: Does place interact with regime age in influencing ideology?

*I looked at place and democracy rating to show its interaction - Since most regimes are democracies, does the length of democracy influence people's ideology based on where they live?
regress ideoclean i.placeclean regageclean
rvfplot

*Examine the interaction between the variables
reg ideoclean i.placeclean##c.regageclean
rvfplot

*margins plot
margins, at(regageclean=(0(10)300))
marginsplot

margins, dydx(placeclean) at(regageclean=(0(10)300))
marginsplot

*Use polity as a variable in the regression just like how I used regime age and level of democracy
destring polity, generate (polityds)
reg ideoclean i.placeclean i.polityds
rvfplot

*How about the Interaction
reg ideoclean i.placeclean##i.polityds
rvfplot

sum polityds

*Margins!
margins i.placeclean##i.polityds

***For the Liberalism variable***
*Regression with all the variables 
reg liberalism i.placeclean democlean regageclean formulaclean
rvfplot

*bysort election. regress liberalism components on place
bys electlab: reg health i.placeclean
reg health i.placeclean
rvfplot

bys electlab: reg income i.placeclean
reg income i.placeclean
rvfplot

*sort by election - using a differnt election identifier from above
bys electlab: reg ideoclean i.placeclean

******************************************
********REGRESSIONS WITH CONTROLS*********
******************************************

*Regression Place on self placement ideology
*Control Variables 
*D2002    GENDER
*D2003    EDUCATION
*D2012    SOCIO ECONOMIC STATUS
*D2001_Y  DATE OF BIRTH OF RESPONDENT - YEAR
*D2025    RELIGIOSITY

*Using only participant characteristics and controls
reg ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot

*Including country controls
reg ideoclean i.placeclean democlean regageclean formulaclean gender educ ses age religion
rvfplot

reg ideoclean i.placeclean democlean regageclean formulaclean partyid close gender educ ses age religion
rvfplot

reg ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot

*Sorted by Polity
bys electlab: reg ideoclean i.placeclean gender educ ses age religion
rvfplot

*Added party Idenfitication
bys electlab: reg ideoclean i.placeclean partyid close gender educ ses age religion

*By Electoral Formula
bys formulaclean: reg ideoclean i.placeclean partyid close gender educ ses age religion


*Using objective Issue Stances 
reg liberalism i.placeclean partyid close gender educ ses age religion
rvfplot
reg liberalism i.placeclean democlean regageclean formulaclean partyid close gender educ ses age religion
rvfplot

bys electlab: reg liberalism i.placeclean partyid close gender educ ses age religion
