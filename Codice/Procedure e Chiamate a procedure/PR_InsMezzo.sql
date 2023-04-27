-- INS MEZZO
CREATE OR REPLACE PROCEDURE INS_Mezzo(
Targa Mezzo.Targa%TYPE,
TipoM VARCHAR2,
Tratto VARCHAR2
)

AS

BEGIN
INSERT INTO Mezzo VALUES(Targa);

CASE TipoM
    WHEN 'Autocarro' THEN INSERT INTO Autocarro VALUES(Targa,TO_NUMBER(Tratto));
    WHEN 'Rimorchio' THEN INSERT INTO Rimorchio VALUES(Targa,Tratto);
    WHEN 'Trattore' THEN INSERT INTO Trattore VALUES(Targa);
    WHEN ' Autocisterna' THEN INSERT INTO Autocisterna VALUES(Targa,TO_NUMBER(Tratto));
    ELSE RAISE_APPLICATION_ERROR(-20080,'Il tipo di mezzo inserito non è valido');
END CASE;


END INS_Mezzo;