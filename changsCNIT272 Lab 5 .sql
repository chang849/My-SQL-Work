    /*
Seth Chang 
CNIT 272 Spring 2022
Lab Time: Ths 9:30 AM - 11:20 AM
*/

--*********************************************************************************
--Question 1
select supplier_id, supplier_name, supplier_city
from food_supplier
where supplier_id in (select supplier_id from food where price >7.0);
/*
Results:
SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Blu Blue Sky Deli                  Oak Brook                     
Crm Crystal Market                 Hinsdale                      
Dpz Downtowner Pizza               Chicago                       
Hsd Harper Street Deli             Chicago                       
Jmd Jebston Montrose Deli          Chicago         

*/


--*********************************************************************************
--Question 2
--2
set linesize 200;
select worker_id, first_name, last_name, hire_date
from worker
where worker_id not in (select worker_id from lunch) 
order by hire_date;


/*
Results:
--2

WOR FIRST_NAME LAST_NAME            HIRE_DATE
--- ---------- -------------------- ---------
574 Cassie     Irwin                13-SEP-03
561 Maria      Bensen               15-SEP-07
580 Roy        Gonzalez             19-DEC-11
583 Tonya      Montre               07-MAR-12
569 Blair      Reynolds             07-FEB-13
558 Melody     Campbell             24-MAY-18
566 Tami       Tevona               21-AUG-19
588 Gail       Walsh                22-MAR-21

8 rows selected. 

*/


--*********************************************************************************

--Question 3
set linespace 200;
select s.supplier_id, supplier_name, description, price
from food_supplier s inner join food j
on s.supplier_id=j.supplier_id 
where supplier_city= 'Chicago' and price > 4.0
order by j.price;
/*
Results:
SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Hsd Harper Street Deli             Chicken Soup               4.25
Foi Fontinas Italian               Apple Pie                   4.5
Hsd Harper Street Deli             Yellow Cake                 4.5
Foi Fontinas Italian               Barley Soup                4.75
Lak Lakeshore Bakery               Caprese                     5.5
Hsd Harper Street Deli             Chef Salad                 5.75
Jmd Jebston Montrose Deli          Potato Soup                6.25
Lak Lakeshore Bakery               Spinach Salad              6.25
Jmd Jebston Montrose Deli          Mushroom Pizza                8
Dpz Downtowner Pizza               Cheese Pizza                8.5
Hsd Harper Street Deli             Protein Box                   9

11 rows selected. 
*/
--*********************************************************************************
--Question 4
--4A
select last_name, first_name, dept_code, lunch_id, lunch_date 
from lunch l
inner join worker wk 
on wk.worker_id=l.worker_id
where to_char(Lunch_date, 'mm-yyyy')='05-2021' 
order by lunch_date, lunch_id;

--4B
select last_name, first_name, dept_code, l.lunch_id, lunch_date, item_number
from worker wk inner join lunch l 
on wk.worker_id = l.worker_id 
inner join lunch_item lt 
on l.lunch_id=lt.lunch_id
where to_char(Lunch_date, 'mm-yyyy')='05-2021' 
order by lunch_date, lunch_id, item_number;

