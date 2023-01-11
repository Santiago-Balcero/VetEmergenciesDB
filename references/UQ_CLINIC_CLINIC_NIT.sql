-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-1
-- Description: creates constraint UNIQUE for column CLINIC_NIT in table CLINIC

ALTER TABLE APP_GEST_E_MASCOTAS.CLINIC ADD CONSTRAINT UQ_CLINIC_NIT UNIQUE (CLINIC_NIT);
