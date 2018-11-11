*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Graphs

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CSES Data stages/CSES4cleanall.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"

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

*Graph with distribution of level of democracy by regime age

twoway (scatter regageclean democlean, msymbol(circle_hollow) mlabel(electlab) mlabposition(9)), ytitle(Regime Age) ylabel(0(25)200) xtitle(Level of Democracy) xlabel(0(1)12) title(Level of Democracy and Regime Age)

*Voter turnout by percentage of registered voters (COUNTRY VARIABLE - find individual variable)
recode D5006_1 (999 =.), generate (registered)

*generate dummy variables for place
recode placeclean (1 =1) (2/4 =0), generate (rural)
recode placeclean (2 =1) (1 3 4 =0), generate (smalltown)
recode placeclean (3 =1) (1 2 4 =0), generate (suburban)
recode placeclean (4 =1) (1 2 3 =0), generate (urban)

*graph by place - have each election be sorted by place to reflect how place of residence contributes to turnout
*generate placed=rural+suburban+smalltown+urban
*graph hbar (asis) rural smalltown suburban urban, over(polity, sort(electlab) descending) stack

graph hbar registered, over(electlab, gap(100))

graph hbar (count), over(placeclean) over(electlab)

*Lower house Election Turnout
recode D3005_LH (1 =1) (5 =0) (6/9 =.), generate (vote)

graph bar (count) vote, over(placeclean) over(electlab) stack

*election turnout
graph hbar (count) vote, over(placeclean, sort(1)) over(electlab) title("Election Turnout", span) ysize(20)

*Distribution of Residence
graph hbar (count), over(placeclean, sort(1)) over(electlab) title("Distribution of Residence", span) ysize(20)

*Distribution of liberalism
graph hbox liberalism, over(placeclean, sort(1)) over(electlab) title("Average Liberalism", span) ysize(20)
graph hbox liberalism, over(placeclean, sort(1)) title("Liberalism Across Place of Residence")

*Distribution of Liberalism interests by place
graph hbar (mean) health, over(placeclean, sort(1)) title("Attitudes Towards Healthcare Spending", span) ysize(10)
graph hbar (mean) police, over(placeclean, sort(1)) title("Attitudes Towards Law Enforcement Spending", span) ysize(10)
graph hbar (mean) income, over(placeclean, sort(1)) title("Attitudes Towards Combatting Income Inequality", span) ysize(10)

