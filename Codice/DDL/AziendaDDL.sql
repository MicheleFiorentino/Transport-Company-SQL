CREATE TABLE Azienda(
Stato_membro    CHAR(2),        --Inseriamo anche la sigla della nazione
P_IVA           VARCHAR2(12),   --LA P.IVA ha numero variabile. Dipende dallo Stato. 
Nome            VARCHAR2(50),
Tel_1           VARCHAR2(16) UNIQUE,   --Incluso prefisso
Tel_2           VARCHAR2(16) UNIQUE,   --Incluso prefisso

CONSTRAINT PK_AZ PRIMARY KEY (Stato_membro,P_IVA)
);