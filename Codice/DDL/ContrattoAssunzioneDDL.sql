CREATE TABLE Contratto_assunzione( --TENIAMO IN CONTO TUTTI I CONTRATTI DI ASSUNZIONE, PURE PRECEDENTI
Data_inizio DATE,
CF  CHAR (16),
Data_fine   DATE,
Paga_oraria NUMBER(4,2),
Paga_base   NUMBER(7,2), --cambiato number da 4 a 5

CONSTRAINT FK_CA FOREIGN KEY (CF) REFERENCES Autista (CF),
CONSTRAINT PK_CA PRIMARY KEY (Data_inizio,CF)
);