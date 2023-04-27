--INS AUTISTA

CREATE OR REPLACE PROCEDURE INS_Autista(
CF      Autista.CF%TYPE,
Nome    Autista.Nome%TYPE,
Cognome Autista.Cognome%TYPE,
Data_Nascita    Autista.Data_Nascita%TYPE,
Via     Autista.Via%TYPE,
CAP     Autista.CAP%TYPE,
Comune  Autista.Comune%TYPE,
PROV    Autista.PROV%TYPE,
Tel_Personale   Autista.Tel_Personale%TYPE,    --Numero di casa(11) o Numero Cellulare (10)
Tel_Aziendale   Autista.Tel_Aziendale%TYPE
)

AS

BEGIN
INSERT INTO Autista VALUES(CF,Nome,Cognome,
Data_Nascita,Via,CAP,Comune,PROV,Tel_personale,Tel_aziendale);

END INS_Autista;