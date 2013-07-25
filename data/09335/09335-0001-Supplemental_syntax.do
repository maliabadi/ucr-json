/*-------------------------------------------------------------------------*
 |                                                                         
 |              STATA COMPANION PROGRAM FILE FOR ICPSR 09335
 |        UNIFORM CRIME REPORTS: COUNTY LEVEL DETAILED ARREST AND
 |                           OFFENSE DATA, 1988
 |                (DATASET 0001:  ARRESTS, ALL AGES, 1988)
 |
 |
 | This Stata missing value recode program is provided for optional use with
 | the Stata system version of this data file as distributed by ICPSR.
 | The program replaces user-defined numeric missing values (e.g., -9)
 | with generic system missing "."  Note that Stata allows you to specify
 | up to 27 unique missing value codes.  Only variables with user-defined
 | missing values are included in this program.
 |
 | To apply the missing value recodes, users need to first open the
 | Stata data file on their system, apply the missing value recodes if
 | desired, then save a new copy of the data file with the missing values
 | applied.  Users are strongly advised to use a different filename when
 | saving the new file.
 |
 *------------------------------------------------------------------------*/

replace V7 = . if (V7 == 9999999)
replace V8 = . if (V8 == 999999)
replace V9 = . if (V9 == 999999)
replace V10 = . if (V10 == 99999)
replace V11 = . if (V11 == 99999)
replace V12 = . if (V12 == 9999)
replace V13 = . if (V13 == 9999)
replace V14 = . if (V14 == 99999)
replace V15 = . if (V15 == 99999)
replace V16 = . if (V16 == 99999)
replace V17 = . if (V17 == 99999)
replace V18 = . if (V18 == 99999)
replace V19 = . if (V19 == 999)
replace V20 = . if (V20 == 99999)
replace V21 = . if (V21 == 9999)
replace V22 = . if (V22 == 9999)
replace V23 = . if (V23 == 999)
replace V24 = . if (V24 == 9999)
replace V25 = . if (V25 == 99999)
replace V26 = . if (V26 == 99999)
replace V27 = . if (V27 == 99999)
replace V28 = . if (V28 == 9999)
replace V29 = . if (V29 == 99999)
replace V30 = . if (V30 == 99999)
replace V31 = . if (V31 == 99999)
replace V32 = . if (V32 == 9999)
replace V33 = . if (V33 == 999)
replace V34 = . if (V34 == 99999)
replace V35 = . if (V35 == 99999)
replace V36 = . if (V36 == 99999)
replace V37 = . if (V37 == 99999)
replace V38 = . if (V38 == 999)
replace V39 = . if (V39 == 9999)
replace V40 = . if (V40 == 9999)
replace V41 = . if (V41 == 999)
replace V42 = . if (V42 == 999)
replace V43 = . if (V43 == 9999)
replace V44 = . if (V44 == 9999)
replace V45 = . if (V45 == 999999)
replace V46 = . if (V46 == 99999)
replace V47 = . if (V47 == 99999)
replace V48 = . if (V48 == 99999)
replace V49 = . if (V49 == 99999)
replace V50 = . if (V50 == 99999)
replace V51 = . if (V51 == 9999)
replace V52 = . if (V52 == 99999)
replace V53 = . if (V53 == 9999)


