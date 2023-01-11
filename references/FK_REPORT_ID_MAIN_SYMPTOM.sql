-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-2
-- Description: creates FOREIGN KEY for column ID_MAIN_SYMPTOM in table REPORT

ALTER TABLE APP_GEST_E_MASCOTAS.REPORT ADD CONSTRAINT FK_REPORT_ID_MAIN_SYMPTOM FOREIGN KEY (ID_MAIN_SYMPTOM) REFERENCES APP_GEST_E_MASCOTAS.MAIN_SYMPTOM (ID_MAIN_SYMPTOM);