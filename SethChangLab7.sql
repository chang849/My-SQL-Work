/*
Seth Chang 
CNIT 272 Spring 2022
Lab Time: Wed 9:30 AM - 11:20 AM
*/

--*********************************************************************************
--Question 1
--1a)
create table F22NEWTABLE
    (MenuItem char(6) constraint Menuitem_Pk Primary Key,
    name varchar(20),
    Description varchar(20),
    Price varchar(20),
    SafeTemp varchar(3),
    Nutrition varchar(4));
    
    
--1b)
alter table F22NEWTABLE
    add vendor varchar(20);
    

1c)
desc F22NEWTABLE;

1d)
drop table F22NEWTABLE cascade constraints;

/*
Results:
1a)
Table F22NEWTABLE created.

1b)
Table F22NEWTABLE altered.
1c)

Name        Null?    Type         
----------- -------- ------------ 
MENUITEM    NOT NULL CHAR(6)      
NAME                 VARCHAR2(20) 
DESCRIPTION          VARCHAR2(20) 
PRICE                VARCHAR2(20) 
SAFETEMP             VARCHAR2(3)  
NUTRITION            VARCHAR2(4)  
VENDOR               VARCHAR2(20) 
1d)
Table F22NEWTABLE dropped.
*/


--*********************************************************************************
--Question 2
--2A
create table F22ZIPCODE as (
select row_number() over (Order by City) as zipcode, city
from (select city from worker
union
select supplier_city 
from food_supplier)
where city is not null);

--2B
select count (*)
from F22ZIPCODE;

/*
Results:
--2A
Table F22ZIPCODE created.

--2B

  COUNT(*)
----------
         8
*/


--*********************************************************************************

--Question 3
--3A
create table F22STUDENT
(Student_ID char(9) constraint F22STUDENT_Pk Primary Key,
    LastName varchar(30),
    FirstName varchar(30),
    Birthdate date,
    CareerID char(8),
    ZipCode char(10) not null,
    Status char(2),
    GradeYear char(4),
    constraint CareerID_UQ1 Unique(CareerID));
    
--3B
desc F22STUDENT;

--3C
select constraint_name, constraint_type, Status, Search_Condition
from User_Constraints
where Table_Name='F22STUDENT';
/*
--3A)
Table F22STUDENT created.
--3B)
Name       Null?    Type         
---------- -------- ------------ 
STUDENT_ID NOT NULL CHAR(9)      
LASTNAME            VARCHAR2(30) 
FIRSTNAME           VARCHAR2(30) 
BIRTHDATE           DATE         
CAREERID            CHAR(8)      
ZIPCODE    NOT NULL CHAR(10)     
STATUS              CHAR(2)      
GRADEYEAR           CHAR(4)      
   
--3C)

select constraint_name, constraint_type, Status, Search_Condition
from User_Constraints
where Table_Name='F22STUDENT';

CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
SYS_C00442286                                                                                                                    C ENABLED  "ZIPCODE" IS NOT NULL                                                           
F22STUDENT_PK                                                                                                                    P ENABLED                                                                                  
CAREERID_UQ1                                                                                                                     U ENABLED                                                                                  

*/
--*********************************************************************************

--Question 4
--4A
alter table F22STUDENT
add ApplicationDate date;

--4B
desc F22STUDENT;
/*
Results:
--4A)
Table F22STUDENT altered.
--4B)
Name            Null?    Type         
--------------- -------- ------------ 
STUDENT_ID      NOT NULL CHAR(9)      
LASTNAME                 VARCHAR2(30) 
FIRSTNAME                VARCHAR2(30) 
BIRTHDATE                DATE         
CAREERID                 CHAR(8)      
ZIPCODE         NOT NULL CHAR(10)     
STATUS                   CHAR(2)      
GRADEYEAR                CHAR(4)      
APPLICATIONDATE          DATE    
*/


--*********************************************************************************
--Question 5
--5A
create table F22CAMPUS
(Campus_ID char(6) constraint F22CAMPUS_Pk Primary Key,
    CampusName char(6),
    ZipCode char(10),
    website varchar(50),
    Email char(4));
    
--5B
desc F22CAMPUS;
/*
Results:
--5A)
Table F22CAMPUS created.
--5B)

Name       Null?    Type         
---------- -------- ------------ 
CAMPUS_ID  NOT NULL CHAR(6)      
CAMPUSNAME          CHAR(6)      
ZIPCODE             CHAR(10)     
WEBSITE             VARCHAR2(50) 
EMAIL               CHAR(4)   
*/


--*********************************************************************************
--Question 6
--6A

alter table F22STUDENT
add CampusID char(6);
--6B

alter table F22STUDENT
add constraint F22STUDENT_CampusID_FK
foreign key (CampusID)
references F22STUDENT;

--6C
desc F22STUDENT;

