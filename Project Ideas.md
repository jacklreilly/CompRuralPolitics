# **Project ideas**

Jennifer Lin

Transitions to Democracy

## *Guiding Question*

How does place based identity (rural-urban) influence policy preferences in countries based on the country’s style of government? Does place attachments influence conservative or liberal stances in the context of the country in which the individual lives?

**Research on the effects of place based identity (rural v urban - D2031), SES (D2012-D12), Farmers’ Association Membership (D2008) on a number of key variables**

The data for this project will come from CSES Module 4 survey data. I an leaning towards using STATA for data analysis but it is also likely that I may use R or SAS to conduct the analysis.

## *Code Key Independent Variables*

D29. Rural/Urban Residence.

             1. RURAL AREA OR VILLAGE
             2. SMALL OR MIDDLE-SIZED TOWN
             3. SUBURBS OF LARGE TOWN OR CITY
             4. LARGE TOWN OR CITY

             7. VOLUNTEERED: REFUSED
             8. VOLUNTEERED: DON'T KNOW

             9. MISSING

 D12. Respondent's socio economic status.

             1. WHITE COLLAR
             2. WORKER
             3. FARMER
             4. SELF-EMPLOYED

             5. [SEE ELECTION STUDY NOTES]
             6. [SEE ELECTION STUDY NOTES]

             7. VOLUNTEERED: REFUSED
             8. VOLUNTEERED: DON'T KNOW

             9. MISSING

 D08. Respondent is a member of a farmers' association.

             1. R IS A MEMBER OF A FARMERS' ASSOCIATION
             2. R IS NOT A MEMBER OF A FARMERS' ASSOCIATION

             7. VOLUNTEERED: REFUSED
             8. VOLUNTEERED: DON'T KNOW

             9. MISSING

## *Key Dependent Variables*

**Satisfaction with Democracy D3017 >>>Q15**

(UNAVAILABLE FOR ARGENTINA 2015)

 Q15. On the whole, are you very satisfied, fairly satisfied, not
              very satisfied, or not at all satisfied with the way
              democracy works in [COUNTRY]?

             1. VERY SATISFIED
             2. FAIRLY SATISFIED
             4. NOT VERY SATISFIED
             5. NOT AT ALL SATISFIED

             6. [SEE ELECTION STUDY NOTES]

             7. VOLUNTEERED: REFUSED
             8. VOLUNTEERED: DON'T KNOW

             9. MISSING


**Are you close to any political party D3018_1 >>>Q16**

(also consider D3018_2, D3018_3 and D3018_4 which addresses feelings of closeness to one party, party closest to respondent, and degree of closeness)


 Q16. Do you usually think of yourself as close to any particular
              party?

             1. YES                         -> GO TO Q16b
             5. NO

             7. VOLUNTEERED: REFUSED
             8. VOLUNTEERED: DON'T KNOW

             9. MISSING

 Q16a. Do you feel yourself a little closer to one of the
               political parties than the others?

             1. YES
             5. NO                          -> GO TO Q17

             7. VOLUNTEERED: REFUSED        -> GO TO Q17
             8. VOLUNTEERED: DON'T KNOW     -> GO TO Q17

             9. MISSING
Q16b. Which party do you feel closest to?

             01-88. [SEE CODEBOOK PART 3 FOR PARTY AND LEADER CODES]

             89.    INDEPENDENT CANDIDATE
             90.    OTHER PARTY (NOT FURTHER SPECIFIED)
             91.    NONE OF THE PARTIES/CANDIDATES

             97.    VOLUNTEERED: REFUSED     -> GO TO Q17
             98.    VOLUNTEERED: DON'T KNOW  -> GO TO Q17

             99.    MISSING
 Q16c. Do you feel very close to this party, somewhat close, or
               not very close?

             1. VERY CLOSE
             2. SOMEWHAT CLOSE
             3. NOT VERY CLOSE

             7. VOLUNTEERED: REFUSED
             8. VOLUNTEERED: DON'T KNOW

             9. MISSING

**D3005_PR_2 >>>Q05P2 - Did respondent cast a ballot in recent presidential election**

(or see most recent election if PRES is not possible - or remove the case entirely)

D3005_PR_1  >>> Q05P1a. CURRENT PRESIDENTIAL ELECTION: DID RESPONDENT CAST
                        A BALLOT - 1ST ROUND

D3005_PR_2  >>> Q05P2a. CURRENT PRESIDENTIAL ELECTION: DID RESPONDENT CAST
                        A BALLOT - 2ND ROUND

