--INS VIAGGIO
CREATE OR REPLACE PROCEDURE INS_Viaggio(
DI   Viaggio.Data_inizio%TYPE,
DF   Viaggio.Data_fine%TYPE,
NO   Viaggio.Numero_ore%TYPE,
KM   Viaggio.KM%TYPE,
IDF  Viaggio.ID_Fattura%TYPE,
SMP     Viaggio.SM_partenza%TYPE,       
PIVA_P  Viaggio.PIVA_partenza%TYPE,   
SP      Viaggio.Sede_partenza%TYPE,
SMA     Viaggio.SM_arrivo%TYPE,       
PIVA_A  Viaggio.PIVA_arrivo%TYPE,  
SA      Viaggio.Sede_arrivo%TYPE,
ID_DDT  Viaggio.ID_DDT%TYPE,

AUT1    Autista.CF%TYPE,
AUT2    Autista.CF%TYPE,

MEZ1    Mezzo.Targa%TYPE,
MEZ2    Mezzo.Targa%TYPE,
MEZ3    Mezzo.Targa%TYPE,

ISO1    Contenitore.ISO_6346%TYPE,
ISO2    Contenitore.ISO_6346%TYPE
)

IS
IDV Viaggio.Id_Viaggio%TYPE;

BEGIN
IDV := seq_IDV.NEXTVAL;
INSERT INTO Viaggio VALUES(IDV,DI,DF,NO,KM,IDF,SMP,PIVA_P,SP,SMA,PIVA_A,SA,ID_DDT);


IF AUT1 IS NULL THEN
    RAISE_APPLICATION_ERROR(-20100,'Il campo dell autista 1 non può essere vuoto');
END IF;
INSERT INTO Autista_in_viaggio VALUES(AUT1,IDV);

IF AUT2 IS NOT NULL THEN
    INSERT INTO Autista_in_viaggio VALUES(AUT2,IDV);
END IF;


IF MEZ1 IS NULL THEN
    RAISE_APPLICATION_ERROR(-20100,'Il campo del mezzo 1 non può essere vuoto');
END IF;
INSERT INTO Mezzo_in_viaggio VALUES(MEZ1,IDV);

IF MEZ2 IS NOT NULL THEN
    INSERT INTO Mezzo_in_viaggio VALUES(MEZ2,IDV);
END IF;

IF MEZ3 IS NOT NULL THEN
    INSERT INTO Mezzo_in_viaggio VALUES(MEZ3,IDV);
END IF;


IF ISO1 IS NOT NULL THEN
    INSERT INTO Contenitore_in_viaggio VALUES(ISO1,IDV);
END IF;

IF ISO2 IS NOT NULL THEN
    INSERT INTO Contenitore_in_viaggio VALUES(ISO2,IDV);
END IF;
    

END INS_Viaggio;