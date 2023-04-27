CREATE TABLE Revisione(
Targa           CHAR(7),
Data_rev        DATE,
Costo           NUMBER(5,2),

CONSTRAINT FK_REV FOREIGN KEY (Targa) REFERENCES Mezzo (Targa),
CONSTRAINT PK_REV PRIMARY KEY (Targa, Data_rev)
);