D3005_LH    >>> Q05LHa. CURRENT LOWER HOUSE ELECTION: DID RESPONDENT
                        CAST A BALLOT

         The wording of this item, which is to record voting in the
         national election, follows national standards.

         This item ascertains whether or not the respondent
         cast a ballot, regardless of whether or not it was valid.

         If the data collection occurs between rounds in a two round
         election, this item should ascertain whether or not the respondent
         intends to cast a ballot in the second round, regardless of
         whether or not it will be valid. If the data collection occurs
         after the second round in a two round election, this item should
         ascertain whether or not the respondent cast a ballot in the
         second round, regardless of whether or not it was valid.

             1. RESPONDENT CAST A BALLOT/WILL CAST A BALLOT
             5. RESPONDENT DID NOT CAST A BALLOT/WILL NOT CAST A BALLOT

             6. VOLUNTEERED: RESPONDENT NOT REGISTERED ON ELECTORAL LISTS
                [IF APPLICABLE]

             7. VOLUNTEERED: REFUSED
             8. VOLUNTEERED: DON'T KNOW

             9. MISSING


         | VARIABLE NOTES: D3005_


D3006_PR_1  >>> Q05P1b. CURRENT PRESIDENTIAL ELECTION: VOTE CHOICE -
                        1ST ROUND

D3006_PR_2  >>> Q05P2b. CURRENT PRESIDENTIAL ELECTION: VOTE CHOICE -
                        2ND ROUND

        If applicable and respondent cast a ballot in the presidential
         election:

         These variables report the respondent's vote choice for
         President in the first and/or second round of election.

         If the data collection occurs between rounds in a two round
         election, this item should report the respondent's vote choice
         intention for president in the second round.
         If the data collection occurs after the second round in a
         two round election, this item should report the respondent's
         vote choice for president in the second round.

             01-88. [SEE CODEBOOK PART 3 FOR PARTY AND LEADER NUMERIC
                    CODES]

             89.    INDEPENDENT CANDIDATE (NOT FURTHER SPECIFIED)
             90.    OTHER CANDIDATE (NOT FURTHER SPECIFIED)
             91.    NONE OF THE CANDIDATES
             92.    R CAST INVALID BALLOT
             93.    R CAST BLANK BALLOT

             97.    VOLUNTEERED: REFUSED
             98.    VOLUNTEERED: DON'T KNOW

             99.    MISSING


         | VARIABLE NOTES: D3006_PR_1 & PR_2


D3006_LH_PL >>> Q05LHb. CURRENT LOWER HOUSE ELECTION: VOTE CHOICE -
                        PARTY LIST

D3006_LH_DC >>> Q05LHc. CURRENT LOWER HOUSE ELECTION: VOTE CHOICE -
                        DISTRICT CANDIDATE

         If applicable and respondent cast a ballot in the Lower
         House legislative election:

         These variables report the respondent's vote choice for
         party list and/or district candidate in Lower House elections.
         See Election Study Notes for more information.

         For preferential STV voting systems, please provide the first two
         preferences (Q5LH-c1 and Q5LH-c2).

             01-88. [SEE CODEBOOK PART 3 FOR PARTY AND LEADER CODES]

             89.    INDEPENDENT CANDIDATE (NOT FURTHER SPECIFIED)
             90.    OTHER PARTY/CANDIDATE (NOT FURTHER SPECIFIED)
             91.    NONE OF THE PARTIES/CANDIDATES
             92.    R CAST INVALID BALLOT
             93.    R CAST BLANK BALLOT

             97.    VOLUNTEERED: REFUSED
             98.    VOLUNTEERED: DON'T KNOW

             99.    MISSING


         | VARIABLE NOTES: D3006_LH

**Respondent preferences on policy issues - D3001_1 -> D3001_8**

Issues center around public expenditure on health, education, unemployment, defense, old age pensions, business and industry, police and law enforcement, nd welfare benefits.

D3001_1     >>> Q01a. PUBLIC EXPENDITURE: HEALTH

D3001_2     >>> Q01b. PUBLIC EXPENDITURE: EDUCATION

D3001_3     >>> Q01c. PUBLIC EXPENDITURE: UNEMPLOYMENT BENEFITS

D3001_4     >>> Q01d. PUBLIC EXPENDITURE: DEFENSE

D3001_5     >>> Q01e. PUBLIC EXPENDITURE: OLD-AGE PENSIONS

D3001_6     >>> Q01f. PUBLIC EXPENDITURE: BUSINESS AND INDUSTRY

D3001_7     >>> Q01g. PUBLIC EXPENDITURE: POLICE AND LAW ENFORCEMENT

