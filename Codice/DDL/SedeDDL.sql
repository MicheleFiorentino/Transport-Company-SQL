CREATE TABLE Sede(
Stato_membro    CHAR(2),       --Inseriamo anche la sigla della nazione
P_IVA           VARCHAR2(12),   --LA P.IVA ha numero variabile. Dipende dallo Stato. 
Nome            VARCHAR2(50),
Via             VARCHAR2(40),
CAP             CHAR(5),
Comune          VARCHAR2(30),
PROV            VARCHAR(5),    -- consideriamo anche le "province" estere

CONSTRAINT FK_SEDE FOREIGN KEY (Stato_membro,P_IVA) REFERENCES Azienda (Stato_membro,P_IVA),
CONSTRAINT PK_SEDE PRIMARY KEY (Stato_membro,P_IVA, Nome)
);