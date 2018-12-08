*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Analysis File

**********************************
****HOW TO USE THIS FILE**********
**********************************

* This file is intended for the analysis of the data on a large scale. All country specific analyses are completed in the individual DO Files for the country
* Not all of the analyses in this file are reported in the final paper
* The unreported code is still included in this file and commented on for future reference in the event they are relavant to a future project.
* Much of this is kept to show the development and progression of ideas for this project

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

*With party ID and closeness to party
reg ideoclean i.placeclean democlean regageclean formulaclean partyid close gender educ ses age religion
rvfplot

reg ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot, title(Residual with Ideology as Dependent Variable)

*Sorted by Polity
bys electlab: reg ideoclean i.placeclean gender educ ses age religion
rvfplot

*Added party Idenfitication
bys electlab: reg ideoclean i.placeclean partyid close gender educ ses age religion

*By Electoral Formula
bys formulaclean: reg ideoclean i.placeclean partyid close gender educ ses age religion


*Using objective Issue Stances 
reg liberalism i.placeclean partyid close gender educ ses age religion
rvfplot, title(Residuals with Liberalism as Dependent Variable)

reg liberalism i.placeclean democlean regageclean formulaclean partyid close gender educ ses age religion
rvfplot

bys electlab: reg liberalism i.placeclean partyid close gender educ ses age religion

****************************************
*******UNDERSTANDING MACRO VARIABLES****
****************************************

*Maintains all individual level controls and other regime macro variables

reg ideoclean i.placeclean democlean regageclean formulaclean freehouse corrupt gender age ses educ partyid close religion
rvfplot, title(All Macro and Micro Varaibles)
graph export "Macroresid.pdf"

*Interaction with Place and Democracy
reg ideoclean i.placeclean##i.democlean regageclean formulaclean freehouse corrupt gender age ses educ partyid close religion
rvfplot
margins, dydx(placeclean) at(democlean=(8(1)10))
marginsplot
graph export "IdeoPlaceDem.pdf", replace

reg liberalism i.placeclean##i.democlean regageclean formulaclean freehouse corrupt gender age ses educ partyid close religion
rvfplot
margins, dydx(placeclean) at(democlean=(8(1)10))
marginsplot
graph export "LibPlaceDem.pdf", replace

*Interaction with Place and Regime Age
reg ideoclean i.placeclean##c.regageclean democlean formulaclean freehouse corrupt gender age ses educ partyid close religion
rvfplot
margins, dydx(placeclean) at(regageclean=(0(25)200))
marginsplot
graph export "IdeoPlaceAge.pdf", replace

reg liberalism i.placeclean##c.regageclean democlean formulaclean freehouse corrupt gender age ses educ partyid close religion
rvfplot
margins, dydx(placeclean) at(regageclean=(0(25)200))
marginsplot
graph export "LibPlaceAge.pdf", replace

*Interaction with Place and Electoral Formula
reg ideoclean i.placeclean##i.formulaclean regageclean democlean freehouse corrupt gender age ses educ partyid close religion
rvfplot
margins, dydx(placeclean) at(formulaclean=(1 2 3))
marginsplot
graph export "IdeoPlaceFormula.pdf", replace

reg liberalism i.placeclean##i.formulaclean regageclean democlean freehouse corrupt gender age ses educ partyid close religion
rvfplot
margins, dydx(placeclean) at(formulaclean=(1 2 3))
marginsplot
graph export "LibPlaceFormula.pdf", replace

*To see if there are interesting trends

*Interaction with Place and Freedom House Rating
reg ideoclean i.placeclean##c.freehouse formulaclean regageclean democlean corrupt gender age ses educ partyid close religion
rvfplot
margins, dydx(placeclean) at(freehouse=(4(.5)7))
marginsplot
graph export "IdeoPlaceFree.pdf", replace

reg liberalism i.placeclean## c.freehouse formulaclean regageclean democlean corrupt gender age ses educ partyid close religion
rvfplot
margins, dydx(placeclean) at(freehouse=(4(.5)7))
marginsplot
graph export "LibPlaceFree.pdf", replace

*Interaction with Place and Corruption
reg ideoclean i.placeclean##c.corrupt freehouse formulaclean regageclean democlean gender age ses educ partyid close religion
rvfplot
margins, dydx(placeclean) at(corrupt=(0(10)100))
marginsplot
graph export "IdeoPlaceCorrupt.pdf", replace

reg liberalism i.placeclean##c.corrupt freehouse formulaclean regageclean democlean gender age ses educ partyid close religion
rvfplot
margins, dydx(placeclean) at(corrupt=(0(10)100))
marginsplot
graph export "LibPlaceCorrupt.pdf", replace
