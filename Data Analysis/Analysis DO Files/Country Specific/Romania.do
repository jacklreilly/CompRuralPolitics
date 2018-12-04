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

*Set of Regressions for 2012
keep if year==2012
regress ideoclean i.placeclean partyid close gender educ ses age religion
rvfplot

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
rvfplot

*Graph of the coefficients from the regression
coefplot, xline(0) coeflabels(2.placeclean = "Small Town" 3.placeclean = "Suburban" 4.placeclean = "Urban" partyid = "Party ID" close = "Close to Party" gender = "Gender" educ = "Education" ses = "SES" age = "Age" religion = "Religious"  _cons = "Constant") title(2014)
graph save "ro2014.gph"

*Boxplot for the distribution of ideology by place
graph box ideoclean, over(placeclean) ytitle(Self-Identified Ideology) title(2014)
graph save "ro2014b.gph"

*Combine the Coefplots 
gr combine ro2012.gph ro2014.gph, title(Romania)

*Combine Box Plots
gr combine ro2012b.gph ro2014b.gph, title(Romania)




restore
