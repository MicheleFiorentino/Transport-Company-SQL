CREATE TABLE Mezzo_in_viaggio(
ID_viaggio      NUMBER(6),
Targa           CHAR(7),

CONSTRAINT FK_MIV
    FOREIGN KEY (ID_viaggio) REFERENCES Viaggio (ID_viaggio ),
    FOREIGN KEY (Targa) REFERENCES Mezzo (Targa),

CONSTRAINT PK_MIV PRIMARY KEY (ID_viaggio, Targa)
);