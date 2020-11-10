CREATE TABLE MEMBER(
    MID NVARCHAR2(20) CONSTRAINT PK_MEM PRIMARY KEY,
    MPASSWORD NVARCHAR2(20) NOT NULL,
    MNAME NVARCHAR2(12) NOT NULL,
    MADDRESS NVARCHAR2(70) NOT NULL,
    MPHONE NVARCHAR2(20) NOT NULL,
    MBIRTH NVARCHAR2(20) NOT NULL);

CREATE TABLE BOARD(
    BNUMBER NUMBER CONSTRAINT PK_B PRIMARY KEY,
    BWRITER NVARCHAR2(20) CONSTRAINT FK_B REFERENCES MEMBER(MID)
    ON DELETE CASCADE,
    BTITLE NVARCHAR2(30),
    BCONTENTS NVARCHAR2(500),
    BDATE DATE NOT NULL,
    BHITS NUMBER,
    BFILE  NVARCHAR2(60),
    BNOTICE NUMBER NOT NULL);

CREATE TABLE LOCATION_INFO(
    LNUMBER NUMBER CONSTRAINT PK_L PRIMARY KEY,
    LNAME NVARCHAR2(50) NOT NULL,
    LOCATION NVARCHAR2(50),
    LPNUMBER NVARCHAR2(20),
    LFILE NVARCHAR2(60));
DROP TABLE LOCATION_INFO;
CREATE TABLE SHOPPING_PRODUCT(
    PNUMBER NUMBER CONSTRAINT PK_P PRIMARY KEY,
    PNAME NVARCHAR2(30) NOT NULL,
    PCONTENTS NVARCHAR2(30) NOT NULL,
    PFILE NVARCHAR2(60) NOT NULL,
    PPRICE NUMBER NOT NULL,
    PAMOUNT NUMBER NOT NULL);
    
DROP TABLE MEMBER;    
DROP TABLE SHOPPING_PRODUCT;
DROP TABLE MEMBER_BASKET;
DROP TABLE LOCATION_INFO;
DROP TABLE BOARD;

SELECT * FROM MEMBER;
SELECT * FROM SHOPPING_PRODUCT;
SELECT BPNUMBER,SUM(PBAMOUNT) FROM MEMBER_BASKET
    GROUP BY BPNUMBER;
SELECT * FROM MEMBER_BASKET;
SELECT * FROM MEMBER_BASKET;
SELECT * FROM LOCATION_INFO;
SELECT *FROM BOARD;


CREATE TABLE MEMBER_BASKET(
    BPNUMBER NUMBER CONSTRAINT FK_P REFERENCES SHOPPING_PRODUCT(PNUMBER),
    BPNAME NVARCHAR2(30) NOT NULL,
    BMID NVARCHAR2(20) CONSTRAINT PK_BI REFERENCES MEMBER(MID),
    BPPRICE NUMBER NOT NULL,
    PBAMOUNT NUMBER NOT NULL);
alter table MEMBER_BASKET drop column bpfile;
alter table MEMBER_BASKET ADD BFILE NVARCHAR2(80);
commit;
alter table MEMBER_BASKET drop column BPCONTENTS;
    
CREATE TABLE BIG_DATE(
    LNUMBER NUMBER,
    PNUMBER NUMBER,
    MAGE NUMBER);
    select * from big_date;
CREATE TABLE GGYM(
    LNUMBER NUMBER ,
    LNAME NVARCHAR2(50) NOT NULL,
    LOCATION NVARCHAR2(90));
    select * from GGYM;
drop table ggym;
drop table BIG_DATE; 
    SELECT * FROM BOARD ORDER BY BNOTICE DESC,BNUMBER DESC;
    
SELECT * FROM BOARDLIST 
    WHERE RN BETWEEN 1 AND 3 
        ORDER BY BNOTICE DESC,BNUMBER DESC;
        
        
CREATE VIEW BOARDLIST 
   AS SELECT B.*, ROW_NUMBER() 
       OVER(ORDER BY BNUMBER DESC) 
             AS RN FROM BOARD B;         
    select * from BOARDLIST;  



CREATE VIEW MEMBERLIST 
   AS SELECT M.*, ROW_NUMBER() 
       OVER(ORDER BY MID DESC) 
             AS RN FROM MEMBER M;         
    select * from MEMBERLIST;  

DROP VIEW MEMBERLIST;    
DROP VIEW BOARDLIST;    
    
DROP SEQUENCE BSEQ2;
DROP SEQUENCE pSEQ;
DROP SEQUENCE lSEQ;
CREATE SEQUENCE BSEQ2
    START WITH 1
    INCREMENT BY 1
    NOCACHE;
CREATE SEQUENCE PSEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE;
CREATE SEQUENCE LSEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE;