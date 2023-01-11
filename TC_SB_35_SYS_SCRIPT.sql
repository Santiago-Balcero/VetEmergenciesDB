-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-2
-- Description: creates schema and grants privileges for TC_SB_35

PROMPT TC_SB_35_SYS_SCRIPT.sql;

ALTER SESSION SET CURRENT_SCHEMA=SYSTEM;
/

PROMPT --------------CREATING TABLE SPACE--------------
PROMPT TABLE_SPACE.sql
@C:\TC_SB_35\Desarrollo\DB\sys\TABLE_SPACE.sql
/

PROMPT --------------CREATING SCHEMA-------------------
PROMPT SCHEMA.sql
@C:\TC_SB_35\Desarrollo\DB\sys\SCHEMA.sql
/

PROMPT --------------GRANTING PRIVILEGES---------------
PROMPT GRANT_RESOURCE_CONNECT_TO_SCHEMA.sql
@C:\TC_SB_35\Desarrollo\DB\sys\GRANT_RESOURCE_CONNECT_TO_SCHEMA.sql
/

PROMPT -----------SCHEMA SUCCESSFULLY CREATED----------


PROMPT ------------------------------------------------
PROMPT END OF TC_SB_35_SYS_SCRIPT.sql
PROMPT ------------------------------------------------