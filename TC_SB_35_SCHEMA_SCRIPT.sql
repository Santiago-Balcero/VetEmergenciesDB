-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-2
-- Description: creates schema objects for TC_SB_35

PROMPT TC_SB_35_SCHEMA_SCRIPT.sql;

ALTER SESSION SET CURRENT_SCHEMA=APP_GEST_E_MASCOTAS;
/

PROMPT --------------CREATING TABLES -------------------

PROMPT CLIENT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\tables\CLIENT.sql
/

PROMPT CLINIC_SERVICE.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\tables\CLINIC_SERVICE.sql
/

PROMPT CLINIC.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\tables\CLINIC.sql
/

PROMPT DEPARTMENT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\tables\DEPARTMENT.sql
/

PROMPT EMERGENCY.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\tables\EMERGENCY.sql
/

PROMPT MAIN_SYMPTOM.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\tables\MAIN_SYMPTOM.sql
/

PROMPT REPORT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\tables\REPORT.sql
/

PROMPT SERVICE.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\tables\SERVICE.sql
/

PROMPT SPECIES.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\tables\SPECIES.sql
/

PROMPT SUBSCRIPTION.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\tables\SUBSCRIPTION.sql
/

PROMPT VETERINARIAN.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\tables\VETERINARIAN.sql
/

PROMPT --------------CREATING SEQUENCES-----------------

PROMPT SEQ_CLIENT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sequences\SEQ_CLIENT.sql
/

PROMPT SEQ_CLINIC_SERVICES.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sequences\SEQ_CLINIC_SERVICE.sql
/

PROMPT SEQ_CLINIC.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sequences\SEQ_CLINIC.sql
/

PROMPT SEQ_DEPARTMENT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sequences\SEQ_DEPARTMENT.sql
/

PROMPT SEQ_EMERGENCY.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sequences\SEQ_EMERGENCY.sql
/

PROMPT SEQ_MAIN_SYMPTOM.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sequences\SEQ_MAIN_SYMPTOM.sql
/

PROMPT SEQ_REPORT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sequences\SEQ_REPORT.sql
/

PROMPT SEQ_SERVICE.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sequences\SEQ_SERVICE.sql
/

PROMPT SEQ_SPECIES.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sequences\SEQ_SPECIES.sql
/

PROMPT SEQ_SUBSCRIPTION.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sequences\SEQ_SUBSCRIPTION.sql
/

PROMPT SEQ_VETERINARIAN.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sequences\SEQ_VETERINARIAN.sql
/

PROMPT --------------CREATING INDEXES-------------------

PROMPT IX_CLIENT_CLIENT_DOCUMENT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\IX_CLIENT_CLIENT_DOCUMENT.sql
/

PROMPT IX_CLINIC_CLINIC_NIT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\IX_CLINIC_CLINIC_NIT.sql
/

PROMPT IX_EMERGENCY_ID_CLINIC.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\IX_EMERGENCY_ID_CLINIC.sql
/

PROMPT IX_EMERGENCY_ID_SUBSCRIPTION.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\IX_EMERGENCY_ID_SUBSCRIPTION.sql
/

PROMPT IX_SUBSCRIPTION_ID_CLIENT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\IX_SUBSCRIPTION_ID_CLIENT.sql
/


PROMPT IX_VETERINARIAN_ID_CLINIC.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\IX_VETERINARIAN_ID_CLINIC.sql
/

PROMPT IX_VETERINARIAN_VET_DOCUMENT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\IX_VETERINARIAN_VET_DOCUMENT.sql
/

PROMPT PK_CLIENT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\PK_CLIENT.sql
/

PROMPT PK_CLINIC_SERVICE.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\PK_CLINIC_SERVICE.sql
/

PROMPT PK_CLINIC.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\PK_CLINIC.sql
/

PROMPT PK_DEPARTMENT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\PK_DEPARTMENT.sql
/

PROMPT PK_EMERGENCY.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\PK_EMERGENCY.sql
/

PROMPT PK_MAIN_SYMPTOM.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\PK_MAIN_SYMPTOM.sql
/

PROMPT PK_REPORT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\PK_REPORT.sql
/

PROMPT PK_SERVICE.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\PK_SERVICE.sql
/

PROMPT PK_SPECIES.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\PK_SPECIES.sql
/

