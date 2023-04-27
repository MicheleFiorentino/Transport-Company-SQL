CREATE TABLE Contenitore_in_viaggio(
ID_viaggio          NUMBER(6),
ISO_6346            CHAR(11),   --11 CIFRE

CONSTRAINT FK_CIV
    FOREIGN KEY (ID_viaggio) REFERENCES Viaggio (ID_viaggio),
    FOREIGN KEY (ISO_6346) REFERENCES Contenitore (ISO_6346),

CONSTRAINT PK_CIV PRIMARY KEY (ID_viaggio, ISO_6346)
);