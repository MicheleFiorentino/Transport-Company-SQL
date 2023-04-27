CREATE TABLE Fattura(
ID_fattura      NUMBER(10) PRIMARY KEY,
Data_emissione  DATE,
Importo         NUMBER(8,2),
Stato_membro    CHAR(2),       --Inseriamo anche la sigla della nazione
P_IVA           VARCHAR2(12),   --LA P.IVA ha numero variabile. Dipende dallo Stato. 

CONSTRAINT FK_FAT FOREIGN KEY (Stato_membro,P_IVA) REFERENCES Azienda (Stato_membro,P_IVA)
);


CREATE SEQUENCE seq_IDF     -- autoincremento ID Fatture
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;