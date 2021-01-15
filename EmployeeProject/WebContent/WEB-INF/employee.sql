--------------------------------------------------------
--  파일이 생성됨 - 금요일-1월-15-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table EMPLOYEE_SALARY
--------------------------------------------------------

  CREATE TABLE "EMPLOYEE_SALARY" 
   (	"ENO" VARCHAR2(5 BYTE), 
	"SALARY" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
--------------------------------------------------------
--  DDL for Table EMPLOYEE
--------------------------------------------------------

  CREATE TABLE "EMPLOYEE" 
   (	"ENO" VARCHAR2(50 BYTE), 
	"NAME" VARCHAR2(50 BYTE), 
	"DEPARTMENT" VARCHAR2(50 BYTE), 
	"POSITION" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POSITION_LIST
--------------------------------------------------------

  CREATE TABLE "POSITION_LIST" 
   (	"PNO" NUMBER, 
	"NAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into EMPLOYEE_SALARY
SET DEFINE OFF;
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('XF41',3600);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('IR45',7200);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('GY76',4500);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('TQ98',6200);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('KB74',2800);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('XD59',2900);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('WH43',3450);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('BM81',14000);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('DA43',5500);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('HM80',5600);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('DI93',8700);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('LY86',6900);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('IP68',3600);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('PW50',12000);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('VS12',4500);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('ZV72',4900);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('JA99',7400);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('MR62',5100);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('SJ41',6000);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('HG13',9900);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('OH20',9600);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('NM11',5900);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('ZT62',4600);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('TO73',4800);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('JE10',7800);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('PU91',7700);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('QQ84',9000);
Insert into EMPLOYEE_SALARY (ENO,SALARY) values ('AB11',3600);
REM INSERTING into EMPLOYEE
SET DEFINE OFF;
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('IR45','김시우','영업',6);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('GY76','김준래','법무',7);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('KB74','박셩우','총무',5);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('XD59','박병상','영업',7);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('WH43','박정현','인사',2);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('BM81','서민우','인사',6);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('DA43','이동희','인사',4);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('HM80','이원구','영업',1);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('DI93','정성수','마케팅',4);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('LY86','정희우','마케팅',6);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('IP68','조성수','영업',7);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('PW50','주지우','마케팅',4);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('VS12','최승수','영업',6);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('ZV72','한상오','영업',5);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('JA99','이지원','회계',1);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('MR62','김희연','영업',5);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('SJ41','노소정','법무',6);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('HG13','손지해','총무',5);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('OH20','정다혜','영업',4);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('NM11','장세이','인사',5);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('ZT62','차영연','인사',6);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('TO73','장희은','인사',2);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('JE10','남혜미','영업',5);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('PU91','유민주','마케팅',2);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('QQ84','원소은','마케팅',4);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('AB11','홍길동','총무',8);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('TQ98','강병헌','영업',4);
Insert into EMPLOYEE (ENO,NAME,DEPARTMENT,POSITION) values ('XF41','김동수','회계',7);
REM INSERTING into POSITION_LIST
SET DEFINE OFF;
Insert into POSITION_LIST (PNO,NAME) values (1,'사원');
Insert into POSITION_LIST (PNO,NAME) values (2,'주임');
Insert into POSITION_LIST (PNO,NAME) values (3,'대리');
Insert into POSITION_LIST (PNO,NAME) values (4,'과장');
Insert into POSITION_LIST (PNO,NAME) values (5,'차장');
Insert into POSITION_LIST (PNO,NAME) values (6,'부장');
Insert into POSITION_LIST (PNO,NAME) values (7,'사장');
--------------------------------------------------------
--  DDL for Index SYS_C007032
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007032" ON "EMPLOYEE" ("ENO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table EMPLOYEE
--------------------------------------------------------

  ALTER TABLE "EMPLOYEE" ADD PRIMARY KEY ("ENO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEE_SALARY
--------------------------------------------------------

  ALTER TABLE "EMPLOYEE_SALARY" ADD CONSTRAINT "FK_SALARY_ENO" FOREIGN KEY ("ENO")
	  REFERENCES "EMPLOYEE" ("ENO") ON DELETE CASCADE ENABLE;

	  
	  
	  select name from POSITION_LIST where pno = 4;
	  
	  select e.eno, e.name, e.department, p.name, s.salary from employee e, POSITION_LIST p, EMPLOYEE_SALARY s where e.eno like s.eno and e.position like p.pno;
	  
	  
select e.eno, e.name, e.department, p.name, s.salary from employee e, POSITION_LIST p, EMPLOYEE_SALARY s where e.eno like s.eno and e.position like p.pno
	  and e.name like '장세이';
	  
	  select * from EMPLOYEE;
	  
	  delete from employee where eno like 'IR45';
	  