--4C
select last_name, first_name, dept_code, l.lunch_id, lunch_date, item_number
from worker wk inner join lunch l 
on wk.worker_id = l.worker_id 
inner join lunch_item li 
on l.lunch_id=li.lunch_id
inner join food f
on f.supplier_id=li.supplier_id and f.product_code=li.product_code
where to_char(lunch_date, 'mm-yyyy')='05-2021' 
order by lunch_date, lunch_id, item_number;
/*
Results:
--4A
LAST_NAME            FIRST_NAME DEP   LUNCH_ID LUNCH_DAT
-------------------- ---------- --- ---------- ---------
Harney               Tyler      Tch          1 22-MAY-21
Gradle               Rita       Leg          2 22-MAY-21
Young                Taylor                  3 22-MAY-21
Sanchez              Jose       Com          4 22-MAY-21
Templeton            Angie      Acc          5 22-MAY-21
Kingman              James      Sal          6 22-MAY-21
Williams             Jodie                   7 27-MAY-21
Shreve               Dane       Exe          8 27-MAY-21
Neal                 Tom        Srv          9 27-MAY-21
Kingman              James      Sal         10 27-MAY-21
White                Cleo       Aud         11 27-MAY-21

LAST_NAME            FIRST_NAME DEP   LUNCH_ID LUNCH_DAT
-------------------- ---------- --- ---------- ---------
Sumner               Carole     Tch         12 27-MAY-21
Young                Taylor                 13 27-MAY-21

13 rows selected. 

--4B
LAST_NAME            FIRST_NAME DEP   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --- ---------- --------- -----------
Harney               Tyler      Tch          1 22-MAY-21           1
Harney               Tyler      Tch          1 22-MAY-21           2
Harney               Tyler      Tch          1 22-MAY-21           3
Gradle               Rita       Leg          2 22-MAY-21           1
Gradle               Rita       Leg          2 22-MAY-21           2
Gradle               Rita       Leg          2 22-MAY-21           3
Gradle               Rita       Leg          2 22-MAY-21           4
Young                Taylor                  3 22-MAY-21           1
Young                Taylor                  3 22-MAY-21           2
Young                Taylor                  3 22-MAY-21           3
Young                Taylor                  3 22-MAY-21           4

LAST_NAME            FIRST_NAME DEP   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --- ---------- --------- -----------
Young                Taylor                  3 22-MAY-21           5
Sanchez              Jose       Com          4 22-MAY-21           1
Sanchez              Jose       Com          4 22-MAY-21           2
Sanchez              Jose       Com          4 22-MAY-21           3
Sanchez              Jose       Com          4 22-MAY-21           4
Templeton            Angie      Acc          5 22-MAY-21           1
Templeton            Angie      Acc          5 22-MAY-21           2
Templeton            Angie      Acc          5 22-MAY-21           3
Templeton            Angie      Acc          5 22-MAY-21           4
Templeton            Angie      Acc          5 22-MAY-21           5
Kingman              James      Sal          6 22-MAY-21           1

LAST_NAME            FIRST_NAME DEP   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --- ---------- --------- -----------
Kingman              James      Sal          6 22-MAY-21           2
Kingman              James      Sal          6 22-MAY-21           3
Kingman              James      Sal          6 22-MAY-21           4
Kingman              James      Sal          6 22-MAY-21           5
Williams             Jodie                   7 27-MAY-21           1
Williams             Jodie                   7 27-MAY-21           2
Williams             Jodie                   7 27-MAY-21           3
Shreve               Dane       Exe          8 27-MAY-21           1
Shreve               Dane       Exe          8 27-MAY-21           2
Shreve               Dane       Exe          8 27-MAY-21           3
Shreve               Dane       Exe          8 27-MAY-21           4

LAST_NAME            FIRST_NAME DEP   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --- ---------- --------- -----------
Shreve               Dane       Exe          8 27-MAY-21           5
Shreve               Dane       Exe          8 27-MAY-21           6
Neal                 Tom        Srv          9 27-MAY-21           1
Neal                 Tom        Srv          9 27-MAY-21           2
Neal                 Tom        Srv          9 27-MAY-21           3
Neal                 Tom        Srv          9 27-MAY-21           4
Kingman              James      Sal         10 27-MAY-21           1
Kingman              James      Sal         10 27-MAY-21           2
Kingman              James      Sal         10 27-MAY-21           3
Kingman              James      Sal         10 27-MAY-21           4
White                Cleo       Aud         11 27-MAY-21           1

LAST_NAME            FIRST_NAME DEP   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --- ---------- --------- -----------
White                Cleo       Aud         11 27-MAY-21           2
White                Cleo       Aud         11 27-MAY-21           3
White                Cleo       Aud         11 27-MAY-21           4
Sumner               Carole     Tch         12 27-MAY-21           1
Sumner               Carole     Tch         12 27-MAY-21           2
Sumner               Carole     Tch         12 27-MAY-21           3
Sumner               Carole     Tch         12 27-MAY-21           4
Sumner               Carole     Tch         12 27-MAY-21           5
Young                Taylor                 13 27-MAY-21           1
Young                Taylor                 13 27-MAY-21           2
Young                Taylor                 13 27-MAY-21           3

LAST_NAME            FIRST_NAME DEP   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --- ---------- --------- -----------
Young                Taylor                 13 27-MAY-21           4
Young                Taylor                 13 27-MAY-21           5

57 rows selected.

--4C
LAST_NAME            FIRST_NAME DEP   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --- ---------- --------- -----------
Harney               Tyler      Tch          1 22-MAY-21           1
Harney               Tyler      Tch          1 22-MAY-21           2
Harney               Tyler      Tch          1 22-MAY-21           3
Gradle               Rita       Leg          2 22-MAY-21           1
Gradle               Rita       Leg          2 22-MAY-21           2
Gradle               Rita       Leg          2 22-MAY-21           3
Gradle               Rita       Leg          2 22-MAY-21           4
Young                Taylor                  3 22-MAY-21           1
Young                Taylor                  3 22-MAY-21           2
Young                Taylor                  3 22-MAY-21           3
Young                Taylor                  3 22-MAY-21           4

LAST_NAME            FIRST_NAME DEP   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --- ---------- --------- -----------
Young                Taylor                  3 22-MAY-21           5
Sanchez              Jose       Com          4 22-MAY-21           1
Sanchez              Jose       Com          4 22-MAY-21           2
Sanchez              Jose       Com          4 22-MAY-21           3
Sanchez              Jose       Com          4 22-MAY-21           4
Templeton            Angie      Acc          5 22-MAY-21           1
Templeton            Angie      Acc          5 22-MAY-21           2
Templeton            Angie      Acc          5 22-MAY-21           3
Templeton            Angie      Acc          5 22-MAY-21           4
Templeton            Angie      Acc          5 22-MAY-21           5
Kingman              James      Sal          6 22-MAY-21           1

LAST_NAME            FIRST_NAME DEP   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --- ---------- --------- -----------
Kingman              James      Sal          6 22-MAY-21           2
Kingman              James      Sal          6 22-MAY-21           3
Kingman              James      Sal          6 22-MAY-21           4
Kingman              James      Sal          6 22-MAY-21           5
Williams             Jodie                   7 27-MAY-21           1
Williams             Jodie                   7 27-MAY-21           2
Williams             Jodie                   7 27-MAY-21           3
Shreve               Dane       Exe          8 27-MAY-21           1
Shreve               Dane       Exe          8 27-MAY-21           2
Shreve               Dane       Exe          8 27-MAY-21           3
Shreve               Dane       Exe          8 27-MAY-21           4

LAST_NAME            FIRST_NAME DEP   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --- ---------- --------- -----------
Shreve               Dane       Exe          8 27-MAY-21           5
Shreve               Dane       Exe          8 27-MAY-21           6
Neal                 Tom        Srv          9 27-MAY-21           1
Neal                 Tom        Srv          9 27-MAY-21           2
Neal                 Tom        Srv          9 27-MAY-21           3
Neal                 Tom        Srv          9 27-MAY-21           4
Kingman              James      Sal         10 27-MAY-21           1
Kingman              James      Sal         10 27-MAY-21           2
Kingman              James      Sal         10 27-MAY-21           3
Kingman              James      Sal         10 27-MAY-21           4
White                Cleo       Aud         11 27-MAY-21           1

LAST_NAME            FIRST_NAME DEP   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --- ---------- --------- -----------
White                Cleo       Aud         11 27-MAY-21           2
White                Cleo       Aud         11 27-MAY-21           3
White                Cleo       Aud         11 27-MAY-21           4
Sumner               Carole     Tch         12 27-MAY-21           1
Sumner               Carole     Tch         12 27-MAY-21           2
Sumner               Carole     Tch         12 27-MAY-21           3
Sumner               Carole     Tch         12 27-MAY-21           4
Sumner               Carole     Tch         12 27-MAY-21           5
Young                Taylor                 13 27-MAY-21           1
Young                Taylor                 13 27-MAY-21           2
Young                Taylor                 13 27-MAY-21           3

LAST_NAME            FIRST_NAME DEP   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --- ---------- --------- -----------
Young                Taylor                 13 27-MAY-21           4
Young                Taylor                 13 27-MAY-21           5

57 rows selected. 
*/


