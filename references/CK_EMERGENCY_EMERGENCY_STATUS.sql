-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-2
-- Description: creates constraint CHECK for column EMERGENCY_STATUS in table EMERGENCY
-- Pending: recently created by client emergency
-- Rejected: emergency that did not pass the business confirmation process
-- Approved: emergency that is accepted by business logic and ready to be used by client
-- Confirmed: emergency that was used by a client, this status is to be used in business confirmation logic, means that client got veterinary services for an emergency

ALTER TABLE APP_GEST_E_MASCOTAS.EMERGENCY ADD CONSTRAINT CK_EMERGENCY_EMERGENCY_STATUS CHECK (EMERGENCY_STATUS IN ('Pending', 'Approved', 'Rejected', 'Confirmed'));
