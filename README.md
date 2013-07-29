# UCR JSON


### Using the data

For those of you who want to just get in there and have fun with the data, what you need will mostly be located in the **data/parsed/normalized** directory. In that directory we have the Uniform Crime Reports for every year from 1977-2008. 
```bash
data
  parsed
    normalized
      1977.json
      1978.json
      1979.json
      1980.json
      ...
```

If, for example, you opened up **data/parsed/normalized/1996.json** you would find an array containing **3,144** entries, on for each county or county-equivalent in the US. Here's an example of one of those entries, from the 1996 report for *Baldwin County, Alabama*.


```json
  {
    "icpsr_study_number": 2389,
    "icpsr_edition_number": 1,
    "icpsr_part_number": 1,
    "icpsr_sequential_case_id_number": 2,
    "fips_state_code": "01",
    "fips_county_code": "003",
    "county_population": 117156,
    "number_of_agencies_in_county": 10,
    "multicounty_jurisdiction_flag": 0,
    "coverage_indicator": 100,
    "grand_total": 6021,
    "part_1_total": 820,
    "violent_crimes": 193,
    "property_crimes": 627,
    "murder": 6,
    "rape": 20,
    "robbery": 26,
    "aggravated_assaults": 141,
    "burglary": 65,
    "larceny": 530,
    "auto_thefts": 28,
    "arson": 4,
    "other_assaults": 636,
    "forgerycounterfeiting": 27,
    "fraud": 324,
    "embezzlement": 0,
    "have_stolen_property": 100,
    "vandalism": 74,
    "weapons_violations": 39,
    "prostitutioncomm_vice": 0,
    "sex_offenses": 19,
    "drug_abuse_violations_total": 450,
    "drug_abuse_sale_manufacture": 18,
    "opium_cocaine_sale_manufacture": 16,
    "marijuana_sale_manufacture": 2,
    "synthetic_drug_sale_manufacture": 0,
    "other_dang_non_narcotics": 0,
    "drug_possession_subtotal": 432,
    "opium_cocaine_possession": 44,
    "marijuana_possession": 366,
    "synthetic_narcotics_possession": 7,
    "drug_possession_other": 15,
    "gambling_total": 0,
    "bookmaking_horsesport": 0,
    "numbers_lottery": 0,
    "gambling_all_other": 0,
    "offenses_against_family_child": 98,
    "driving_under_influence": 1050,
    "liquor_law_violations": 382,
    "drunkenness": 361,
    "disorderly_conduct": 126,
    "vagrancy": 0,
    "all_other_offenses_except_traffic": 1492,
    "suspicion": 0,
    "curfew_loitering_laws": 0,
    "runaways": 23
  }
```


### Data Provided By

