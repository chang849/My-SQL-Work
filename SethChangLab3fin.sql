/*
Seth Chang 
CNIT 272 Fall 2022
Lab Time: Thurs 1:30 PM - 5:20 PM
Completed time and duration: 09/21/2022 3:25 AM / 1 hours
*/

--*********************************************************************************
--Question 1

select worker_id, last_name, dept_code, credit_limit from worker where dept_code = 'Fin' or dept_code = 'Tch' or credit_limit = 20 ;

/*

Results:
WOR LAST_NAME            DEP CREDIT_LIMIT
--- -------------------- --- ------------
556 Sumner               Tch           35
565 Cross                Tch           25
569 Reynolds             Fin           28
572 Johnson                            20
575 Smith                Fin           20
576 Jones                Tch           25
577 Martin               Sal           20
578 Rayner               Tch           25
584 Harney               Tch           27

9 rows selected. 

Explanation: Explain if the question ask for an explanation

*/


--*********************************************************************************
--Question 2
select worker_id, last_name, dept_code, credit_limit from worker where (dept_code = 'Fin' or dept_code = 'Sal' or dept_code = 'Tch') and credit_limit = 20
Order By last_name ASC;

/*
Results:
WOR LAST_NAME            DEP CREDIT_LIMIT
--- -------------------- --- ------------
577 Martin               Sal           20
575 Smith                Fin           20

*/


--*********************************************************************************
--Question 3

select dept_code from worker;
select dept_code from department;
/*
Results:
DEP
---
Exe
Tch
Leg
Hmn
Srv
Aud

Com
Acc
Sal
Tch

DEP
---
Hmn
Leg

Fin
Aud
Hmn

Aud

Fin
Tch

DEP
---
Sal
Tch

Acc
Srv
Acc

Tch
Srv

Leg

DEP
---


34 rows selected. 


DEP
---
Acc
Aud
Com
Eng
Exe
Fac
Fin
Hmn
Leg
Mkt
Pur

DEP
---
Sal
Shp
Srv
Tch

15 rows selected. 
*/
Explanation: No, the results are not the same, the worker and department are different because they are different categories.
--*********************************************************************************
--Question 4

select distinct dept_code from worker;

/*
Results:
DEP
---
Aud
Sal
Leg
Hmn
Acc
Tch

Fin
Exe
Com
Srv

11 rows selected. 
Explantion: No, they aren't the same because some department do not have any workers.
*/


--*********************************************************************************
--Question 5
select supplier_name from food_supplier where supplier_name like '%S%' or supplier_name like '%s%';

/*
Results:
SUPPLIER_NAME                 
------------------------------
Harper Street Deli
Crystal Market
Fontinas Italian
Framer and Samson
Justin's Deli at 652
Jebston Montrose Deli
Rosemont Bakery
Lucias Sub Shop
Great Lakes Station
Giovana and Sons
Blue Sky Deli

SUPPLIER_NAME                 
------------------------------
Lakeshore Bakery
Fresh Daily Vegetables

13 rows selected. 
*/

--*********************************************************************************
--Question 6
select worker_id, last_name, hire_date, dept_code 
from worker 
where hire_date<'01-JAN-13' or hire_date> '31-DEC-19';

2.1
select worker_id,last_name,hire_date,dept_code
from worker
where hire_date>='01-JAN-15' and hire_date<='31-DEC-19';

2.2
select worker_id,last_name,hire_date,dept_code
from worker
where hire_date between'01-JAN-15' and '31-DEC-19';
/*
Results:WOR LAST_NAME            HIRE_DATE DEP
--- -------------------- --------- ---
575 Smith                19-APR-12 Fin
578 Rayner               07-OCT-11 Tch
580 Gonzalez             19-DEC-11 Acc
581 Walsh                21-APR-07 Srv
582 Templeton            19-JUN-07 Acc
583 Montre               07-MAR-12    
588 Walsh                22-MAR-21    

18 rows selected. 

WOR LAST_NAME            HIRE_DATE DEP
--- -------------------- --------- ---
556 Sumner               17-JUL-16 Tch
558 Campbell             24-MAY-18 Hmn
566 Tevona               21-AUG-19 Hmn
570 Trance               19-JUN-18 Aud
576 Jones                15-MAR-19 Tch
577 Martin               19-NOV-19 Sal
579 Rivera               13-NOV-15    
584 Harney               07-MAR-18 Tch
585 Frank                22-JUL-16 Srv
586 Williams             16-MAR-19    
587 Alveral              22-MAY-18 Leg

11 rows selected. 
*/ 


--*********************************************************************************
--Question 7
select worker_id, last_name, dept_code, (credit_limit*1.37) as new_limit
from worker;

/*
Results:
WOR LAST_NAME            DEP  NEW_LIMIT
--- -------------------- --- ----------
555 Shreve               Exe      61.65
556 Sumner               Tch      47.95
557 Gradle               Leg      43.84
558 Campbell             Hmn      38.36
559 Neal                 Srv      35.62
560 Ridgeman             Aud      30.14
561 Bensen                        34.25
562 Sanchez              Com      30.14
563 Vought               Acc       41.1
564 Kingman              Sal      45.21
565 Cross                Tch      34.25

WOR LAST_NAME            DEP  NEW_LIMIT
--- -------------------- --- ----------
566 Tevona               Hmn      28.77
567 Richards             Leg      30.14
568 Young                         34.25
569 Reynolds             Fin      38.36
570 Trance               Aud      34.25
571 Harris               Hmn      23.29
572 Johnson                        27.4
573 White                Aud      30.14
574 Irwin                         43.84
575 Smith                Fin       27.4
576 Jones                Tch      34.25

WOR LAST_NAME            DEP  NEW_LIMIT
--- -------------------- --- ----------
577 Martin               Sal       27.4
578 Rayner               Tch      34.25
579 Rivera                        31.51
580 Gonzalez             Acc      24.66
581 Walsh                Srv      45.21
582 Templeton            Acc      32.88
583 Montre                        34.25
584 Harney               Tch      36.99
585 Frank                Srv       41.1
586 Williams                      34.25
587 Alveral              Leg      45.21

WOR LAST_NAME            DEP  NEW_LIMIT
--- -------------------- --- ----------
588 Walsh                         36.99

34 rows selected. 

*/


--*********************************************************************************
--Question 8
select worker_id, first_name || ' ' || last_name as full_name, city
from worker
where city not in ('Oak Brook', 'Evanston', 'Aurora', 'Chicago');

/*
Results:
WOR FULL_NAME                       CITY                          
--- ------------------------------- ------------------------------
556 Carole Sumner                   Hinsdale                      
557 Rita Gradle                     Wilmette                      
559 Tom Neal                        Hinsdale                      
561 Maria Bensen                    Wilmette                      
562 Jose Sanchez                    Glencoe                       
568 Taylor Young                    Wilmette                      
572 Chase Johnson                   Hinsdale                      
575 Shawn Smith                     Glencoe                       
576 Keyanna Jones                   Hinsdale                      
577 Carey Martin                    Wilmette                      
582 Angie Templeton                 Hinsdale                      

WOR FULL_NAME                       CITY                          
--- ------------------------------- ------------------------------
586 Jodie Williams                  Glencoe                       

12 rows selected. 
*/


