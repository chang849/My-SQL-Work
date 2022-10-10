/*
Seth Chang
CNIT 272 Spring 2022
Lab Time: Fri 1:30 AM - 3:20 AM
*/

--*********************************************************************************
--Question 1
--1a)
Describe user_tables;
--1b)
select Table_name from user_tables;
/*
Results:
Name                      Null?    Type           
------------------------- -------- -------------- 
TABLE_NAME                NOT NULL VARCHAR2(128)  
TABLESPACE_NAME                    VARCHAR2(30)   
CLUSTER_NAME                       VARCHAR2(128)  
IOT_NAME                           VARCHAR2(128)  
STATUS                             VARCHAR2(8)    
PCT_FREE                           NUMBER         
PCT_USED                           NUMBER         
INI_TRANS                          NUMBER         
MAX_TRANS                          NUMBER         
INITIAL_EXTENT                     NUMBER         
NEXT_EXTENT                        NUMBER         
MIN_EXTENTS                        NUMBER         
MAX_EXTENTS                        NUMBER         
PCT_INCREASE                       NUMBER         
FREELISTS                          NUMBER         
FREELIST_GROUPS                    NUMBER         
LOGGING                            VARCHAR2(3)    
BACKED_UP                          VARCHAR2(1)    
NUM_ROWS                           NUMBER         
BLOCKS                             NUMBER         
EMPTY_BLOCKS                       NUMBER         
AVG_SPACE                          NUMBER         
CHAIN_CNT                          NUMBER         
AVG_ROW_LEN                        NUMBER         
AVG_SPACE_FREELIST_BLOCKS          NUMBER         
NUM_FREELIST_BLOCKS                NUMBER         
DEGREE                             VARCHAR2(10)   
INSTANCES                          VARCHAR2(10)   
CACHE                              VARCHAR2(5)    
TABLE_LOCK                         VARCHAR2(8)    
SAMPLE_SIZE                        NUMBER         
LAST_ANALYZED                      DATE           
PARTITIONED                        VARCHAR2(3)    
IOT_TYPE                           VARCHAR2(12)   
TEMPORARY                          VARCHAR2(1)    
SECONDARY                          VARCHAR2(1)    
NESTED                             VARCHAR2(3)    
BUFFER_POOL                        VARCHAR2(7)    
FLASH_CACHE                        VARCHAR2(7)    
CELL_FLASH_CACHE                   VARCHAR2(7)    
ROW_MOVEMENT                       VARCHAR2(8)    
GLOBAL_STATS                       VARCHAR2(3)    
USER_STATS                         VARCHAR2(3)    
DURATION                           VARCHAR2(15)   
SKIP_CORRUPT                       VARCHAR2(8)    
MONITORING                         VARCHAR2(3)    
CLUSTER_OWNER                      VARCHAR2(128)  
DEPENDENCIES                       VARCHAR2(8)    
COMPRESSION                        VARCHAR2(8)    
COMPRESS_FOR                       VARCHAR2(30)   
DROPPED                            VARCHAR2(3)    
READ_ONLY                          VARCHAR2(3)    
SEGMENT_CREATED                    VARCHAR2(3)    
RESULT_CACHE                       VARCHAR2(7)    
CLUSTERING                         VARCHAR2(3)    
ACTIVITY_TRACKING                  VARCHAR2(23)   
DML_TIMESTAMP                      VARCHAR2(25)   
HAS_IDENTITY                       VARCHAR2(3)    
CONTAINER_DATA                     VARCHAR2(3)    
INMEMORY                           VARCHAR2(8)    
INMEMORY_PRIORITY                  VARCHAR2(8)    
INMEMORY_DISTRIBUTE                VARCHAR2(15)   
INMEMORY_COMPRESSION               VARCHAR2(17)   
INMEMORY_DUPLICATE                 VARCHAR2(13)   
DEFAULT_COLLATION                  VARCHAR2(100)  
DUPLICATED                         VARCHAR2(1)    
SHARDED                            VARCHAR2(1)    
EXTERNAL                           VARCHAR2(3)    
HYBRID                             VARCHAR2(3)    
CELLMEMORY                         VARCHAR2(24)   
CONTAINERS_DEFAULT                 VARCHAR2(3)    
CONTAINER_MAP                      VARCHAR2(3)    
EXTENDED_DATA_LINK                 VARCHAR2(3)    
EXTENDED_DATA_LINK_MAP             VARCHAR2(3)    
INMEMORY_SERVICE                   VARCHAR2(12)   
INMEMORY_SERVICE_NAME              VARCHAR2(1000) 
CONTAINER_MAP_OBJECT               VARCHAR2(3)    
MEMOPTIMIZE_READ                   VARCHAR2(8)    
MEMOPTIMIZE_WRITE                  VARCHAR2(8)    
HAS_SENSITIVE_COLUMN               VARCHAR2(3)    
ADMIT_NULL                         VARCHAR2(3)    
DATA_LINK_DML_ENABLED              VARCHAR2(3)    
LOGICAL_REPLICATION                VARCHAR2(8)    

*/


--*********************************************************************************
--Question 2
--2A
--a1
set linespace 200;
select round (314.59216,2) from dual;
--a2
select round (314.59216,0) from dual;
--a3
select round (314.59216,-1) from dual;
--2B
--b1
select trunc (314.59216,2) from dual;
--b2
select trunc (314.59216,0) from dual;
--b3
select trunc (314.59216,-1) from dual;


/*
Results:
--2A
--a1
ROUND(314.59216,2)
------------------
            314.59
--a2
ROUND(314.59216,0)
------------------
               315
--a3
ROUND(314.59216,-1)
-------------------
                310
--2B
--b1
TRUNC(314.59216,2)
------------------
            314.59
b2
TRUNC(314.59216,0)
------------------
               314
b3
TRUNC(314.59216,-1)
-------------------
                310

*/


--*********************************************************************************

--Question 3
set linspace 200;
COL desc_length FORMAT a12;
select description,length(description) as desc_length, upper (product_code) FROM FOOD 
where product_code='Pz'or product_code='Vt'or product_code='Vr'
Order by desc_length ;
/*
Results:
DESCRIPTION           DESC_LENGTH UP
-------------------- ------------ --
Soda                            4 VR
Iced Tea                        8 VR
Cole Slaw                       9 VT
Veggie Pizza                   12 PZ
Cheese Pizza                   12 PZ
Mango Smoothie                 14 VR
Mushroom Pizza                 14 PZ
Broccoli Salad                 14 VT

8 rows selected. 
*/

--*********************************************************************************
--Question 4
--4A
select first_name, last_name, nvl(dept_code,'xxx') from worker where credit_limit > 20
order by dept_code;

