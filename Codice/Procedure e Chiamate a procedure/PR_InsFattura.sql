-- INS FATTURA

CREATE OR REPLACE PROCEDURE INS_Fattura(
Data_emissione Fattura.Data_emissione%TYPE,
Importo Fattura.Importo%TYPE,
Stato_membro Fattura.Stato_membro%TYPE,
P_IVA Fattura.P_IVA%TYPE
)
AS

BEGIN
INSERT INTO Fattura VALUES(seq_IDF.NEXTVAL,Data_emissione,Importo,Stato_membro,P_IVA);

END INS_Fattura;