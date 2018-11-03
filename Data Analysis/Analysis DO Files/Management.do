*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Management File: Clean data


*For this project, I am interested in the following variables
*D1006 Polity Identifier
*D1008 Election year
*D1010_1 Weights Sample
*D1010_2 Weights Demographic
*D1010_3 Weights Political 
*D1015 Election Type
*D2031 Urban/Rural place of Residence
*D3014 Self Ideology
*D5051_1 Democracy to Autocracy scale at the time of the election
*D5052 Age of Current Regime
*D5054 Type of Executive
*D5056 Number of Months since last presidential election
*D5058 Electoral Formula

*Reload data using specified variables
use D1006 D1008 D1010_1 D1010_2 D1010_3 D1015 D2031 D3014 D5051_1 D5052 D5054 D5056 D5058 using "/Users/pebl/Desktop/Working/cses4.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"

*Save Working copy of data
save "CSES4Select.dta", replace

****************************
*****Clean Data*************
****************************

*Rename Variables
rename D1006 polity
rename D1008 year
rename D1015 electiontype
rename D2031 place
rename D3014 selfideo
rename D5051_1 levelofdemo
rename D5052 regimeage
rename D5054 executive
rename D5056 timesince
rename D5058 electformula

*clean Variables
recode place (7/9 =.), generate (placeclean)
recode selfideo (95 97 98 99 =.), gen (ideoclean)
recode levelofdemo (99 =.), gen (democlean)
recode regimeage (999 =.), gen (regageclean)
recode executive (9 =.), gen (execclean)
recode timesince (999 =.), gen (timeclean)
recode electformula (9 =.), gen (formulaclean)

*Save clean data
save "CSES4clean.dta", replace
