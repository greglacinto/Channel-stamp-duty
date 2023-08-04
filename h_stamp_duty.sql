DROP TABLE CUSTOM.STAMP_DUTY_CHARGES_HISTORY CASCADE CONSTRAINTS;

CREATE TABLE CUSTOM.STAMP_DUTY_CHARGES_HISTORY
(
  ID					          NUMBER,
  FORACID				        VARCHAR2(15 CHAR),
  DEV_TYPE              VARCHAR2(5 CHAR),
  TRAN_TYPE				      VARCHAR2(3 CHAR),
  SRL_NUM               VARCHAR2(12 CHAR),
  TRAN_ID				        VARCHAR2(12 CHAR),
  TRAN_AMT              NUMBER(20,4),
  TRAN_DATE             DATE,
  TRAN_PARTICULAR       VARCHAR2(50 CHAR),
  TRAN_PARTICULAR2      VARCHAR2(50 CHAR),
  LCHG_USER_ID          VARCHAR2(15 CHAR),
  LCHG_TIME             DATE,
  RCRE_TIME             DATE DEFAULT SYSDATE,
  BANK_ID               VARCHAR2(2 CHAR),
  PSTD_FLG              VARCHAR2(1 CHAR) DEFAULT 'N',
  FREZ_CODE             VARCHAR2(1 BYTE),
  CR_SOL                VARCHAR2(5 BYTE),
  CHRG_TRAN_ID          VARCHAR2(12 BYTE),
  CONSTRAINT STAMP_DUTY_CHARGES_HISTORY_pk PRIMARY KEY (TRAN_ID)
)
TABLESPACE CUSTOM_TBLS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


CREATE UNIQUE INDEX CUSTOM.STAMP_DUTY_CHARGES_HISTORY_UNIIDX ON CUSTOM.STAMP_DUTY_CHARGES_HISTORY
(FORACID, BANK_ID, TRAN_ID)
LOGGING
TABLESPACE CUSTOM_TBLS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

CREATE OR REPLACE SYNONYM CUSTOM.HSTMPCHRG FOR CUSTOM.STAMP_DUTY_CHARGES_HISTORY;


GRANT DELETE, INSERT, SELECT, UPDATE ON CUSTOM.STAMP_DUTY_CHARGES_HISTORY TO TBAADM;


GRANT DELETE, INSERT, SELECT, UPDATE ON CUSTOM.STAMP_DUTY_CHARGES_HISTORY TO TBAGEN;


GRANT DELETE, INSERT, SELECT, UPDATE ON CUSTOM.STAMP_DUTY_CHARGES_HISTORY TO TBAUTIL;
