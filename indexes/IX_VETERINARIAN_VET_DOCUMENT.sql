-- TC_SB_35
-- By: Santiago Balcero
-- Date: 2022-12-2
-- Description: creates INDEX for column VET_DOCUMENT in table VETERINARIAN

CREATE INDEX IX_VETERINARIAN_VET_DOCUMENT ON APP_GEST_E_MASCOTAS.VETERINARIAN (VET_DOCUMENT);