PROMPT PK_SUBSCRIPTION.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\PK_SUBSCRIPTION.sql
/

PROMPT PK_VETERINARIAN.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\indexes\PK_VETERINARIAN.sql
/

PROMPT --------------CREATING REFERENCES-------------------

PROMPT CK_CLIENT_IS_ACTIVE.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\CK_CLIENT_IS_ACTIVE.sql
/

PROMPT CK_CLINIC_IS_ACTIVE.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\CK_CLINIC_IS_ACTIVE.sql
/

PROMPT CK_EMERGENCY_EMERGENCY_STATUS.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\CK_EMERGENCY_EMERGENCY_STATUS.sql
/

PROMPT CK_SUBSCRIPTION_IS_ACTIVE.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\CK_SUBSCRIPTION_IS_ACTIVE.sql
/

PROMPT CK_VETERINARIAN_IS_ACTIVE.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\CK_VETERINARIAN_IS_ACTIVE.sql
/

PROMPT FK_CLINIC_ID_DEPARTMENT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\FK_CLINIC_ID_DEPARTMENT.sql
/

PROMPT FK_CLINIC_SERVICE_MIX_ID_CLINIC.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\FK_CLINIC_SERVICE_MIX_ID_CLINIC.sql
/

PROMPT FK_CLINIC_SERVICE_MIX_ID_SERVICE.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\FK_CLINIC_SERVICE_MIX_ID_SERVICE.sql
/

PROMPT FK_EMERGENCY_ID_CLINIC.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\FK_EMERGENCY_ID_CLINIC.sql
/

PROMPT FK_EMERGENCY_ID_MAIN_SYMPTOM.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\FK_EMERGENCY_ID_MAIN_SYMPTOM.sql
/

PROMPT FK_EMERGENCY_ID_SPECIES.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\FK_EMERGENCY_ID_SPECIES.sql
/

PROMPT FK_EMERGENCY_ID_SUBSCRIPTION.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\FK_EMERGENCY_ID_SUBSCRIPTION.sql
/

PROMPT FK_REPORT_ID_MAIN_SYMPTOM.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\FK_REPORT_ID_MAIN_SYMPTOM.sql
/

PROMPT FK_REPORT_ID_SPECIES.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\FK_REPORT_ID_SPECIES.sql
/

PROMPT FK_SUBSCRIPTION_ID_CLIENT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\FK_SUBSCRIPTION_ID_CLIENT.sql
/

PROMPT FK_VETERINARIAN_ID_CLINIC.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\FK_VETERINARIAN_ID_CLINIC.sql
/

PROMPT UQ_CLIENT_CLIENT_DOCUMENT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\UQ_CLIENT_CLIENT_DOCUMENT.sql
/

PROMPT UQ_CLINIC_CLINIC_NIT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\UQ_CLINIC_CLINIC_NIT.sql
/

PROMPT UQ_SUBSCRIPTION_ID_CLIENT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\UQ_SUBSCRIPTION_ID_CLIENT.sql
/

PROMPT UQ_VETERINARIAN_VET_DOCUMENT.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\references\UQ_VETERINARIAN_VET_DOCUMENT.sql
/

PROMPT ---------------------CREATING PACKAGES-------------------------

PROMPT PKG_EMERGENCIES_REPORTS.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\packages\PKG_EMERGENCIES_REPORTS.sql
/

PROMPT PKG_EMERGENCIES_REPORTS_BODY.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\packages\PKG_EMERGENCIES_REPORTS_BODY.sql
/

PROMPT --------------INSERTING DATA INTO SOME TABLES-------------------

PROMPT INSERT_DEPARTMENTS.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sql\INSERT_DEPARTMENTS.sql
/

PROMPT INSERT_MAIN_SYMPTOMS.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sql\INSERT_MAIN_SYMPTOMS.sql
/

PROMPT INSERT_SERVICES.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sql\INSERT_SERVICES.sql
/

PROMPT INSERT_SPECIES.sql
@C:\TC_SB_35\Desarrollo\DB\tc_sb_35_database\sql\INSERT_SPECIES.sql
/

PROMPT --------------ALL OBJECTS SUCCESSFULLY CREATED------------------

PROMPT ----------------------------------------------------------------
PROMPT END OF TC_SB_35_SCHEMA_SCRIPT.sql
PROMPT ----------------------------------------------------------------