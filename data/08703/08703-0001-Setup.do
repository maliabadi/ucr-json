/**************************************************************************
 |                    STATA SETUP FILE FOR ICPSR 08703
 |         UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]:
 |            COUNTY LEVEL ARREST AND OFFENSES DATA, 1977-1983
 |                     (DATASET 0001:  ARRESTS, 1977)
 |
 |                                                                        
 |  Please edit this file as instructed below.                            
 |  To execute, start Stata, change to the directory containing:          
 |       - this do file                                                   
 |       - the ASCII data file                                            
 |       - the dictionary file                                            
 |                                                                        
 |  Then execute the do file (e.g., do 08703-0001-statasetup.do)          
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










label data "UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY LEVEL ARREST AND OFFENSES DATA, 1977-1983 , Part 0001"

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


*/
/********************************************************************

 Section 4: Save Outfile

  This section saves out a Stata system format file.  There is no reason to
  modify it if the macros in Section 1 were specified correctly.

*********************************************************************/

save `outfile', replace

