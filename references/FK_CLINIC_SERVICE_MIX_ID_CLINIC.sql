-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-1
-- Description: creates FOREIGN KEY for column MIX_ID_CLINIC in join table CLINIC_SERVICE

ALTER TABLE APP_GEST_E_MASCOTAS.CLINIC_SERVICE ADD CONSTRAINT FK_CLINIC_SERVICE_MIX_ID_CLINIC FOREIGN KEY (MIX_ID_CLINIC) REFERENCES APP_GEST_E_MASCOTAS.CLINIC (ID_CLINIC);