*********************************************************************************
--Question 5
col total_price format $9999.99
select lt.lunch_id,lunch_date, COUNT(f.menu_item) AS COUNT, sum(f.price) as total_price
from food f 
inner join lunch_item lt
on f.supplier_id=lt.supplier_id and f.product_code=lt.product_code
inner join lunch u
on lt.lunch_id=u.lunch_id
where lunch_date between '16-May-21' AND' 31-May-21'
group by lt.lunch_id, lunch_date;

/*
Results:
--5
LUNCH_ID LUNCH_DAT      COUNT TOTAL_PRICE
---------- --------- ---------- -----------
         5 22-MAY-21          5    $22.25  
        13 27-MAY-21          5    $21.10  
         1 22-MAY-21          3    $12.25  
        12 27-MAY-21          5    $24.95  
         8 27-MAY-21          6    $24.40  
        10 27-MAY-21          4    $14.45  
        11 27-MAY-21          4    $15.20  
         3 22-MAY-21          5    $23.20  
         4 22-MAY-21          4    $19.40  
         2 22-MAY-21          4    $16.25  
         6 22-MAY-21          5    $23.10  

  LUNCH_ID LUNCH_DAT      COUNT TOTAL_PRICE
---------- --------- ---------- -----------
         7 27-MAY-21          3    $17.80  
         9 27-MAY-21          4    $19.40  

13 rows selected. 
*/
--*********************************************************************************
--Question 6
--6A
select to_char(lunch_date, 'fmMonth-YYYY') as month, count(lunch_id) as lunch_count 
from lunch l inner join worker w
on l.worker_id = w.worker_id
where dept_code is null and hire_date between'01-Dec-12' AND '01-Apr-20'
group by to_char(lunch_date, 'fmMonth-YYYY')
order by month;

--6B
select to_char(lunch_date, 'fmMonth-YYYY') as month, count(lunch_id) as lunch_count 
from lunch l inner join worker w
on l.worker_id = w.worker_id
where dept_code is null and hire_date between'01-Dec-12' AND '01-Apr-20'
group by to_char(lunch_date, 'fmMonth-YYYY')
having count(lunch_id)< 3
order by month;

/*
Results:
--6A
MONTH          LUNCH_COUNT
-------------- -----------
June-2021                3
May-2021                 1

--6B

MONTH          LUNCH_COUNT
-------------- -----------
May-2021                 1

*/


