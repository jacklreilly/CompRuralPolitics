*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Analysis File by Country
*LATVIA

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis/CSES4cleanall.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"

preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==4280

*Graph of place by average self identification
egen yr2011=mean(ideoclean), by (placeclean), if year==2011
egen yr2014=mean(ideoclean), by (placeclean), if year==2014
twoway (scatter yr2011 placeclean, mcolor(black) msymbol(circle_hollow)) (scatter yr2014 placeclean, mcolor(black)), ytitle(Average Self-Identified Ideology) xtitle(Place of Residence) title(Latvia)

**SELF IDENTIFIED IDEOLOGY
*Set of Regressions for Latvia in 2011
keep if year==2011
regress ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot, title(2011)
graph save "la2011r.gph", replace

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2011)
graph save "la2011.gph"

*Boxplot for the distribution of ideology by place
graph box ideoclean, over(placeclean) ytitle(Self-Identified Ideology) title(2011)
graph save "la2011b.gph"

restore

preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==4280

*Set of Regressions for Latvia in 2014
keep if year==2014
regress ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot, title(2014)
graph save "la2014r.gph", replace

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2014)
graph save "la2014.gph"

*Boxplot for the distribution of ideology by place
graph box ideoclean, over(placeclean) ytitle(Self-Identified Ideology) title(2014)
graph save "la2014b.gph"

*Combine the Coefplots
gr combine la2011.gph la2014.gph, title(Latvia)
graph export "Graphs/Paper Graphs/Coefplots/IdeoCoef/Latvia.pdf", replace 

*Combine Box Plots
gr combine la2011b.gph la2014b.gph, title(Lativa)
graph export "Graphs/Paper Graphs/Box Plots/Latvia.pdf", replace

*Combine Residual Plots
gr combine la2011r.gph la2014r.gph, title(Latvia)
graph export "Graphs/Residuals/CountryIdeo/Latvia.pdf", replace

restore

*****ISSUE STANCES*****
preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==4280

regress liberalism i.placeclean partyid close gender educ ses age religion
rvfplot, title(Latvia)
graph export "Graphs/Residuals/CountryLib/Latvia.pdf", replace

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES"age = "Age" religion = "Religious"  _cons = "Constant") title(Latvia)
graph export "Graphs/Paper Graphs/Coefplots/LibCoef/Latvia.pdf", replace

*Boxplot for the distribution of ideology by place
graph box liberalism, over(placeclean) ytitle(Issue Stances) title(Latvia)
graph export "Graphs/Paper Graphs/BoxLib/Latvia.pdf", replace

restore

