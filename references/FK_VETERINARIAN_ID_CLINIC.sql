-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-1
-- Description: creates FOREIGN KEY with ON DELETE CASCADE for column ID_CLINIC in table VETERINARIAN

ALTER TABLE APP_GEST_E_MASCOTAS.VETERINARIAN ADD CONSTRAINT FK_VETERINARIAN_ID_CLINIC FOREIGN KEY (ID_CLINIC) REFERENCES APP_GEST_E_MASCOTAS.CLINIC (ID_CLINIC) ON DELETE CASCADE;
