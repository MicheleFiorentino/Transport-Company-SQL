CREATE TABLE Incidente(
ID_viaggio      NUMBER(6),
Data_inc        DATE,

CONSTRAINT FK_INC FOREIGN KEY (ID_viaggio) REFERENCES Viaggio (ID_viaggio),
CONSTRAINT PK_INC PRIMARY KEY (ID_viaggio, Data_inc)
);