--4B
select first_name, last_name, dept_code from worker where credit_limit > 20
order by dept_code;
/*
Results:
--4A
FIRST_NAME LAST_NAME            NVL
---------- -------------------- ---
Trey       Vought               Acc
Angie      Templeton            Acc
Cleo       White                Aud
Avery      Trance               Aud
Jared      Ridgeman             Aud
Jose       Sanchez              Com
Dane       Shreve               Exe
Blair      Reynolds             Fin
Tami       Tevona               Hmn
Melody     Campbell             Hmn
Rita       Gradle               Leg

FIRST_NAME LAST_NAME            NVL
---------- -------------------- ---
Kerry      Alveral              Leg
Darius     Richards             Leg
James      Kingman              Sal
Tom        Neal                 Srv
Brooks     Walsh                Srv
Sam        Frank                Srv
Latesha    Cross                Tch
Carole     Sumner               Tch
Tyler      Harney               Tch
Katelynn   Rayner               Tch
Keyanna    Jones                Tch

FIRST_NAME LAST_NAME            NVL
---------- -------------------- ---
Gail       Walsh                xxx
Jodie      Williams             xxx
Tonya      Montre               xxx
Cassie     Irwin                xxx
Maria      Bensen               xxx
Taylor     Young                xxx
Yvonne     Rivera               xxx

29 rows selected. 
--4B
FIRST_NAME LAST_NAME            DEP
---------- -------------------- ---
Trey       Vought               Acc
Angie      Templeton            Acc
Cleo       White                Aud
Avery      Trance               Aud
Jared      Ridgeman             Aud
Jose       Sanchez              Com
Dane       Shreve               Exe
Blair      Reynolds             Fin
Tami       Tevona               Hmn
Melody     Campbell             Hmn
Rita       Gradle               Leg

FIRST_NAME LAST_NAME            DEP
---------- -------------------- ---
Kerry      Alveral              Leg
Darius     Richards             Leg
James      Kingman              Sal
Tom        Neal                 Srv
Brooks     Walsh                Srv
Sam        Frank                Srv
Latesha    Cross                Tch
Carole     Sumner               Tch
Tyler      Harney               Tch
Katelynn   Rayner               Tch
Keyanna    Jones                Tch

FIRST_NAME LAST_NAME            DEP
---------- -------------------- ---
Gail       Walsh                   
Jodie      Williams                
Tonya      Montre                  
Cassie     Irwin                   
Maria      Bensen                  
Taylor     Young                   
Yvonne     Rivera                  

29 rows selected. 

*/

--*********************************************************************************
--Question 5
COL max_date FORMAT a25;
COL min_date FORMAT a25;
select to_char(max(lunch_date), 'fmMonth DD, YYYY, Day')as max_date, to_char(min(lunch_date), 'fmMonth DD, YYYY, Day')as min_date
from lunch;
/*
Results:
MAX_DATE                  MIN_DATE                 
------------------------- -------------------------
June 23, 2021, Wednesday  May 22, 2021, Saturday       
*/

--*********************************************************************************
--Question 6
--6A
select supplier_id, count(*), to_char(avg(price),'$9999.99') as avg_price, to_char(sum(price),'$9999.99') as sum_price
from food
group by supplier_id;

--6B
select supplier_id, count(supplier_id), to_char(avg(price),'$9999.99') as avg_price, to_char(sum(price),'$9999.99') as sum_price
from food
group by supplier_id;

--6C
select supplier_id, count(price_upcharge), to_char(avg(price),'$9999.99') as avg_price, to_char(sum(price),'$9999.99') as sum_price
from food
group by supplier_id;

/*
Results:
--6A
SUP   COUNT(*) AVG_PRICE SUM_PRICE
--- ---------- --------- ---------
Ard          3     $4.25    $12.75
Blu          2     $5.15    $10.30
Crm          4     $6.26    $25.05
Dpz          3     $3.42    $10.25
Foi          4     $3.69    $14.75
Gls          3     $3.23     $9.70
Hsd          4     $5.88    $23.50
Jd6          3     $2.42     $7.25
Jmd          4     $4.65    $18.60
Lak          3     $4.70    $14.10
Lss          2     $5.40    $10.80

11 rows selected. 

--6B

SUP COUNT(SUPPLIER_ID) AVG_PRICE SUM_PRICE
--- ------------------ --------- ---------
Ard                  3     $4.25    $12.75
Blu                  2     $5.15    $10.30
Crm                  4     $6.26    $25.05
Dpz                  3     $3.42    $10.25
Foi                  4     $3.69    $14.75
Gls                  3     $3.23     $9.70
Hsd                  4     $5.88    $23.50
Jd6                  3     $2.42     $7.25
Jmd                  4     $4.65    $18.60
Lak                  3     $4.70    $14.10
Lss                  2     $5.40    $10.80

11 rows selected. 

--6C

SUP COUNT(PRICE_UPCHARGE) AVG_PRICE SUM_PRICE
--- --------------------- --------- ---------
Ard                     0     $4.25    $12.75
Blu                     1     $5.15    $10.30
Crm                     4     $6.26    $25.05
Dpz                     1     $3.42    $10.25
Foi                     2     $3.69    $14.75
Gls                     1     $3.23     $9.70
Hsd                     3     $5.88    $23.50
Jd6                     3     $2.42     $7.25
Jmd                     3     $4.65    $18.60
Lak                     1     $4.70    $14.10
Lss                     0     $5.40    $10.80

11 rows selected.  
*/

