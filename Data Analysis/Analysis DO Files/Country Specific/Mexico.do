*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Analysis File by Country
*MEXICO

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis/CSES4cleanall.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"

preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==4840

*Graph of place by average self identification
egen yr2012=mean(ideoclean), by (placeclean), if year==2012
egen yr2015=mean(ideoclean), by (placeclean), if year==2015
twoway (scatter yr2012 placeclean, mcolor(black) msymbol(circle_hollow)) (scatter yr2015 placeclean, mcolor(black)), ytitle(Average Self-Identified Ideology) xtitle(Place of Residence) title(Mexico)

**Self Identified IDEOLOGY
*Set of Regressions for 2012
keep if year==2012
regress ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot, title(2012)
graph save "mx2012r.gph"

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2012)
graph save "mx2012.gph"

*Boxplot for the distribution of ideology by place
graph box ideoclean, over(placeclean) ytitle(Self-Identified Ideology) title(2012)
graph save "mx2012b.gph"

restore

*2015 Elections
preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==4840

*Set of Regressions for 2015
keep if year==2015
regress ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot, title(2015)
graph save "mx2015r.gph"

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2015)
graph save "mx2015.gph"

*Boxplot for the distribution of ideology by place
graph box ideoclean, over(placeclean) ytitle(Self-Identified Ideology) title(2015)
graph save "mx2015b.gph"

*Combine the Coefplots 
gr combine mx2012.gph mx2015.gph, title(Mexico)
graph export "Graphs/Paper Graphs/Coefplots/IdeoCoef/Mexico.pdf", replace 

*Combine Box Plots
gr combine mx2012b.gph mx2015b.gph, title(Mexico)
graph export "Graphs/Paper Graphs/Box Plots/Mexico.pdf", replace

*Combine Residual Plots
gr combine mx2012r.gph mx2015r.gph, title(Mexico)
graph export "Graphs/Residuals/CountryIdeo/Mexico.pdf", replace

**ISSUE STANCES
*Set of Regressions for 2012
keep if year==2012
regress liberalism i.placeclean partyid close gender educ ses age religion
rvfplot, title(2012)
graph save "mx2012rlib.gph"

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2012)
graph save "mx2012lib.gph"

*Boxplot for the distribution of ideology by place
graph box liberalism, over(placeclean) ytitle(Issue Stances) title(2012)
graph save "mx2012blib.gph"

restore

*2015 Elections
preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==4840

*Set of Regressions for 2015
keep if year==2015
regress liberalism i.placeclean partyid close gender educ ses age religion
rvfplot, title(2015)
graph save "mx2015rlib.gph"

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2015)
graph save "mx2015lib.gph"

*Boxplot for the distribution of ideology by place
graph box liberalism, over(placeclean) ytitle(Issue Stances) title(2015)
graph save "mx2015blib.gph"

*Combine Coefficient Plots
gr combine mx2012lib.gph mx2015lib.gph, title(Mexico)
graph export "Graphs/Paper Graphs/Coefplots/LibCoef/Mexico.pdf", replace

*Combine Box Plots
gr combine mx2012blib.gph mx2015blib.gph, title(Mexico)
graph export "Graphs/Paper Graphs/BoxLib/Mexico.pdf", replace

*Combine Residual Plots
gr combine mx2012rlib.gph mx2015rlib.gph, title(Mexico)
graph export "Graphs/Residuals/CountryLib/Mexico.pdf", replace


restore
