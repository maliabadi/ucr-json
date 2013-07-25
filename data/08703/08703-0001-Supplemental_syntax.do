/*-------------------------------------------------------------------------*
 |                                                                         
 |              STATA COMPANION PROGRAM FILE FOR ICPSR 08703
 |         UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]:
 |            COUNTY LEVEL ARREST AND OFFENSES DATA, 1977-1983
 |                     (DATASET 0001:  ARRESTS, 1977)
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
replace V8 = . if (V8 == 9999999)
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
replace V19 = . if (V19 == 9999)


