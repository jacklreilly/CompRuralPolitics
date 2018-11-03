*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Generate copy for GitHub storage

*Read in data
use "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis/CSES4clean.dta", clear

*Drop unclean variables
drop place
drop selfideo
drop levelofdemo
drop regimeage
drop executive
drop timesince
drop electformula

*Save Data
save "CSESdata.dta", replace
