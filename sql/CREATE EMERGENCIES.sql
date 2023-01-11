-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-2
-- Description: inserts mock emergencies into table EMERGENCY

DECLARE
	subscription INTEGER;
	species INTEGER;
	symptom INTEGER;
	random_date NUMBER;
	s NUMBER;
BEGIN
	FOR ix IN 1..1000 LOOP
		subscription := dbms_random.value(3881, 8268);
		SELECT count(1) INTO s FROM subscription WHERE id_subscription = subscription AND is_active = 1;
		IF(s != 0) THEN
			random_date := dbms_random.value(1, 365);
			species := dbms_random.value(1, 9);
			symptom := dbms_random.value(1, 10);
			INSERT INTO emergency VALUES(seq_emergency.nextval, subscription, 22, sysdate - random_date, 'Pending', species, symptom, 'Descripción de síntoma.', sysdate);
			COMMIT;
		END IF;
	END LOOP;
END;
