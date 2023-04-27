CREATE TABLE DDT(
ID_DDT          NUMBER(10) PRIMARY KEY,
Peso_T          NUMBER(4,2),
Data_emissione  DATE,
Numero_Sigillo  VARCHAR2(16)
);


CREATE SEQUENCE seq_DDT     -- autoincremento ID DDT
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;