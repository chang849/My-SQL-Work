/*
Seth Chang 
CNIT 272 Spring 2022
Lab Time: Thurs 1:30 PM - 3:20 PM
*/

--*********************************************************************************
--Question 1
--1A)
SELECT WORKER_ID
FROM WORKER
WHERE WORKER_ID = 589;

--1B)
INSERT INTO WORKER (WORKER_ID, FIRST_NAME, LAST_NAME, CITY, DEPT_CODE, HIRE_DATE, CREDIT_LIMIT, PHONE_NUMBER, MANAGER_ID)
VALUES (589, 'Maia', 'Jackson', 'Evanston', 'Tch', '30-Jan-22', '30', '7592', '565');

--1C)
select * from worker where worker_id='589';

--1D
SELECT WORKER_ID
FROM lunch
WHERE WORKER_ID = 589;

--1E
INSERT INTO lunch (LUNCH_ID, LUNCH_DATE, WORKER_ID)
VALUES (53, '02-FEB-2022', '589');
INSERT INTO lunch (LUNCH_ID, LUNCH_DATE, WORKER_ID)
VALUES (54, '04-FEB-2022', '589');

--1F
INSERT INTO lunch (LUNCH_ID, LUNCH_DATE, WORKER_ID)
VALUES (56, '02-JUNE-2022', '589');
--1G
select * from lunch where worker_id='589';
--1E
COMMIT;
/*
Results:
--1A
no rows selected

--1B
1 row inserted.

--1C
WOR FIRST_NAME LAST_NAME            CITY                           DEP HIRE_DATE CREDIT_LIMIT PHON MAN
--- ---------- -------------------- ------------------------------ --- --------- ------------ ---- ---
589 Maia       Jackson              Evanston                       Tch 30-JAN-22           30 7592 565

--1D
no rows selected

--1E
1 row inserted.
1 row inserted.

--1F
1 row inserted.

--1G
  LUNCH_ID LUNCH_DAT WOR
---------- --------- ---
        53 02-FEB-22 589
        54 04-FEB-22 589
        56 02-JUN-22 589
        
--1E
Commit complete.

*/



--*********************************************************************************
--Question 2
--2A
SELECT SUPPLIER_ID, SUPPLIER_NAME, SUPPLIER_CITY
FROM FOOD_SUPPLIER
WHERE SUPPLIER_ID = 'JD6';

--2B
UPDATE FOOD_SUPPLIER
SET SUPPLIER_NAME = 'Jordan Market Deli', SUPPLIER_CITY = 'Glencoe'
WHERE SUPPLIER_ID = 'Jd6';
--2C
COMMIT;
--2D

SELECT SUPPLIER_ID, SUPPLIER_NAME, SUPPLIER_CITY FROM FOOD_SUPPLIER WHERE SUPPLIER_ID = 'Jd6';
/*
Results:
--2A
no rows selected

--2B
1 row updated.

--2C
Commit complete.

*/


--*********************************************************************************

--Question 3
--3A
SELECT SUPPLIER_ID, DESCRIPTION, PRICE
FROM FOOD
WHERE SUPPLIER_ID = 'Jd6';

--3B
UPDATE FOOD
SET PRICE = PRICE * (1.40)
WHERE SUPPLIER_ID = 'Jd6';

--3C
SELECT SUPPLIER_ID, DESCRIPTION, PRICE
FROM FOOD
WHERE SUPPLIER_ID = 'Jd6';
/*
Results:
--3A

SUP DESCRIPTION               PRICE
--- -------------------- ----------
Jd6 Coffee                     1.55
Jd6 Brownie                    3.45
Jd6 Soda                       2.25

--3B
3 rows updated.

--3C
SELECT SUPPLIER_ID, DESCRIPTION, PRICE
FROM FOOD
WHERE SUPPLIER_ID = 'Jd6';
*/
--*********************************************************************************
--Question 4
--4A
select f.supplier_id, f.product_code
from food f left join lunch_item li
on f.supplier_id=li.supplier_id and f.product_code=li.product_code
where li.supplier_id is null;
--4B
delete from food
where supplier_id ||' '|| product_code in
(select f.supplier_id ||' '|| f.product_code
from food f left join lunch_item li
on f.supplier_id=li.supplier_id and f.product_code=li.product_code
where li.supplier_id is null);
--4C
select f.supplier_id, f.product_code
from food f left join lunch_item li
on f.supplier_id=li.supplier_id and f.product_code=li.product_code
where li.supplier_id is null;
/*
Results:
--4A
SUP PR
--- --
Ard Sw
Jmd Vt
Ard Ds
Gls Vr

--4B
4 rows deleted.

--4C
no rows selected

*/


--*********************************************************************************
--Question 5
--5A
select supplier_id, supplier_name
from food_supplier
where supplier_id not in (select supplier_id from food);

--5B
delete from food_supplier
where supplier_id not in (select supplier_id from food);

--5C
select supplier_id, supplier_name
from food_supplier
where supplier_id not in (select supplier_id from food);

--5D
ROllBACK;

--5E
Select supplier_id, supplier_name
from food_supplier
where supplier_id not in (select supplier_id from food);
/*
Results:
--5A

SUP SUPPLIER_NAME                 
--- ------------------------------
Fas Framer and Samson             
Fdv Fresh Daily Vegetables        
Gio Giovana and Sons              
Har Harold Bakery                 
Met Under the Metra               
Rby Rosemont Bakery               

6 rows selected. 

--5B
6 rows deleted.

--5C
no rows selected

--5D
Rollback complete.

--5E
6 rows selected. 

*/


--*********************************************************************************
--Question 6
--6A
drop table travel cascade constraints;

CREATE TABLE travel 
(worker_ID     char(3),
 dept_code      varchar2(4),
 travel_limit   number(5,2),
 authorization  Char(2),
    constraint travel_pk primary key (worker_ID)
   );

--6B
alter table travel
add constraint travel_worker_fk
foreign key (worker_ID)
references worker;

--6C
insert into travel
select worker_id, dept_code,(Credit_Limit + Credit_limit*.24), null
from worker 
where manager_id='555';

--6D
update travel 
set authorization='B7';

--6E
select *
from travel;
--6F
COMMIT;

/*
Results:
--6A
Error starting at line : 228 in command -
drop table travel cascade constraints
Error report -
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Table TRAVEL created.

--6B
Table TRAVEL altered.

--6C
8 rows inserted.

--6D
8 rows updated.

--6E

WOR DEPT TRAVEL_LIMIT AU
--- ---- ------------ --
556 Tch          43.4 B7
557 Leg         39.68 B7
558 Hmn         34.72 B7
559 Srv         32.24 B7
561                31 B7
563 Acc          37.2 B7
564 Sal         40.92 B7
579             28.52 B7

8 rows selected. 

--6F
Commit complete.
*/
