CREATE TABLE Autista_in_viaggio(
ID_viaggio          NUMBER(6),
CF                  CHAR(16),

CONSTRAINT FK_AIV
    FOREIGN KEY (ID_viaggio) REFERENCES Viaggio (ID_viaggio ),
    FOREIGN KEY (CF) REFERENCES Autista (CF),

CONSTRAINT PK_AIV PRIMARY KEY (ID_viaggio, CF)
);