*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Analysis File

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CSES Data stages/CSES4clean.dta", clean

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
