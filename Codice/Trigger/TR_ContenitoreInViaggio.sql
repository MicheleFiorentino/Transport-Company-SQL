-- TRIGGER CONTENITORE IN VIAGGIO

CREATE OR REPLACE TRIGGER TR_Contenitore_in_viaggio
BEFORE INSERT ON Contenitore_in_viaggio
FOR EACH ROW

DECLARE
ultima_data DATE;
fine_viaggio DATE;
CONTENITORE_OCCUPATO EXCEPTION;

BEGIN

    -- CONTENITORE OCCUPATO
SELECT  MAX(Data_fine) INTO ultima_data -- Ultimo viaggio mezzo
FROM    Viaggio V1 JOIN contenitore_in_viaggio V2 ON V1.ID_viaggio = V2.ID_Viaggio
WHERE   V2.ISO_6346 = :NEW.ISO_6346;

SELECT  Data_fine INTO fine_viaggio     -- Data viaggio da inserire
FROM    Viaggio
WHERE   ID_Viaggio = :NEW.ID_Viaggio;

IF fine_viaggio < ultima_data THEN
RAISE CONTENITORE_OCCUPATO;
END IF;

EXCEPTION
WHEN CONTENITORE_OCCUPATO THEN
RAISE_APPLICATION_ERROR(-20011,'Il contenitore è occupato in un altro viaggio in quelle date');

END;