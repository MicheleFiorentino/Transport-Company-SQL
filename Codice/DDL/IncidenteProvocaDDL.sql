CREATE TABLE Incidente_provoca(
ID_viaggio  NUMBER(6),
Data_inc    DATE,
Nome_Guasto VARCHAR2(50),

CONSTRAINT FK_IP
    FOREIGN KEY (ID_Viaggio,Data_inc) REFERENCES Incidente (ID_viaggio,Data_inc),
    FOREIGN KEY (Nome_guasto) REFERENCES Tipologia_guasto (Nome_guasto),

CONSTRAINT PK_IP PRIMARY KEY (ID_viaggio, Data_inc, Nome_guasto)
);