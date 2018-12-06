*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Analysis File by Country
*ROMANIA

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis/CSES4cleanall.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"

preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==6420

*Graph of place by average self identification
egen yr2012=mean(ideoclean), by (placeclean), if year==2012
egen yr2014=mean(ideoclean), by (placeclean), if year==2014
twoway (scatter yr2012 placeclean, mcolor(black) msymbol(circle_hollow)) (scatter yr2014 placeclean, mcolor(black)), ytitle(Average Self-Identified Ideology) xtitle(Place of Residence) title(Romania)

**SELF_PLACEMENT IDEOLOGY***
*Set of Regressions for 2012
keep if year==2012
regress ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot, title(2012)
graph save "rm2012r.gph"

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2012)
graph save "ro2012.gph"

*Boxplot for the distribution of ideology by place
graph box ideoclean, over(placeclean) ytitle(Self-Identified Ideology) title(2012)
graph save "ro2012b.gph"

restore

*2014 Elections
preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==6420

*Set of Regressions for 2014
keep if year==2014
regress ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot, title(2014)
graph save "rm2014r.gph"

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2014)
graph save "ro2014.gph"

*Boxplot for the distribution of ideology by place
graph box ideoclean, over(placeclean) ytitle(Self-Identified Ideology) title(2014)
graph save "ro2014b.gph"

*Combine the Coefplots 
gr combine ro2012.gph ro2014.gph, title(Romania)
graph export "Graphs/Paper Graphs/Coefplots/IdeoCoef/Romania.pdf", replace 

*Combine Box Plots
gr combine ro2012b.gph ro2014b.gph, title(Romania)
graph export "Graphs/Paper Graphs/Box Plots/Romania.pdf", replace

*Combine the Regression plots
gr combine rm2012r.gph rm2014r.gph, title(Romania)
graph export "Graphs/Residuals/CountryIdeo/Romania.pdf", replace

**ISSUE STANCES***
*Set of Regressions for 2012
keep if year==2012
regress liberalism i.placeclean partyid close gender educ ses age religion
rvfplot, title(2012)
graph save "rm2012rlib.gph"

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2012)
graph save "ro2012lib.gph"

*Boxplot for the distribution of ideology by place
graph box liberalism, over(placeclean) ytitle(Issue Stances) title(2012)
graph save "ro2012blib.gph"

restore

*2014 Elections
preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==6420

*Set of Regressions for 2014
keep if year==2014
regress liberalism i.placeclean partyid close gender educ ses age religion
rvfplot, title(2014)
graph save "rm2014rlib.gph"

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2014)
graph save "ro2014lib.gph"

*Boxplot for the distribution of ideology by place
graph box liberalism, over(placeclean) ytitle(Issue Stances) title(2014)
graph save "ro2014blib.gph"

*Combine the Coefplots
gr combine ro2012lib.gph ro2014lib.gph, title(Romania)
graph export "Graphs/Paper Graphs/Coefplots/LibCoef/Romania.pdf", replace

*Combine Box Plots
gr combine ro2012blib.gph ro2014blib.gph, title(Romania)
graph export "Graphs/Paper Graphs/BoxLib/Romania.pdf", replace

*Combine Residual Plots
gr combine rm2012rlib.gph rm2014rlib.gph, title(Romania)
graph export "Graphs/Residuals/CountryLib/Romania.pdf", replace


restore
