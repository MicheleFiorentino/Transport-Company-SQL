CREATE TABLE Contratto_assicurazione(
Targa           CHAR(7),
Data_ass        DATE,
Importo         NUMBER(7,2),
Agenzia         VARCHAR2(50),

CONSTRAINT FK_CASSIC FOREIGN KEY (Targa) REFERENCES Mezzo (Targa),
CONSTRAINT PK_CASSIC PRIMARY KEY (Targa,Data_ass)
);