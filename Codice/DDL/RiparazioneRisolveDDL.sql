CREATE TABLE Riparazione_risolve(
Targa           CHAR(7),
Data_rip        DATE,
Nome_Guasto     VARCHAR2(50),

CONSTRAINT FK_RR
    FOREIGN KEY (Targa,Data_rip) REFERENCES Riparazione (Targa,Data_rip),
    FOREIGN KEY (Nome_guasto) REFERENCES Tipologia_guasto (Nome_guasto),

CONSTRAINT PK_RR PRIMARY KEY (Targa,Data_rip, Nome_guasto)
);