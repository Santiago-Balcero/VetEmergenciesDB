-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-2
-- Description: creates FOREIGN KEY for column ID_SUBSCRIPTION in table EMERGENCY

ALTER TABLE APP_GEST_E_MASCOTAS.EMERGENCY ADD CONSTRAINT FK_EMERGENCY_ID_SUBSCRIPTION FOREIGN KEY (ID_SUBSCRIPTION) REFERENCES APP_GEST_E_MASCOTAS.SUBSCRIPTION (ID_SUBSCRIPTION);
