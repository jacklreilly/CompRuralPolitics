*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Tables

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CSES Data stages/CSES4cleanall.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"

*Table of which polity had what election - cells with a number were replaced with an X on the final paper whereas those with 0 were replaced with a -
tab electlab electiontype

bys electlab: tab placeclean

*Generate a table to reflect level of democracy, regime age and Electoral Formula
preserve
collapse (mean) democlean regageclean formulaclean, by (electlab)
tab electlab democlean regageclean formulaclean
