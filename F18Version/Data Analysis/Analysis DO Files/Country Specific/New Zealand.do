*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Analysis File by Country
*NEW ZEALAND

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis/CSES4cleanall.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"

preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==5540

*Graph of place by average self identification
egen yr2011=mean(ideoclean), by (placeclean), if year==2011
egen yr2014=mean(ideoclean), by (placeclean), if year==2014
twoway (scatter yr2011 placeclean, mcolor(black) msymbol(circle_hollow)) (scatter yr2014 placeclean, mcolor(black)), ytitle(Average Self-Identified Ideology) xtitle(Place of Residence) title(New Zealand)

keep if year==2011

***SELF-PLACEMENT IDEOLOGY
regress ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot, title(New Zealand)
graph export "Graphs/Residuals/CountryIdeo/NZealand.pdf", replace

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES"age = "Age" religion = "Religious"  _cons = "Constant") title(New Zealand)
graph export "Graphs/Paper Graphs/Coefplots/IdeoCoef/NZealand.pdf", replace

*Boxplot for the distribution of ideology by place
graph box ideoclean, over(placeclean) ytitle(Self-Identified Ideology) title(New Zealand)
graph export "Graphs/Paper Graphs/Box Plots/NZealand.pdf", replace

*****ISSUE STANCES*****
regress liberalism i.placeclean partyid close gender educ ses age religion
rvfplot, title(New Zealand)
graph export "Graphs/Residuals/CountryLib/NZealand.pdf", replace

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES"age = "Age" religion = "Religious"  _cons = "Constant") title(New Zealand)
graph export "Graphs/Paper Graphs/Coefplots/LibCoef/NZealand.pdf", replace

*Boxplot for the distribution of ideology by place
graph box liberalism, over(placeclean) ytitle(Issue Stances) title(New Zealand)
graph export "Graphs/Paper Graphs/BoxLib/NZealand.pdf", replace



restore
