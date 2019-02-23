*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Analysis File by Country
*SLOVAKIA

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis/CSES4cleanall.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"

preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==7030

*Graph of place by average self identification
egen ident=mean(ideoclean), by (placeclean)
twoway (scatter ident placeclean), ytitle(Average Self-Identified Ideology) xtitle(Place of Residence) title(Slovakia)

***SELF-PLACEMENT IDEOLOGY
regress ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot, title(Slovakia)
graph export "Graphs/Residuals/CountryIdeo/Slovakia.pdf", replace

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES"age = "Age" religion = "Religious"  _cons = "Constant") title(Slovakia)
graph export "Graphs/Paper Graphs/Coefplots/IdeoCoef/Slovakia.pdf", replace

*Boxplot for the distribution of ideology by place
graph box ideoclean, over(placeclean) ytitle(Self-Identified Ideology) title(Slovakia)
graph export "Graphs/Paper Graphs/Box Plots/Slovakia.pdf", replace

restore
