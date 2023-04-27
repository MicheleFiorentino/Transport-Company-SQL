CREATE TABLE Patente(
Num_Patente CHAR(10) PRIMARY KEY,
Scadenza    DATE,
Qualifica   VARCHAR2(3),
CF          CHAR(16),
CONSTRAINT FK_Patente FOREIGN KEY (CF) REFERENCES Autista(CF) 
);