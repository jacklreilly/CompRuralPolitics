*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Analysis File by Country
*Greece

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis/CSES4cleanall.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"

preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==3000

*Graph of place by average self identification
egen yr2012=mean(ideoclean), by (placeclean), if year==2012
egen yr2015=mean(ideoclean), by (placeclean), if year==2015
twoway (scatter yr2012 placeclean, mcolor(black) msymbol(circle_hollow)) (scatter yr2015 placeclean, mcolor(black)), ytitle(Average Self-Identified Ideology) xtitle(Place of Residence) title(Greece)

**SELF IDENTIFIED IDEOLOGY
*Set of Regressions for Greece in 2012
keep if year==2012
regress ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot, title(2012)
graph save "gr2012r.gph", replace

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2012)
graph save "gr2012.gph"
*Boxplot for the distribution of ideology by place
graph box ideoclean, over(placeclean) ytitle(Self-Identified Ideology) title(2012)
graph save "gr2012b.gph"

restore

preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==3000

*Set of Regressions for Greece in 2015
keep if year==2015
regress ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot, title(2015)
graph save "gr2015r.gph"

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2015)
graph save "gr2015.gph"

*Boxplot for the distribution of ideology by place
graph box ideoclean, over(placeclean) ytitle(Self-Identified Ideology) title(2015)
graph save "gr2015b.gph"

*Combine the Coefplots
gr combine gr2012.gph gr2015.gph, title(Greece)
graph export "Graphs/Paper Graphs/Coefplots/IdeoCoef/Greece.pdf", replace 

*Combine Box Plots
gr combine gr2012b.gph gr2015b.gph, title(Greece)
graph export "Graphs/Paper Graphs/Box Plots/Greece.pdf", replace

*Combine Residual Plots
gr combine gr2012r.gph gr2015r.gph, title(Greece)
graph export "Graphs/Residuals/CountryIdeo/Greece.pdf", replace

restore

**ISSUE STANCES
*Set of Regressions for Greece in 2012
keep if year==2012
regress liberalism i.placeclean partyid close gender educ ses age religion
rvfplot, title(2012)
graph save "gr2012rlib.gph"

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2012)
graph save "gr2012lib.gph"
*Boxplot for the distribution of ideology by place
graph box liberalism, over(placeclean) ytitle(Issue Stances) title(2012)
graph save "gr2012blib.gph"

restore

preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==3000

*Set of Regressions for Greece in 2015
keep if year==2015
regress liberalism i.placeclean partyid close gender educ ses age religion
rvfplot, title(2015)
graph save "gr2015rlib.gph"

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2015)
graph save "gr2015lib.gph"

*Boxplot for the distribution of ideology by place
graph box liberalism, over(placeclean) ytitle(Issue Stances) title(2015)
graph save "gr2015blib.gph"

*Combine the Coefplots
gr combine gr2012lib.gph gr2015lib.gph, title(Greece)
graph export "Graphs/Paper Graphs/Coefplots/LibCoef/Greece.pdf", replace

*Combine Box Plots
gr combine gr2012blib.gph gr2015blib.gph, title(Greece)
graph export "Graphs/Paper Graphs/BoxLib/Greece.pdf", replace

*Combine Residual Plots
gr combine gr2012rlib.gph gr2015rlib.gph, title(Greece)
graph export "Graphs/Residuals/CountryLib/Greece.pdf", replace



restore
