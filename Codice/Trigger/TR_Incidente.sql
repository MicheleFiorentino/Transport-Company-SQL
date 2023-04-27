-- TRIGGER INCIDENTE

CREATE OR REPLACE TRIGGER TR_Incidente
BEFORE INSERT ON Incidente
FOR EACH ROW

DECLARE
inizio_viaggio DATE;
fine_viaggio DATE;
INC_NON_IN_VIAGGIO EXCEPTION;

BEGIN
SELECT  Data_inizio,Data_fine INTO inizio_viaggio,fine_viaggio
FROM    Viaggio
WHERE   ID_Viaggio = :NEW.ID_Viaggio;

IF  :NEW.Data_inc < inizio_viaggio OR :NEW.Data_inc > fine_viaggio THEN -- cioè, se l'incidente è avvenuto PRIMA o DOPO il viaggio
RAISE INC_NON_IN_VIAGGIO;
END IF;

EXCEPTION
WHEN INC_NON_IN_VIAGGIO THEN
RAISE_APPLICATION_ERROR(-20013,'La data di un incidente deve essere compresa in quelle del viaggio');

END;