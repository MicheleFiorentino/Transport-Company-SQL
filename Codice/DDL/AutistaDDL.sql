CREATE TABLE Autista(
CF      CHAR(16)    PRIMARY KEY,
Nome    VARCHAR2(20),
Cognome VARCHAR2(20),
Data_Nascita    DATE,
Via     VARCHAR2(40),
CAP     CHAR(5),
Comune  VARCHAR2(30),
PROV    VARCHAR(5),    -- consideriamo anche le "province" estere
Tel_Personale   VARCHAR2(11) UNIQUE,    --Numero di casa(11) o Numero Cellulare (10)
Tel_Aziendale   CHAR(10) UNIQUE
);