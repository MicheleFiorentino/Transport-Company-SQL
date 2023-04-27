-- TRIGGER CONTRATTO ASSUNZIONE

CREATE OR REPLACE TRIGGER TR_Contratto_assunzione
BEFORE INSERT ON Contratto_assunzione
FOR EACH ROW

DECLARE
FineContrattoA DATE;
DATE_CONTRATTO_SOVRAPPOSTE EXCEPTION;  -- Non posso avere due contratti di assunzioni della stessa persona definiti sullo stesso periodo.

BEGIN
SELECT  MAX(Data_fine) INTO FineContrattoA
FROM    Contratto_assunzione
WHERE   CF = :NEW.CF;

IF FineContrattoA > :NEW.Data_inizio THEN
RAISE DATE_CONTRATTO_SOVRAPPOSTE;
END IF;

EXCEPTION
WHEN DATE_CONTRATTO_SOVRAPPOSTE THEN
RAISE_APPLICATION_ERROR(-20012,'La data di inizio del nuovo contratto non può essere precedente a quella di fine del vecchio contratto');

END;