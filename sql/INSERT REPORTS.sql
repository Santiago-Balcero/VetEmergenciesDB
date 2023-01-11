-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-2
-- Description: inserts reports into table REPORT for mock emergencies of past years 

DECLARE
	rep_year NUMBER;
	rep_month integer;
	execution_way varchar2(10);
	TYPE l_ids IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
	emergency_ids l_ids;
	species_ids l_ids;
	symptom_ids l_ids;
	emergencies_number NUMBER;
BEGIN
	rep_year := 2022;
	execution_way := 'Auto';
	SELECT id_species
			BULK COLLECT INTO species_ids
			FROM species;
			SELECT id_main_symptom
			BULK COLLECT INTO symptom_ids
			FROM main_symptom;
			-- For every species and every main symptom count emergencies that were confirmed during set month and year
			-- Last status update date is used because it is the moment on when an emergency was successfully confirmed
		FOR mon IN 1..11 LOOP 
			FOR i IN 1..species_ids.count
				LOOP
					FOR j IN 1..symptom_ids.count
					LOOP
						SELECT id_emergency
						BULK COLLECT INTO emergency_ids
						FROM emergency
						WHERE EXTRACT(YEAR FROM emergency_date) = rep_year 
							AND EXTRACT(MONTH FROM emergency_date) = mon
							AND emergency_status = 'Confirmed' 
							AND id_species = species_ids(i) 
							AND id_main_symptom = symptom_ids(j);
						emergencies_number := emergency_ids.count;
						-- Deletes previous manually executed emergencies counting in the same day to avoid double counting manual reports
						DELETE FROM report WHERE executed_by = 'Manual' AND id_species = species_ids(i) AND id_main_symptom = symptom_ids(j) AND ((sysdate - report_execution_date) <= 1); 
						INSERT INTO report (id_report, report_year, report_month, id_species, id_main_symptom, number_emergencies, report_execution_date, executed_by) 
							VALUES (seq_report.nextval, rep_year, mon, species_ids(i), symptom_ids(j), emergencies_number, sysdate, execution_way);
					END LOOP;
				END LOOP;
			END LOOP;
END;
