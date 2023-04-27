-- TRIGGER Autista_in_viaggio

CREATE OR REPLACE TRIGGER TR_Autista_in_viaggio
BEFORE INSERT ON Autista_in_viaggio
FOR EACH ROW

DECLARE
num_autisti NUMBER(1);
scadenza_patente DATE;
fine_viaggio DATE;
ultimo_viaggioA DATE;
ultimo_contrattoA DATE;

TROPPI_AUTISTI EXCEPTION; -- Gli autisti possono essere al massimo 2
PATENTE_SCADUTA EXCEPTION; -- Un autista con la patente scaduta non può andare in viaggio
AUTISTA_OCCUPATO EXCEPTION; -- Un autista non può andare in viaggio se è occupato in un altro viaggio in quelle date
CONTRATTO_SCADUTO EXCEPTION; -- Un autista non può andare in viaggio se il suo contratto è scaduto


BEGIN

    -- TROPPI_AUTISTI
SELECT  COUNT(*) INTO num_autisti
FROM    Autista_in_viaggio
WHERE   ID_viaggio = :NEW.ID_viaggio;

IF num_autisti = 2 THEN
RAISE TROPPI_AUTISTI;
END IF;

    -- SCADENZA PATENTE
SELECT  MAX(Scadenza) INTO scadenza_patente
FROM    Patente
WHERE   CF = :NEW.CF;

SELECT  Data_fine INTO fine_viaggio
FROM    Viaggio
WHERE   Viaggio.ID_viaggio = :NEW.ID_viaggio;

IF scadenza_patente < fine_viaggio THEN
RAISE PATENTE_SCADUTA;
END IF;

    -- AUTISTA OCCUPATO
SELECT  MAX(Data_fine) INTO ultimo_viaggioA -- Ultimo viaggio autista
FROM    Viaggio V1 JOIN Autista_in_viaggio V2 ON V1.ID_viaggio = V2.ID_Viaggio
WHERE   V2.CF = :NEW.CF;

SELECT  Data_fine INTO fine_viaggio     -- Data viaggio da inserire
FROM    Viaggio
WHERE   ID_Viaggio = :NEW.ID_Viaggio;

IF fine_viaggio < ultimo_viaggioA THEN
RAISE AUTISTA_OCCUPATO;
END IF;

    -- CONTRATTO SCADUTO
SELECT  Data_fine INTO ultimo_contrattoA
FROM    Contratto_assunzione
WHERE   Data_inizio = ( SELECT  MAX(Data_inizio)
                        FROM    Contratto_assunzione
                        WHERE   CF = :NEW.CF );

SELECT  Data_fine INTO fine_viaggio
FROM    Viaggio
WHERE   Viaggio.ID_viaggio = :NEW.ID_viaggio;

IF  ultimo_contrattoA IS NOT NULL
    AND fine_viaggio > ultimo_contrattoA THEN
RAISE CONTRATTO_SCADUTO;
END IF;



EXCEPTION
WHEN TROPPI_AUTISTI THEN
RAISE_APPLICATION_ERROR(-20003,'In un viaggio possono andare al massimo 2 autisti');

WHEN PATENTE_SCADUTA THEN
RAISE_APPLICATION_ERROR(-20004,'La patente dell autista è scaduta');

WHEN AUTISTA_OCCUPATO THEN
RAISE_APPLICATION_ERROR(-20005,'L autista è occupato in un altro viaggio');

WHEN CONTRATTO_SCADUTO THEN
RAISE_APPLICATION_ERROR(-20006,'Il contratto dell autista è scaduto');

END;