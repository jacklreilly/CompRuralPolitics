*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Analysis File by Country
*ISRAEL

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis/CSES4cleanall.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"

preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==3760

*Graph of place by average self identification
egen ident=mean(ideoclean), by (placeclean)
twoway (scatter ident placeclean), ytitle(Average Self-Identified Ideology) xtitle(Place of Residence) title(Israel)

***SELF-PLACEMENT IDEOLOGY
regress ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot, title(Israel)
graph export "Graphs/Residuals/CountryIdeo/Israel.pdf", replace

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES"age = "Age" religion = "Religious"  _cons = "Constant") title(Israel)
graph export "Graphs/Paper Graphs/Coefplots/IdeoCoef/Israel.pdf", replace

*Boxplot for the distribution of ideology by place
graph box ideoclean, over(placeclean) ytitle(Self-Identified Ideology) title(Israel)
graph export "Graphs/Paper Graphs/Box Plots/Israel.pdf", replace

*****ISSUE STANCES*****
regress liberalism i.placeclean partyid close gender educ ses age religion
rvfplot, title(Israel)
graph export "Graphs/Residuals/CountryLib/Israel.pdf", replace

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES"age = "Age" religion = "Religious"  _cons = "Constant") title(Israel)
graph export "Graphs/Paper Graphs/Coefplots/LibCoef/Israel.pdf", replace

*Boxplot for the distribution of ideology by place
graph box liberalism, over(placeclean) ytitle(Issue Stances) title(Israel)
graph export "Graphs/Paper Graphs/BoxLib/Israel.pdf", replace


restore
