CREATE TABLE Esito_P(       --esito Revisione
Targa           CHAR(7),
Data_rev        DATE,

CONSTRAINT FK_EP FOREIGN KEY (Targa,Data_rev) REFERENCES Revisione (Targa,Data_rev),
CONSTRAINT PK_EP PRIMARY KEY (Targa,Data_rev)
);