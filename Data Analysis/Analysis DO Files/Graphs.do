*Place of Residence and Political Attitudes in Democracies Worldwide
*Author: Jennifer Lin
*Data: CSES Module 4 <http://www.cses.org/datacenter/module4/module4.htm>
*Analyzed with Stata 15.1 using MacOSX 10.13.6
*Graphs

*Read in Cleaned data generated from the Management DO File
use "/Users/pebl/Desktop/Working/CSES Data stages/CSES4cleanall.dta", clear

cd "/Users/pebl/Desktop/Working/CompRuralPolitics/Data Analysis"


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

