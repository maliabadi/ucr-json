/**************************************************************************
 |                    STATA SETUP FILE FOR ICPSR 09335
 |        UNIFORM CRIME REPORTS: COUNTY LEVEL DETAILED ARREST AND
 |                           OFFENSE DATA, 1988
 |                (DATASET 0001:  ARRESTS, ALL AGES, 1988)
 |
 |                                                                        
 |  Please edit this file as instructed below.                            
 |  To execute, start Stata, change to the directory containing:          
 |       - this do file                                                   
 |       - the ASCII data file                                            
 |       - the dictionary file                                            
 |                                                                        
 |  Then execute the do file (e.g., do 09335-0001-statasetup.do)          
 |                                                                        
 **************************************************************************/

set mem 1m  /* Allocating 1 megabyte(s) of RAM for Stata SE to read the
                 data file into memory. */

set more off  /* This prevents the Stata output viewer from pausing the
                 process*/

/****************************************************

Section 1: File Specifications
   This section assigns local macros to the necessary files.
   Please edit:
        "raw-datafile-name" ==> The name of data file downloaded from ICPSR
        "dictionary-filename" ==> The name of the dictionary file downloaded.
        "stata-datafile" ==> The name you wish to call your Stata data file.
        "my data" ==> The label you wish to assign to your data file (optional).

   Note:  We assume that the raw data, dictionary, and DDS (this do file) all
          reside in the same directory (or folder).  If that is not the case
          you will need to include paths as well as filenames in the macros.

********************************************************/

local raw_data "raw-datafile-name"
local dict "dictionary-filename"
local outfile "stata-datafile"
label data "My Data"

/********************************************************

Section 2: Infile Command

This section reads the raw data into Stata format.  If Section 1 was defined
properly, there should be no reason to modify this section.  These macros
should inflate automatically.

**********************************************************/

infile using `dict', using (`raw_data') clear










label data "UNIFORM CRIME REPORTS: COUNTY LEVEL DETAILED ARREST AND OFFENSE DATA, 1988 , Part 0001"

#delimit ;


#delimit cr


/***************************************************************************

 Section 3: Missing Values

 This section will replace numeric missing values (i.e., -9) with generic
 system missing ".".  By default the code in this section is commented out.
 Users wishing to apply the generic missing values should remove the comment
 at the beginning and end of this section.  Note that Stata allows you to
 specify up to 27 unique missing value codes.

****************************************************************/

/*
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


*/
/********************************************************************

 Section 4: Save Outfile

  This section saves out a Stata system format file.  There is no reason to
  modify it if the macros in Section 1 were specified correctly.

*********************************************************************/

save `outfile', replace