/*
Results:
--6A)
Table F22STUDENT altered.

--6B)
Table F22STUDENT altered.

--6C)
Name       Null?    Type         
---------- -------- ------------ 
STUDENT_ID NOT NULL CHAR(9)      
LASTNAME            VARCHAR2(30) 
FIRSTNAME           VARCHAR2(30) 
BIRTHDATE           DATE         
CAREERID            VARCHAR2(4)  
ZIPCODE    NOT NULL CHAR(10)     
STATUS              CHAR(2)      
GRADEYEAR           CHAR(4)      
CAMPUSID            CHAR(6)
*/


--*********************************************************************************
--Question 7
--7A)
alter table F22STUDENT
add constraint F22STUDENT_STATUS_CK check (status='FR' or status='SO' or status='JR' or status='SR');

--7B)
INSERT INTO F22STUDENT (STUDENT_ID, status) VALUES ('PU3922','GR');

/*
Results:
--7A)
Table F22STUDENT altered.

--7B)
Error starting at line : 229 in command -
INSERT INTO F22STUDENT (STUDENT_ID, status) VALUES ('PU3922','GR')
Error report -
ORA-01400: cannot insert NULL into ("CHANG849"."F22STUDENT"."ZIPCODE")
*/


--*********************************************************************************
--Question 8 (Worth 2 Questions)
--8A
select user, sysdate
from dual;

/*
Results:
--8)
USER                                                                                                                             SYSDATE  
-------------------------------------------------------------------------------------------------------------------------------- ---------
CHANG849                                                                                                                         28-OCT-22


--*********************************************************************************
--Question 9
*/
--9A
select constraint_name, Table_name, Status
from User_constraints where constraint_type='P';

--9B
select constraint_name, Table_name, R_constraint_name, Status
from User_constraints where constraint_type='R';

/*
Results:
--9A)
CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
BIN$7AkO4TfhUj/gUy0ELoCsnQ==$0                                                                                                   BIN$7AkO4TfjUj/gUy0ELoCsnQ==$0                                                                                                   ENABLED 
BIN$7AkO4TfkUj/gUy0ELoCsnQ==$0                                                                                                   BIN$7AkO4TfmUj/gUy0ELoCsnQ==$0                                                                                                   ENABLED 
BIN$7AkO4TfnUj/gUy0ELoCsnQ==$0                                                                                                   BIN$7AkO4TfpUj/gUy0ELoCsnQ==$0                                                                                                   ENABLED 
BIN$7AkO4TfrUj/gUy0ELoCsnQ==$0                                                                                                   BIN$7AkO4TfvUj/gUy0ELoCsnQ==$0                                                                                                   ENABLED 
DEPARTMENT_PK                                                                                                                    DEPARTMENT                                                                                                                       ENABLED 
F22CAMPUS_PK                                                                                                                     F22CAMPUS                                                                                                                        ENABLED 
F22STUDENT_PK                                                                                                                    F22STUDENT                                                                                                                       ENABLED 
FOOD_PK                                                                                                                          FOOD                                                                                                                             ENABLED 
FOOD_SUPPLIER_PK                                                                                                                 FOOD_SUPPLIER                                                                                                                    ENABLED 
LUNCH_ITEM_PK                                                                                                                    LUNCH_ITEM                                                                                                                       ENABLED 
LUNCH_PK                                                                                                                         LUNCH                                                                                                                            ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
MENUITEM_PK                                                                                                                      F22NEWTABLE                                                                                                                      ENABLED 
WORKER_PK                                                                                                                        WORKER                                                                                                                           ENABLED 

13 rows selected. 
--9B)
CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       R_CONSTRAINT_NAME                                                                                                                STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
DC_FK                                                                                                                            WORKER                                                                                                                           DEPARTMENT_PK                                                                                                                    ENABLED 
F22STUDENT_CAMPUSID_FK                                                                                                           F22STUDENT                                                                                                                       F22STUDENT_PK                                                                                                                    ENABLED 
FOOD_FK                                                                                                                          LUNCH_ITEM                                                                                                                       FOOD_PK                                                                                                                          ENABLED 
LUNCH_FK                                                                                                                         LUNCH_ITEM                                                                                                                       LUNCH_PK                                                                                                                         ENABLED 
SUPPLIER_FK                                                                                                                      FOOD                                                                                                                             FOOD_SUPPLIER_PK                                                                                                                 ENABLED 
WORKER_FK                                                                                                                        LUNCH                                                                                                                            WORKER_PK                                                                                                                        ENABLED 

6 rows selected. 
*/
--*********************************************************************************
--Question 10
drop table F22ZIPCODE cascade constraints;
drop table F22STUDENT cascade constraints;
drop table F22CAMPUS cascade constraints;

/*
Results:
Table F22ZIPCODE dropped.



Table F22STUDENT dropped.




Table F22CAMPUS dropped.
*/