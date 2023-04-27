-- TRIGGER VIAGGIO

CREATE OR REPLACE TRIGGER TR_Viaggio
BEFORE INSERT ON Viaggio
FOR EACH ROW

DECLARE
data_em DATE;
ERR_DATE EXCEPTION; -- data inizio > data fine viaggio
DEST_UGUALI EXCEPTION; -- La destinazione di partenza non può essere uguale a quella di arrivo
PARTENZA_DIVERSA_EMISSIONE_DDT EXCEPTION; -- La data di emissione del DDT deve coincidere con la data di inizio viaggio.


BEGIN
    -- ERRORE DATE INIZIO E FINE VIAGGIO
IF :NEW.Data_inizio > :NEW.Data_fine THEN
RAISE ERR_DATE;
END IF;

    -- DESTINAZIONE PARTENZA UGUALE DESTINAZIONE ARRIVO
IF :NEW.SM_partenza = :NEW.SM_arrivo 
    AND :NEW.PIVA_partenza = :NEW.PIVA_arrivo 
    AND :NEW.Sede_partenza = :NEW.Sede_arrivo THEN
RAISE DEST_UGUALI;
END IF;

    -- DATA PARTENZA DIVERSA DA EMISSIONE DDT
SELECT  Data_emissione INTO data_em
FROM    DDT
WHERE   ID_DDT = :NEW.ID_DDT;

IF :NEW.Data_inizio != data_em THEN
RAISE PARTENZA_DIVERSA_EMISSIONE_DDT;
END IF;

EXCEPTION
WHEN ERR_DATE THEN
RAISE_APPLICATION_ERROR(-20001,'La data di inizio non può essere maggiore di quella di fine');

WHEN DEST_UGUALI THEN
RAISE_APPLICATION_ERROR(-20002,'La destinazione di partenza non può essere uguale a quella di arrivo');

WHEN PARTENZA_DIVERSA_EMISSIONE_DDT THEN
RAISE_APPLICATION_ERROR(-20050,'La data di emissione del DDT deve coincidere con la data di inizio viaggio');

END;