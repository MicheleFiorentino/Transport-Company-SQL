CREATE TABLE Viaggio(
ID_viaggio  NUMBER(6) PRIMARY KEY,
Data_inizio DATE,
Data_fine   DATE,
Numero_ore  NUMBER(3),
KM          NUMBER(5),

ID_fattura  NUMBER(10) UNIQUE NOT NULL,
SM_partenza      CHAR(2),       --Inseriamo anche la sigla della nazione
PIVA_partenza    VARCHAR2(12),   --LA P.IVA ha numero variabile. Dipende dallo Stato. 
Sede_partenza VARCHAR2(50),
SM_arrivo        CHAR(2),       --Inseriamo anche la sigla della nazione
PIVA_arrivo      VARCHAR2(12),   --LA P.IVA ha numero variabile. Dipende dallo Stato. 
Sede_arrivo VARCHAR2(50),
ID_DDT      NUMBER(10) UNIQUE NOT NULL,

CONSTRAINT FK_V
    FOREIGN KEY (ID_fattura) REFERENCES Fattura (ID_fattura),
    FOREIGN KEY (SM_partenza, PIVA_partenza,Sede_partenza) REFERENCES Sede (Stato_membro,P_IVA, Nome),
    FOREIGN KEY (SM_arrivo, PIVA_arrivo,Sede_arrivo) REFERENCES Sede (Stato_membro,P_IVA, Nome),
    FOREIGN KEY (ID_DDT) REFERENCES DDT (ID_DDT)
);

CREATE SEQUENCE seq_IDV     -- autoincremento ID Viaggio
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;