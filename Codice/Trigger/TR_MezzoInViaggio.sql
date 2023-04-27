-- TRIGGER MEZZO IN VIAGGIO

CREATE OR REPLACE TRIGGER TR_Mezzo_in_viaggio
BEFORE INSERT ON Mezzo_in_viaggio
FOR EACH ROW

DECLARE
num_mezzi NUMBER;
targa_rim Mezzo.Targa%TYPE;
ultima_data DATE;
fine_viaggio DATE;
ERR_MEZZO_COMPOSTO EXCEPTION;
ASSICURAZIONE_SCADUTA EXCEPTION;
REVISIONE_SCADUTA EXCEPTION;
MEZZO_OCCUPATO EXCEPTION;

BEGIN
    -- ERR MEZZO COMPOSTO
SELECT  COUNT(*) INTO num_mezzi
FROM    Mezzo_in_viaggio
WHERE   ID_viaggio = :NEW.ID_Viaggio;

SELECT Targa INTO targa_rim
FROM Rimorchio 
WHERE Targa = :NEW.Targa;

IF num_mezzi = 0 AND targa_rim IS NOT NULL -- si tratta di un rimorchio
OR (num_mezzi = 1 OR num_mezzi = 2) AND targa_rim IS NULL -- non si tratta di un rimorchio
OR num_mezzi = 3 THEN
RAISE ERR_MEZZO_COMPOSTO;
END IF;

    -- ASSICURAZIONE SCADUTA
SELECT  MAX(Data_ass) INTO ultima_data
FROM    Contratto_assicurazione
WHERE   Targa = :NEW.Targa;

IF SYSDATE - ultima_data > 365 THEN
RAISE ASSICURAZIONE_SCADUTA;
END IF;

    -- REVISIONE SCADUTA
SELECT  MAX(Data_rev) INTO ultima_data
FROM    Revisione
WHERE   Targa = :NEW.Targa;

IF SYSDATE - ultima_data > 365 THEN
RAISE REVISIONE_SCADUTA;
END IF;

    -- MEZZO OCCUPATO
SELECT  MAX(Data_fine) INTO ultima_data -- Ultimo viaggio mezzo
FROM    Viaggio V1 JOIN Mezzo_in_viaggio V2 ON V1.ID_viaggio = V2.ID_Viaggio
WHERE   V2.Targa = :NEW.Targa;

SELECT  Data_fine INTO fine_viaggio     -- Data viaggio da inserire
FROM    Viaggio
WHERE   ID_Viaggio = :NEW.ID_Viaggio;

IF fine_viaggio < ultima_data THEN
RAISE MEZZO_OCCUPATO;
END IF;


EXCEPTION
WHEN ERR_MEZZO_COMPOSTO THEN
RAISE_APPLICATION_ERROR(-20007,'Un complesso di mezzi cosi formato non puo andare in viaggio');

WHEN ASSICURAZIONE_SCADUTA THEN
RAISE_APPLICATION_ERROR(-20008,'Un mezzo con assicurazione scaduta non puo andare in viaggio');

WHEN REVISIONE_SCADUTA THEN
RAISE_APPLICATION_ERROR(-20009,'Un mezzo con revisione scaduta non puo andare in viaggio');

WHEN MEZZO_OCCUPATO THEN
RAISE_APPLICATION_ERROR(-20010,'Il mezzo è occupato in un altro viaggio in quelle date');

END;