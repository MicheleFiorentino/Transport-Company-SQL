CREATE TABLE Rimorchio(
Targa           CHAR(7),
Tipo            VARCHAR2(30),

CONSTRAINT FK_RIM FOREIGN KEY (Targa) REFERENCES Mezzo (Targa),
CONSTRAINT PK_RIM PRIMARY KEY (Targa)
);