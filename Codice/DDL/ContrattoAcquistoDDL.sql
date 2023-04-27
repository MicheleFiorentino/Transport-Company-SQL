CREATE TABLE Contratto_acquisto(
Num_telaio  CHAR(17) PRIMARY KEY,
Importo     NUMBER(9,2),
Agenzia_PP  VARCHAR2(50),            --Agenzia Passaggio Proprietà
KM_effettuati   NUMBER(7,0),
Data_acquisto   DATE,
Targa       CHAR(7) NOT NULL,

CONSTRAINT FK_CACQUISTO FOREIGN KEY (Targa) REFERENCES Mezzo (Targa)
);