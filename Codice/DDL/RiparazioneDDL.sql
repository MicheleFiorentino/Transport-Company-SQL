CREATE TABLE Riparazione(
Targa           CHAR(7),
Data_rip        DATE,
Costo           NUMBER(8,2),

CONSTRAINT FK_RIP FOREIGN KEY (Targa) REFERENCES Mezzo (Targa),
CONSTRAINT PK_RIP PRIMARY KEY (Targa, Data_rip)
);