* [The National Archive of Criminal Justice Data](http://www.icpsr.umich.edu/icpsrweb/NACJD/)
* [The Inter-University Consortium for Political and Social Research](http://www.icpsr.umich.edu/icpsrweb/landing.jsp)
* [The Federal Bureau of Investigation](http://www.fbi.gov/)
* [The United States Department of Justice](http://www.justice.gov/)

### UCR as JSON

Part of the purpose of this project is to provide the UCR data into a more generally useful format. It's provided by the NACJD as flat, fixed-width ASCII text files, each one-character column of  which represents a variable that is specified in the PDF Codebook that accompanies it. The variables, and which columns they represent, changes from year to year, and one must reference each year's lengthy PDF documentation to understand exactly what that year's data means. It goes without saying that this is not a particularly analyst-, programmer-, or human--friendly way of representing this data.

For the purposes of this project, I've translated all the available data as JSON. It's important to note that the JSON-encoded data **only represents arrests** reported by state and local law enforcement agencies, and not 'crimes reported' VIA the National Incident-Based Reporting System. This is done partially out of laziness, but also because arrest-level data is categorized in the UCR reports in a tigher and more granular way.

For more information on UCR data in general, check out The FBI's [Uniform Crime Reporting Handbook](http://www2.fbi.gov/ucr/handbook/ucrhandbook04.pdf)

### Bibliography

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY LEVEL ARREST AND OFFENSES DATA, 1977-1983 [Computer file]. Washington, DC: U.S. Dept. of Justice, Federal Bureau of Investigation [producer], 1984. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [distributor], 1998.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA: COUNTY LEVEL ARREST AND OFFENSES DATA, 1984 [Computer file]. 2nd ICPSR version. Washington, DC: U.S. Dept. of Justice, Federal Bureau of Investigation [producer], 1985. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [distributor], 2004.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTS: COUNTY LEVEL DETAILED ARREST AND OFFENSE DATA, 1985 AND 1987 [Computer file]. ICPSR version. Washington, DC: U.S. Dept. of Justice, Federal Bureau of Investigation [producer], 1987. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [distributor], 2005.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTS: COUNTY LEVEL ARREST AND OFFENSE DATA, 1986 [Computer file]. 2nd ICPSR ed. Ann Arbor, MI: Inter- university Consortium for Political and Social Research [producer and distributor], 1998.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTS: COUNTY LEVEL DETAILED ARREST AND OFFENSE DATA, 1988 [Computer file]. ICPSR version. Washington, DC: U.S. Dept. of Justice, Federal Bureau of Investigation [producer], 1987. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [distributor], 1997.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 1989 [Computer file]. ICPSR version. Washington, DC: U.S. Dept. of Justice, Federal Bureau of Investigation [producer], 1989. Ann Arbor, MI: Inter- university Consortium for Political and Social Research [distributor], 1997.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 1990 [Computer file]. 2nd ICPSR ed. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 1994.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 1991 [Computer file]. ICPSR ed. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 1994.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 1992 [Computer file]. ICPSR ed. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 1994.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 1994 [Computer file]. 3rd ICPSR ed. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 2001.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 1995 [Computer file]. 2nd ICPSR ed. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 2001.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 1996 [Computer file]. 3rd ICPSR ed. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 2001.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 1997 [Computer file]. 2nd ICPSR ed. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 2001.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 1998 [Computer file]. 2nd ICPSR ed. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 2001.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 1999 [Computer file]. 3rd ICPSR ed. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 2002.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 2000 [Computer file]. 3rd ICPSR ed. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 2002.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 2001 [Computer file]. ICPSR ed. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 2003.*

> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 2002 [Computer file]. ICPSR ed. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 2004.*
  
> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 2003 [Computer file]. ICPSR04360-v1. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 2005-11-11.*
  
> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 2004 [Computer file]. ICPSR04466-v1. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 2006-06-19.*
  
> * *U.S. Dept. of Justice, Federal Bureau of Investigation. UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]: COUNTY-LEVEL DETAILED ARREST AND OFFENSE DATA, 2005 [Computer file]. 2007. ICPSR04717-v1. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [producer and distributor], 2007-07.*
  
> * *United States Department of Justice. Federal Bureau of Investigation. Uniform Crime Reporting Program Data [United States]: County-Level Detailed Arrest and Offense Data, 2006 [Computer file]. ICPSR23780-v1. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [distributor], 2008-11-18. doi:10.3886/ICPSR23780*
  
> * *United States Department of Justice. Federal Bureau of Investigation. Uniform Crime Reporting Program Data [United States]: County-Level Detailed Arrest and Offense Data, 2007. ICPSR25114-v1. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [distributor], 2009-07-31. doi:10.3886/ICPSR25114.v1*
  
> * *United States Department of Justice. Federal Bureau of Investigation. Uniform Crime Reporting Program Data [United States]: County-Level Detailed Arrest and Offense Data, 2008. ICPSR27644-v1. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [distributor], 2011-04-21. doi:10.3886/ICPSR27644.v1*



**The original collector of the data, ICPSR, and the relevant funding agency bear no responsibility for uses of this collection or for interpretations or inferences based upon such uses.**
