-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-15
-- Description: creates package declaration for counting number of monthly emergencies 
-- by species and main symptom, stores that number as a record in REPORT table

CREATE OR REPLACE PACKAGE BODY APP_GEST_E_MASCOTAS.PKG_EMERGENCIES_REPORTS IS

	-- Manually or automatically executed, when manually function call must receive a number as argument
	PROCEDURE PR_COUNT_MONTHLY_EMERGENCIES(manually IN NUMBER DEFAULT NULL) IS
		--This procedure counts number of emergencies that were confirmed monthly for every species and symptom
		-- Type declaration to store ids
		TYPE l_ids IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
		-- Variable declarations with previous type
		emergency_ids l_ids;
		species_ids l_ids;
		symptom_ids l_ids;
		emergencies_number NUMBER;
		rep_year NUMBER;
		rep_month NUMBER;
		-- Variable to store how the procedure wass executed (manually or automatically)
		execution_way VARCHAR2(6);
		no_ids_exception EXCEPTION;
		BEGIN
			rep_year := EXTRACT(YEAR FROM sysdate);
			rep_month := EXTRACT(MONTH FROM sysdate);
			execution_way := 'Manual';
			-- Case procedure was called automatically
			IF(manually IS NULL) THEN
				execution_way := 'Auto';
				-- Because auto execution is made first day of each month, 
				-- if it is january then set month to december and year to previous year
				IF(rep_month = 1) THEN
					rep_month := 12;
					rep_year := rep_year - 1;
				-- if it is any other month only set month to previous month
				ELSE
					rep_month := rep_month - 1;
				END IF;
			END IF;
			SELECT id_species
			BULK COLLECT INTO species_ids
			FROM species;
			IF(species_ids.count = 0) THEN
				RAISE no_ids_exception;
			END IF;
			SELECT id_main_symptom
			BULK COLLECT INTO symptom_ids
			FROM main_symptom;
			IF(symptom_ids.count = 0) THEN
				RAISE no_ids_exception;
			END IF;
			-- For every species and every symptom count emergencies that were confirmed during given month and year
			-- Last status update date is used because it is the moment on when an emergency was successfully confirmed (client received veterinary services)
			FOR i IN 1..species_ids.count
			LOOP
				FOR j IN 1..symptom_ids.count
				LOOP
					SELECT id_emergency
					BULK COLLECT INTO emergency_ids
					FROM emergency
					WHERE EXTRACT(YEAR FROM last_status_update_date) = rep_year 
						AND EXTRACT(MONTH FROM last_status_update_date) = rep_month
						AND emergency_status = 'Confirmed' 
						AND id_species = species_ids(i) 
						AND id_main_symptom = symptom_ids(j);
					emergencies_number := emergency_ids.count;
					-- Deletes previous manually executed emergencies counting in the same month to avoid double counting manual reports when accessing data from table Report
					DELETE FROM report WHERE executed_by = 'Manual' AND id_species = species_ids(i) AND id_main_symptom = symptom_ids(j); 
					INSERT INTO report (id_report, report_year, report_month, id_species, id_main_symptom, number_emergencies, report_execution_date, executed_by, finish_status) 
						VALUES (seq_report.nextval, rep_year, rep_month, species_ids(i), symptom_ids(j), emergencies_number, sysdate, execution_way, 'Completed');
				END LOOP;
			END LOOP;
		EXCEPTION
			WHEN no_data_found THEN
				INSERT INTO report (id_report, report_year, report_month, id_species, id_main_symptom, number_emergencies, report_execution_date, executed_by, finish_status) 
					VALUES (seq_report.nextval, rep_year, rep_month, 0, 0, 0, sysdate, execution_way, 'Error: no_data_found exception');
			WHEN no_ids_exception THEN
				INSERT INTO report (id_report, report_year, report_month, id_species, id_main_symptom, number_emergencies, report_execution_date, executed_by, finish_status) 
					VALUES (seq_report.nextval, rep_year, rep_month, 0, 0, 0, sysdate, execution_way, 'Error: no_ids_exception exception');
			WHEN OTHERS THEN
				INSERT INTO report (id_report, report_year, report_month, id_species, id_main_symptom, number_emergencies, report_execution_date, executed_by, finish_status) 
					VALUES (seq_report.nextval, rep_year, rep_month, 0, 0, 0, sysdate, execution_way, 'Error: others exception');
		END PR_COUNT_MONTHLY_EMERGENCIES;

	--Manually executed, returns sys_refcursor with result of query
	PROCEDURE PR_GET_REPORTS(rep_year IN NUMBER, rep_month IN NUMBER, rep_species IN NUMBER, rep_symptom IN NUMBER, reports OUT SYS_REFCURSOR) IS 
		-- This procedure gets rows from table Report according to given arguments
		BEGIN
			-- Calls a manual execution of PR_COUNT_MONTHLY_EMERGENCIES if request includes actual month and date
			-- If month is all months OR actual month AND year is actual year or five years ago
			IF((rep_month = 0 OR rep_month = EXTRACT(MONTH FROM sysdate)) AND (rep_year = EXTRACT(YEAR FROM sysdate) OR rep_year = 0)) THEN
				PR_COUNT_MONTHLY_EMERGENCIES(1);
			END IF;

			-- 1. Case report is for 5 five years, whole years, all species and all symptoms
			IF(rep_year = 0 AND rep_month = 0 AND rep_species = 0 AND rep_symptom = 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year BETWEEN EXTRACT(YEAR FROM sysdate) - 5 AND EXTRACT(YEAR FROM sysdate) AND finish_status = 'Completed';
			
			-- 2. Case report is for 5 years, whole years, all species and one symptom
			ELSIF(rep_year = 0 AND rep_month = 0 AND rep_species = 0 AND rep_symptom != 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year BETWEEN EXTRACT(YEAR FROM sysdate) - 5 AND EXTRACT(YEAR FROM sysdate) AND r.id_main_symptom = rep_symptom AND finish_status = 'Completed';
			
			-- 3. Case report is for 5 years, whole years, one species, all symptoms
			ELSIF(rep_year = 0 AND rep_month = 0 AND rep_species != 0 AND rep_symptom = 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year BETWEEN EXTRACT(YEAR FROM sysdate) - 5 AND EXTRACT(YEAR FROM sysdate) AND r.id_species = rep_species AND finish_status = 'Completed';

			-- 4. Case report is for 5 years, one month, all species, all symptoms
			ELSIF(rep_year = 0 AND rep_month != 0 AND rep_species = 0 AND rep_symptom = 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year BETWEEN EXTRACT(YEAR FROM sysdate) - 5 AND EXTRACT(YEAR FROM sysdate) AND r.report_month = rep_month AND finish_status = 'Completed';

			-- 5. Case report is for 1 year, whole years, all species, all symptoms
			ELSIF(rep_year != 0 AND rep_month = 0 AND rep_species = 0 AND rep_symptom = 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year = rep_year AND finish_status = 'Completed';
			
			-- 6. Case report is for 5 years, whole years, one species, one symptom
			ELSIF(rep_year = 0 AND rep_month = 0 AND rep_species != 0 AND rep_symptom != 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year BETWEEN EXTRACT(YEAR FROM sysdate) - 5 AND EXTRACT(YEAR FROM sysdate) AND r.id_species = rep_species AND r.id_main_symptom = rep_symptom AND finish_status = 'Completed';

			-- 7. Case report is for 5 years, one month, all species, one symptom
			ELSIF(rep_year = 0 AND rep_month != 0 AND rep_species = 0 AND rep_symptom != 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year BETWEEN EXTRACT(YEAR FROM sysdate) - 5 AND EXTRACT(YEAR FROM sysdate) AND r.report_month = rep_month AND r.id_main_symptom = rep_symptom AND finish_status = 'Completed';

			-- 8. Case report is for one year, whole year, all species, one symptom
			ELSIF(rep_year != 0 AND rep_month = 0 AND rep_species = 0 AND rep_symptom != 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year = rep_year AND r.id_main_symptom = rep_symptom AND finish_status = 'Completed';

			-- 9. Case report is for 5 years, one month, one species, all symptoms
			ELSIF(rep_year = 0 AND rep_month != 0 AND rep_species != 0 AND rep_symptom = 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year BETWEEN EXTRACT(YEAR FROM sysdate) - 5 AND EXTRACT(YEAR FROM sysdate) AND r.report_month = rep_month AND r.id_species = rep_species AND finish_status = 'Completed';

			-- 10. Case report is for one year, whole year, one species, all symptoms
			ELSIF(rep_year != 0 AND rep_month = 0 AND rep_species != 0 AND rep_symptom = 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year = rep_year AND r.id_species = rep_species AND finish_status = 'Completed';
			
			-- 11. Case report is for one year, one month, all species, all symptoms
			ELSIF(rep_year != 0 AND rep_month != 0 AND rep_species = 0 AND rep_symptom = 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year = rep_year AND r.report_month = rep_month AND finish_status = 'Completed';

			-- 12. Case report is for 5 years, one month, one species, one symptom
			ELSIF(rep_year = 0 AND rep_month != 0 AND rep_species != 0 AND rep_symptom != 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year BETWEEN EXTRACT(YEAR FROM sysdate) - 5 AND EXTRACT(YEAR FROM sysdate) AND r.report_month = rep_month AND r.id_species = rep_species AND r.id_main_symptom = rep_symptom AND finish_status = 'Completed';

			-- 13. Case report is for one year, whole year, one species, one symptom
			ELSIF(rep_year != 0 AND rep_month = 0 AND rep_species != 0 AND rep_symptom != 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year = rep_year AND r.id_species = rep_species AND r.id_main_symptom = rep_symptom AND finish_status = 'Completed';

			-- 14. Case report is for one year, one month, all species, one symptom
			ELSIF(rep_year != 0 AND rep_month != 0 AND rep_species = 0 AND rep_symptom != 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year = rep_year AND r.report_month = rep_month AND r.id_main_symptom = rep_symptom AND finish_status = 'Completed';

			-- 15. Case report is for one year, one month, one species, all symptoms
			ELSIF(rep_year != 0 AND rep_month != 0 AND rep_species != 0 AND rep_symptom = 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year = rep_year AND r.report_month = rep_month AND r.id_species = rep_species AND finish_status = 'Completed';

			-- 16. Case report is for one year, one month, one species, one symptom
			ELSIF(rep_year != 0 AND rep_month != 0 AND rep_species != 0 AND rep_symptom != 0) THEN
				OPEN reports FOR
				SELECT r.id_report, r.report_year, r.report_month, sp.species, sy.main_symptom, r.number_emergencies, r.report_execution_date 
				FROM report r
				INNER JOIN species sp ON r.id_species = sp.id_species
				INNER JOIN main_symptom sy ON r.id_main_symptom = sy.id_main_symptom
				WHERE r.report_year = rep_year AND r.report_month = rep_month AND r.id_species = rep_species AND r.id_main_symptom = rep_symptom AND finish_status = 'Completed';

			END IF;
			
		EXCEPTION
			WHEN OTHERS THEN
				-- For future versions of this project could have a table for keeping record of report requests (including status) and user csv downloads
				DBMS_OUTPUT.PUT_LINE('Error getting records from table Report for ' || sysdate);
		END PR_GET_REPORTS;

END PKG_EMERGENCIES_REPORTS;