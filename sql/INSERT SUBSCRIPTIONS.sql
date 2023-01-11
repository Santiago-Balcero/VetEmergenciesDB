-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-2
-- Description: inserts subscriptions into table SUBSCRIPTION
-- indx corresponds to known id_client from table CLIENT

DECLARE
	random_num NUMBER;
BEGIN
	FOR indx IN 11001..14000 LOOP
		random_num := dbms_random.value(1, 365);
		INSERT INTO subscription VALUES (seq_subscription.nextval, indx, sysdate - random_num, sysdate - random_num + 365, 1, sysdate, 'Activate');
	END LOOP;
END;