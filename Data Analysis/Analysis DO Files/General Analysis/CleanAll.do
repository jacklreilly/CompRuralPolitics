*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Management File: Clean data while keeping all other variables intact

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

*RLoad data using specified variables
use "/Users/pebl/Desktop/Working/CSES Data stages/cses4.dta", clear
cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"

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

*recode variables for Liberalism measure
*Defense and police are reverse coded
recode D3001_1 (1 =0) (2 =.25) (3 =.5) (4 =.75) (5 =1) (7/9 =.), generate (health)
recode D3001_2 (1 =0) (2 =.25) (3 =.5) (4 =.75) (5 =1) (7/9 =.), generate (education)
recode D3001_3 (1 =0) (2 =.25) (3 =.5) (4 =.75) (5 =1) (7/9 =.), generate (unemploy)
recode D3001_4 (1 =1) (2 =.75) (3 =.5) (4 =.25) (5 =0) (7/9 =.), generate (defense)
recode D3001_5 (1 =0) (2 =.25) (3 =.5) (4 =.75) (5 =1) (7/9 =.), generate (pensions)
recode D3001_6 (1 =0) (2 =.25) (3 =.5) (4 =.75) (5 =1) (7/9 =.), generate (industry)
recode D3001_7 (1 =1) (2 =.75) (3 =.5) (4 =.25) (5 =0) (7/9 =.), generate (police)
recode D3001_8 (1 =0) (2 =.25) (3 =.5) (4 =.75) (5 =1) (7/9 =.), generate (welfare)
recode D3004 (1 =0) (2 =.25) (3 =.5) (4 =.75) (5 =1) (7/9 =.), generate (income)

*Generate liberalism measure as a function of the sum of all the above variables such that a score of 9 means most liberal
generate liberalism=health+education+unemploy+defense+pensions+industry+police+welfare+income

*Generate a graph of liberalism plot based on place and put a lowess line on it 
tab liberalism
bys placeclean: egen avglib=mean(liberalism)

*Encode new Polity variable
encode D1004, generate (electlab)

*Control Variables 
*D2002    GENDER
*D2003    EDUCATION
*D2012    SOCIO ECONOMIC STATUS
*D2001_Y  DATE OF BIRTH OF RESPONDENT - YEAR
*D2025    RELIGIOSITY

recode D2002 (3 7 8 9 =.), generate (gender)
recode D2003 (96/99 =.), generate (educ)
recode D2012 (7/9 =.), generate (ses)
recode D2001_Y (9997 9998 9999 =.), generate (birthyr)
recode D2025 (7/9 =.), generate (religion)

generate age=2018-birthyr

*Save clean data
save "CSES4cleanall.dta", replace
