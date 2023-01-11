-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-2
-- Description: creates constraint CHECK for column IS_ACTIVE in table CLINIC

ALTER TABLE APP_GEST_E_MASCOTAS.CLINIC ADD CONSTRAINT CK_CLINIC_IS_ACTIVE CHECK (IS_ACTIVE IN (1, 0));