D3001_8     >>> Q01h. PUBLIC EXPENDITURE: WELFARE BENEFITS

         For the next questions, please say whether there should be more or
         less public expenditure in each of the following areas. Remember
         if you say "more" it could require a tax increase, and if you say
         "less" it could require a reduction in those services.

         Q1a. Thinking about public expenditure on HEALTH,
              should there be much more than now, somewhat more than now,
              the same as now, somewhat less than now, or much less than
              now?
         HELP: The word "health" is intended to refer to public expenditure
               related to health care, i.e., public health care programs,
               public hospitals, clinics, etc.

         Q1b. Thinking about public expenditure on EDUCATION,
              should there be much more than now, somewhat more than now,
              the same as now, somewhat less than now, or much less than
              now?
         HELP: The word "education" is intended to refer to public
               expenditure related to all forms of education, i.e., primary
               and secondary education, universities and colleges, etc.

         Q1c. Thinking about public expenditure on UNEMPLOYMENT BENEFITS,
              should there be much more than now, somewhat more than now,
              the same as now, somewhat less than now, or much less than
              now?
         HELP: The phrase "unemployment benefits" is intended to refer to
               public expenditure related to the unemployed, mainly through
               employment insurance programs, but also job training
               directed at the unemployed, and related programs.

         Q1d. Thinking about public expenditure on DEFENSE,
              should there be much more than now, somewhat more than now,
              the same as now, somewhat less than now, or much less than
              now?
         HELP: The word "defense" is intended to refer to public
               expenditure on the military, and other defense-related
               programs; it is NOT intended to refer to other international
               affairs programs, nor foreign aid.

         Q1e. Thinking about public expenditure on OLD-AGE PENSIONS,
              should there be much more than now, somewhat more than now,
              the same as now, somewhat less than now, or much less than
              now?
         HELP: The phrase "old-age pensions" is intended to refer to public
               expenditure on old age pensions, NOT other spending on
               programs directed at the elderly.

         Q1f. Thinking about public expenditure on BUSINESS AND INDUSTRY,
              should there be much more than now, somewhat more than now,
              the same as now, somewhat less than now, or much less than
              now?
         HELP: The phrase "business and industry" is intended to refer to
               public expenditure related to helping business and industry,
               Particularly through subsidies.

         Q1g. Thinking about public expenditure on POLICE AND LAW
              ENFORCEMENT, should there be much more than now, somewhat
              more than now, the same as now, somewhat less than now, or
              much less than now?
         HELP: The phrase "police and law enforcement" is intended to
               refer to public expenditure on the justice system related to
               police and law enforcement.

         Q1h. Thinking about public expenditure on WELFARE BENEFITS,
              should there be much more than now, somewhat more than now,
              the same as now, somewhat less than now, or much less than
              now?
         HELP: The phrase "welfare benefits" is intended to refer to public
               expenditure on welfare programs or social benefit programs.

             1. MUCH MORE THAN NOW
             2. SOMEWHAT MORE THAN NOW
             3. THE SAME AS NOW
             4. SOMEWHAT LESS THAN NOW
             5. MUCH LESS THAN NOW

             7. VOLUNTEERED: REFUSED
             8. VOLUNTEERED: DON'T KNOW

             9. MISSING


         | VARIABLE NOTES: D3001_
DARA UNAVAILABLE FOR ARGENTINA 2015

## *Key Macro Level Data to Consider*

**D5051_1 Time T (Democracy-Autocracy) to DD5051_3 (Democracy-Autocracy) at T-2**

D5051_1     >>> DEMOCRACY-AUTOCRACY - POLITY IV RATING - TIME T

D5051_2     >>> DEMOCRACY-AUTOCRACY - POLITY IV RATING - TIME T-1

D5051_3     >>> DEMOCRACY-AUTOCRACY - POLITY IV RATING - TIME T-2

         These variables report POLITY IV ratings of institutionalized
         democracy versus autocracy in a country, at three time periods:
         the election year (time T), one year before election (T-1), and
         two years before election (T-2).

         CSES reports the original variable POLITY - Combined Polity Score.
         The variable is constructed by subtracting the autocracy score
         from the democracy score; the resulting scale ranges from +10
         (strongly democratic) to -10 (strongly autocratic).

             10. DEMOCRATIC
             09.
             08.
             07.
             06.
             05.
             04.
             03.
             02.
             01.
             00.
            -01.
            -02.
            -03.
            -04.
            -05.
            -06.
            -07.
            -08.
            -09.
            -10. AUTOCRATIC

            -66. INTERRUPTION PERIODS
            -77. INTERREGUM PERIODS
            -88. TRANSITION PERIODS

             99. MISSING


         | VARIABLE NOTES: D5051_
         |
         | Source: POLITY IV Project: Political Regime Characteristics
         | and Transitions, 1800-2007, Monty G. Marshall and Keith Jaggers,
         | George Mason University and Colorado State University.
         | Available at: http://www.systemicpeace.org/polity/polity4.htm
         | (Date accessed: May 17, 2018).
         |
         | The Polity IV Dataset Users' Manual, available at:
         | http://www.systemicpeace.org/inscr/p4manualv2012.pdf
         | (Date accessed: November 25, 2010).
         |
         | The Polity IV annual time-series dataset, available at:
         | http://www.systemicpeace.org/inscrdata.html
         | (Date accessed: May 17, 2018).

