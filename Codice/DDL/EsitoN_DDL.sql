CREATE TABLE Esito_N(       --esito Revisione. È collegato al tipo di guasto
Targa           CHAR(7),
Data_rev        DATE,

CONSTRAINT FK_EN FOREIGN KEY (Targa,Data_rev) REFERENCES Revisione (Targa,Data_rev),
CONSTRAINT PK_EN PRIMARY KEY (Targa,Data_rev)
);