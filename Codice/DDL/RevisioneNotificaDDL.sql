CREATE TABLE Revisione_notifica(
Targa           CHAR(7),
Data_rev        DATE,
Nome_Guasto     VARCHAR2(50),

CONSTRAINT FK_RN
    FOREIGN KEY (Targa,Data_rev) REFERENCES Esito_N (Targa,Data_rev),
    FOREIGN KEY (Nome_guasto) REFERENCES Tipologia_guasto (Nome_guasto),

CONSTRAINT PK_RN PRIMARY KEY (Targa,Data_rev, Nome_guasto)
);