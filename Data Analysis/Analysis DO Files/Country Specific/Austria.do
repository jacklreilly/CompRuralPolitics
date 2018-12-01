*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Analysis File by Country
*AUSTRIA 2013

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis/CSES4cleanall.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"

preserve
destring polity, generate (polityds)

*INSERT COUNTRY CODE
keep if polityds==0400

*Describe variables
tab partyid

regress ideoclean i.placeclean partyid gender educ ses age religion
rvfplot

regress ideoclean i.placeclean##i.partyid gender educ ses age religion
rvfplot

*Margins - effect of party at every place
margins, dydx(partyid) at(placeclean)
marginsplot