--*********************************************************************************
--Question 7
select supplier_id, count(menu_item), to_char(sum(price),'$9999.99') as sum_price, to_char(avg(price),'$9999.99')as avg_price
from food
group by supplier_id, price_upcharge;

/*
Results:

SUP COUNT(MENU_ITEM) SUM_PRICE AVG_PRICE
--- ---------------- --------- ---------
Hsd                1     $5.75     $5.75
Hsd                1     $4.25     $4.25
Crm                1     $5.25     $5.25
Crm                1     $7.20     $7.20
Crm                1     $4.00     $4.00
Jd6                2     $5.70     $2.85
Ard                3    $12.75     $4.25
Foi                1     $4.00     $4.00
Foi                1     $4.75     $4.75
Jmd                2    $10.85     $5.43
Lak                2     $8.60     $4.30

SUP COUNT(MENU_ITEM) SUM_PRICE AVG_PRICE
--- ---------------- --------- ---------
Crm                1     $8.60     $8.60
Jd6                1     $1.55     $1.55
Lss                2    $10.80     $5.40
Dpz                2     $9.25     $4.63
Blu                1     $2.80     $2.80
Hsd                2    $13.50     $6.75
Jmd                1     $6.25     $6.25
Dpz                1     $1.00     $1.00
Blu                1     $7.50     $7.50
Jmd                1     $1.50     $1.50
Gls                1     $3.50     $3.50

SUP COUNT(MENU_ITEM) SUM_PRICE AVG_PRICE
--- ---------------- --------- ---------
Foi                2     $6.00     $3.00
Gls                2     $6.20     $3.10
Lak                1     $5.50     $5.50

25 rows selected. 
*/


--*********************************************************************************
--Question 8 (Worth 2 Questions)
--8A
select dept_code, sum(credit_limit)
from worker
group by dept_code
order by dept_code;
--8B
select dept_code, city, sum(credit_limit)
from worker
group by dept_code, city
order by dept_code;

--8C
select dept_code, city, sum(credit_limit), count(*)
from worker
group by dept_code, city
order by dept_code;

--8D
select dept_code, city, sum(credit_limit), count(*)
from worker
where hire_date > '30-DEC-17'
group by dept_code, city
order by dept_code;

--8E
select dept_code, city, sum(credit_limit), count(*)
from worker
where hire_date > '30-DEC-17'
having (sum(credit_limit)) > '30'
group by dept_code, city
order by dept_code;

