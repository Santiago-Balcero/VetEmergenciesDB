-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-2
-- Description: creates INDEX for column CLINIC_NIT in table CLINIC

CREATE INDEX IX_CLINIC_CLINIC_NIT ON APP_GEST_E_MASCOTAS.CLINIC (CLINIC_NIT);
