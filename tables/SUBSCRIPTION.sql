-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-2
-- Description: creates table SUBSCRIPTION for clients that pay for emergency services

CREATE TABLE APP_GEST_E_MASCOTAS.SUBSCRIPTION (
    ID_SUBSCRIPTION NUMBER NOT NULL,
    ID_CLIENT NUMBER NOT NULL,
    START_DATE DATE NOT NULL,
    FINISH_DATE DATE NOT NULL,
    IS_ACTIVE NUMBER NOT NULL,
    LAST_UPDATE_DATE DATE NOT NULL,
    LAST_UPDATE_ACTION VARCHAR2(20) NOT NULL
);

COMMENT ON TABLE APP_GEST_E_MASCOTAS.SUBSCRIPTION IS 'LIST OF SUBSCRIPTIONS TO GET ACCESS TO EMERGENCY SERVICES';