/*
Results:
--8A

DEP SUM(CREDIT_LIMIT)
--- -----------------
Acc                72
Aud                69
Com                22
Exe                45
Fin                48
Hmn                66
Leg                87
Sal                53
Srv                89
Tch               137
                  202

11 rows selected. 

--8B 

DEP CITY                           SUM(CREDIT_LIMIT)
--- ------------------------------ -----------------
Acc Hinsdale                                      24
Acc Oak Brook                                     30
Acc                                               18
Aud Aurora                                        25
Aud Chicago                                       22
Aud                                               22
Com Glencoe                                       22
Exe Aurora                                        45
Fin Evanston                                      28
Fin Glencoe                                       20
Hmn Chicago                                       17

DEP CITY                           SUM(CREDIT_LIMIT)
--- ------------------------------ -----------------
Hmn Oak Brook                                     49
Leg Oak Brook                                     55
Leg Wilmette                                      32
Sal Chicago                                       33
Sal Wilmette                                      20
Srv Evanston                                      30
Srv Hinsdale                                      26
Srv Oak Brook                                     33
Tch Chicago                                       27
Tch Evanston                                      25
Tch Hinsdale                                      60

DEP CITY                           SUM(CREDIT_LIMIT)
--- ------------------------------ -----------------
Tch                                               25
    Aurora                                        25
    Chicago                                       27
    Glencoe                                       25
    Hinsdale                                      20
    Wilmette                                      50
                                                  55

29 rows selected. 

--8C

DEP CITY                           SUM(CREDIT_LIMIT)   COUNT(*)
--- ------------------------------ ----------------- ----------
Acc Hinsdale                                      24          1
Acc Oak Brook                                     30          1
Acc                                               18          1
Aud Aurora                                        25          1
Aud Chicago                                       22          1
Aud                                               22          1
Com Glencoe                                       22          1
Exe Aurora                                        45          1
Fin Evanston                                      28          1
Fin Glencoe                                       20          1
Hmn Chicago                                       17          1

DEP CITY                           SUM(CREDIT_LIMIT)   COUNT(*)
--- ------------------------------ ----------------- ----------
Hmn Oak Brook                                     49          2
Leg Oak Brook                                     55          2
Leg Wilmette                                      32          1
Sal Chicago                                       33          1
Sal Wilmette                                      20          1
Srv Evanston                                      30          1
Srv Hinsdale                                      26          1
Srv Oak Brook                                     33          1
Tch Chicago                                       27          1
Tch Evanston                                      25          1
Tch Hinsdale                                      60          2

DEP CITY                           SUM(CREDIT_LIMIT)   COUNT(*)
--- ------------------------------ ----------------- ----------
Tch                                               25          1
    Aurora                                        25          1
    Chicago                                       27          1
    Glencoe                                       25          1
    Hinsdale                                      20          1
    Wilmette                                      50          2
                                                  55          2

29 rows selected. 

--8D

DEP CITY                           SUM(CREDIT_LIMIT)   COUNT(*)
--- ------------------------------ ----------------- ----------
Aud Aurora                                        25          1
Hmn Oak Brook                                     49          2
Leg Oak Brook                                     33          1
Sal Wilmette                                      20          1
Tch Chicago                                       27          1
Tch Hinsdale                                      25          1
    Chicago                                       27          1
    Glencoe                                       25          1

8 rows selected. 

--8E

DEP CITY                           SUM(CREDIT_LIMIT)   COUNT(*)
--- ------------------------------ ----------------- ----------
Hmn Oak Brook                                     49          2
Leg Oak Brook                                     33          1

*/
--*********************************************************************************
--Question 9
--9A
select supplier_id, product_code, description, price
from food
where price < (select avg(price)from food);

--9B
select round(avg(price),3)as "Rounded Avg. Price"
from food;

/*
Results:
--9A

SUP PR DESCRIPTION               PRICE
--- -- -------------------- ----------
Ard Ds PB Cookie                  1.25
Hsd Sp Chicken Soup               4.25
Crm Br Wheat Bagel                   4
Foi Vt Broccoli Salad                4
Foi Ff French Fries                1.5
Jd6 Vr Soda                       2.25
Jd6 Cf Coffee                     1.55
Jd6 Ds Brownie                    3.45
Jmd Vr Iced Tea                   2.85
Jmd Vt Cole Slaw                   1.5
Dpz Br Dinner Roll                   1

SUP PR DESCRIPTION               PRICE
--- -- -------------------- ----------
Dpz Sc Cheese Sauce                .75
Gls Ds Sugar Cookie                3.5
Gls Br Breadstick                 1.25
Blu Cp Chips                       2.8
Lak Br Cheese Stick               2.35

16 rows selected. 

--9B
Rounded Avg. Price
------------------
             4.487
*/