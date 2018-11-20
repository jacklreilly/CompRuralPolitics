*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Analysis File by Country
*ARGENTINA 2015

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CSES Data stages/CSES4cleanall.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"

preserve
destring polity, generate (polityds)
keep if polityds==0320

regress ideoclean i.placeclean

*Bar graph of ideology over each palce distribution
graph bar (count), over(ideoclean) over(placeclean) ytitle(Frequency) title(Argentina: Political Ideology By Place of Residence)
