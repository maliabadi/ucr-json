/**************************************************************************
 |                    STATA SETUP FILE FOR ICPSR 06036
 |         UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]:
 |          COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 1991
 |                   (DATASET 0001:  ARRESTS, ALL AGES)
 |
 |                                                                        
 |  Please edit this file as instructed below.                            
 |  To execute, start Stata, change to the directory containing:          
 |       - this do file                                                   
 |       - the ASCII data file                                            
 |       - the dictionary file                                            
 |                                                                        
 |  Then execute the do file (e.g., do 06036-0001-statasetup.do)          
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

/*********************************************************

Section 3: Value Label Definitions
This section defines labels for the individual values of each variable.
We suggest that users do not modify this section.

**********************************************************/


label data "UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 1991 , Part 0001"

#delimit ;
label define V1        6036 "ICPSR Study No" ;
label define V2        1 "1st ed, Aug 1994" ;
label define V3        1 "Arrests, All Ages" 2 "Arrests, Adults"
                       3 "Arrests, Juveniles" ;
label define V9        0 "One cnty" 1 "Multiple counties" ;


#delimit cr

/********************************************************************

 Section 4: Save Outfile

  This section saves out a Stata system format file.  There is no reason to
  modify it if the macros in Section 1 were specified correctly.

*********************************************************************/

save `outfile', replace

