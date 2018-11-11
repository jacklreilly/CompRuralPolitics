*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Liberalism scal and Analysis

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CSES Data stages/CSES4cleanall.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"

*Recode Liberalism Variables
*D3001 
*D3001_1     >>> Q01a. PUBLIC EXPENDITURE: HEALTH
*D3001_2     >>> Q01b. PUBLIC EXPENDITURE: EDUCATION
*D3001_3     >>> Q01c. PUBLIC EXPENDITURE: UNEMPLOYMENT BENEFITS
*D3001_4     >>> Q01d. PUBLIC EXPENDITURE: DEFENSE
*D3001_5     >>> Q01e. PUBLIC EXPENDITURE: OLD-AGE PENSIONS
*D3001_6     >>> Q01f. PUBLIC EXPENDITURE: BUSINESS AND INDUSTRY
*D3001_7     >>> Q01g. PUBLIC EXPENDITURE: POLICE AND LAW ENFORCEMENT
*D3001_8     >>> Q01h. PUBLIC EXPENDITURE: WELFARE BENEFITS

*Coded as (Recode)
  *1. MUCH MORE THAN NOW (Liberal = 1)
  *2. SOMEWHAT MORE THAN NOW (.75)
  *3. THE SAME AS NOW (.5)
  *4. SOMEWHAT LESS THAN NOW (.25)
  *5. MUCH LESS THAN NOW (Conservative = 0)

  *7. VOLUNTEERED: REFUSED (.)
  *8. VOLUNTEERED: DON'T KNOW (.)
  *9. MISSING (.)

*D3004   Q04. Please say to what extent you agree or disagree with the following statement: "The government should take measures to reduce differences in income levels."

*Do you strongly agree, somewhat agree, neither agree nordisagree, somewhat disagree, or strongly disagree?

*1. STRONGLY AGREE (1 = liberal)
*2. SOMEWHAT AGREE (.75)
*3. NEITHER AGREE NOR DISAGREE (.5)
*4. SOMEWHAT DISAGREE (.25)
*5. STRONGLY DISAGREE (0 = Conservaitve)
*7. VOLUNTEERED: REFUSED (.)
*8. VOLUNTEERED: DON'T KNOW (.)
*9. MISSING (.)

  
*recode variables
*Defense and police are reverse coded
recode D3001_1 (1 =1) (2 =.75) (3 =.5) (4 =.25) (5 =0) (7/9 =.), generate (health)
recode D3001_2 (1 =1) (2 =.75) (3 =.5) (4 =.25) (5 =0) (7/9 =.), generate (education)
recode D3001_3 (1 =1) (2 =.75) (3 =.5) (4 =.25) (5 =0) (7/9 =.), generate (unemploy)
recode D3001_4 (1 =0) (2 =.25) (3 =.5) (4 =.75) (5 =1) (7/9 =.), generate (defense)
recode D3001_5 (1 =1) (2 =.75) (3 =.5) (4 =.25) (5 =0) (7/9 =.), generate (pensions)
recode D3001_6 (1 =1) (2 =.75) (3 =.5) (4 =.25) (5 =0) (7/9 =.), generate (industry)
recode D3001_7 (1 =0) (2 =.25) (3 =.5) (4 =.75) (5 =1) (7/9 =.), generate (police)
recode D3001_8 (1 =1) (2 =.75) (3 =.5) (4 =.25) (5 =0) (7/9 =.), generate (welfare)
recode D3004 (1 =1) (2 =.75) (3 =.5) (4 =.25) (5 =0) (7/9 =.), generate (income)

*Generate liberalism measure as a function of the sum of all the above variables such that a score of 9 means most liberal
generate liberalism=health+education+unemploy+defense+pensions+industry+police+welfare+income

*Generate a graph of liberalism plot based on place and put a lowess line on it 
tab liberalism
bys placeclean: egen avglib=mean(liberalism)

*Encode new Polity variable
encode D1004, generate (electlab)
bys electlab placeclean: egen placelib=mean(liberalism)

*Regression of place on liberalism 
regress liberalism i.placeclean
rvfplot

*Regression sorted by polity
bys electlab: regress liberalism i.placeclean
rvfplot

*Controlling for all other regime variables
reg liberalism i.placeclean regageclean democlean formulaclean

