-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-15
-- Description: creates package declaration for counting number of monthly emergencies 
-- by species and main symptom, stores that number as a record in REPORT table

CREATE OR REPLACE PACKAGE PKG_EMERGENCIES_REPORTS IS

	-- Manually or automatically executed, when manually function call must receive a number as argument
	PROCEDURE PR_COUNT_MONTHLY_EMERGENCIES(manually IN NUMBER DEFAULT NULL);

	-- Manually executed for current date
	PROCEDURE PR_GET_REPORTS(rep_year IN NUMBER, rep_month IN NUMBER, rep_species IN NUMBER, rep_symptom IN NUMBER, reports OUT SYS_REFCURSOR);
		
END PKG_EMERGENCIES_REPORTS;