**D5052 Age of the current regime**

D5052       >>> AGE OF THE CURRENT REGIME

         The number of years since the most recent regime change (defined
         by a three-point change in the POLITY score over a period of three
         years or less) or the end of transition period defined by the lack
         of stable political institutions (denoted by a standardized
         authority score) [Variable "Durable" from Polity IV Project
         Dataset Users' Manual].

             000-500. AGE OF THE REGIME (YEARS)

             999.     MISSING


         | VARIABLE NOTES: D5052
         |
         | Source: POLITY IV Project: Political Regime Characteristics
         | and Transitions, 1800-2007, Monty G. Marshall and Keith Jaggers,
         | George Mason University and Colorado State University.
         | Available at: http://www.systemicpeace.org/polity/polity4.htm
         | (Date accessed: May 17, 2018).
         |
         | The Polity IV Dataset Users' Manual, available at:
         | http://www.systemicpeace.org/inscr/p4manualv2012.pdf
         | (Date accessed: November 25, 2010).
         |
         | The Polity IV annual time-series dataset, available at:
         | http://www.systemicpeace.org/inscrdata.html
         | (Date accessed: May 17, 2018).

**D5054 Regime: Type of Executive**

D5054       >>> REGIME: TYPE OF EXECUTIVE

         Classification of political regimes in which democracies are
         distinguished by the type of executive (0 Dictatorship,
         1 Parliamentary Democracy, 2 Mixed Democracy, 3 Presidential
         Democracy).

         The following decision rule is applied (see Cheibub, 2007):
         A. The system is parliamentary either (i) if there is no
         independently (indirectly or directly) elected president or (ii)
         if there is an independently (indirectly or directly) elected
         president but the government is not responsible to the president.
         B. The system is mixed either if there is an independently
         (indirectly or directly) elected president and government is
         responsible to the president.
         C. The system is presidential if government is not responsible to
         the elected legislature.

         NOTE: Responsibility refers to whether the survival of the
         executive depends directly on legislature (i.e. vote of
         confidence).

             1. PARLIAMENTARY REGIME
             2. MIXED REGIME
             3. PRESIDENTIAL REGIME

             9. MISSING


         | VARIABLE NOTES: D5054
         |
         | Source: Publicly Available Sources.
         |
         | Decision rule comes from: Cheibub, Jose Antonio. 2007.
         | "Presidentialism, Parliamentarian, and Democracy". New York.
         | Cambridge University Press.

**D5056 Number of years since last presidential election**

D5056       >>> NUMBER OF MONTHS SINCE LAST PRESIDENTIAL ELECTION

         Indicates the number of months between the current and previous
         presidential election. This variable does not signify that the
         election chose either the nominal or effective head of government.

             1-200. NUMBER OF MONTHS SINCE LAST PRESIDENTIAL ELECTION

             997.   NOT APPLICABLE

             999.   MISSING


         | VARIABLE NOTES: D5056
         |
         | If previous presidential election was held in more than one
         | round (i.e. run-off election), the data refers to the number
         | of months since the first round.
         |
         | Source: Publicly Available Sources.

D5055       >>> NUMBER OF MONTHS SINCE LAST LOWER HOUSE ELECTION

         Indicates the number of months between the current election and
         the previous national lower chamber election (if current election
         renews the national lower chamber), or the most recent
         national lower chamber election (if current election does not
         renew the national lower chamber).

             1-200. NUMBER OF MONTHS SINCE LAST LOWER HOUSE ELECTION

             999.   MISSING


         | VARIABLE NOTES: D5055

## *Cases to Consider*

A sample of cases that are available fore each of the elections and in the CSES dataset

### **2015 Election**

- ARGENTINA (2015) (Not all variables are available)
- CANADA (2015)
- FINLAND (2015)
- GREAT BRITAIN (2015)
- MEXICO (2015)
- PORTUGAL (2015)

### **2012 Election**

I am leaning more towards selecting from this set of cases

- FRANCE (2012)
- GREECE (2012)
- MEXICO (2012)
- ROMANIA (2012)
- SERBIA (2012)
- SOUTH KOREA (2012)
- TAIWAN (2012)
- UNITED STATES (2012)
