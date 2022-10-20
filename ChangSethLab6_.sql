/*
Seth Chang 
CNIT 272 Spring 2022
Lab Time: Thurs 1:30 PM - 3:20 PM
*/

--*********************************************************************************
--Question 1
--1a)
select fs.supplier_id,supplier_name, description, price_upcharge, price
from food_supplier fs
inner join food f 
on fs.supplier_id=f.supplier_id
Order by supplier_name;
--1b)

select fs.supplier_id,supplier_name, description, price_upcharge, price
from food_supplier fs
left join food f 
on fs.supplier_id=f.supplier_id
WHERE f.description like '%Cheese%'
Order by supplier_name;

--1c)
select fs.supplier_id,supplier_name, description, price_upcharge, price
from food_supplier fs
left join food f 
on fs.supplier_id=f.supplier_id
WHERE description like '%Cheese%' and price_upcharge is not NULL
Order by supplier_name;

/*
Results:
--1A
SUP SUPPLIER_NAME                  DESCRIPTION          PRICE_UPCHARGE      PRICE
--- ------------------------------ -------------------- -------------- ----------
Ard Arnoldo Deli                   PB Cookie                                 1.25
Ard Arnoldo Deli                   Chicken Avocado Wrap                      5.25
Ard Arnoldo Deli                   Veggie Pizza                              6.25
Blu Blue Sky Deli                  Turkey Club                      .5        7.5
Blu Blue Sky Deli                  Chips                                      2.8
Crm Crystal Market                 Ham Melt                         .3        7.2
Crm Crystal Market                 Grilled Cheese                   .4       5.25
Crm Crystal Market                 Philly Melt                      .7        8.6
Crm Crystal Market                 Wheat Bagel                     .25          4
Dpz Downtowner Pizza               Dinner Roll                     .25          1
Dpz Downtowner Pizza               Cheese Pizza                               8.5

SUP SUPPLIER_NAME                  DESCRIPTION          PRICE_UPCHARGE      PRICE
--- ------------------------------ -------------------- -------------- ----------
Dpz Downtowner Pizza               Cheese Sauce                               .75
Foi Fontinas Italian               Apple Pie                                  4.5
Foi Fontinas Italian               Barley Soup                      .2       4.75
Foi Fontinas Italian               French Fries                               1.5
Foi Fontinas Italian               Broccoli Salad                  .05          4
Gls Great Lakes Station            Breadstick                                1.25
Gls Great Lakes Station            Mango Smoothie                            4.95
Gls Great Lakes Station            Sugar Cookie                     .5        3.5
Hsd Harper Street Deli             Yellow Cake                      .5        4.5
Hsd Harper Street Deli             Chicken Soup                              4.25
Hsd Harper Street Deli             Chef Salad                      .25       5.75

SUP SUPPLIER_NAME                  DESCRIPTION          PRICE_UPCHARGE      PRICE
--- ------------------------------ -------------------- -------------- ----------
Hsd Harper Street Deli             Protein Box                      .5          9
Jmd Jebston Montrose Deli          Potato Soup                               6.25
Jmd Jebston Montrose Deli          Mushroom Pizza                  .15          8
Jmd Jebston Montrose Deli          Cole Slaw                        .5        1.5
Jmd Jebston Montrose Deli          Iced Tea                        .15       2.85
Jd6 Justin's Deli at 652           Brownie                         .25       3.45
Jd6 Justin's Deli at 652           Soda                            .25       2.25
Jd6 Justin's Deli at 652           Coffee                          .15       1.55
Lak Lakeshore Bakery               Caprese                          .5        5.5
Lak Lakeshore Bakery               Cheese Stick                              2.35
Lak Lakeshore Bakery               Spinach Salad                             6.25

SUP SUPPLIER_NAME                  DESCRIPTION          PRICE_UPCHARGE      PRICE
--- ------------------------------ -------------------- -------------- ----------
Lss Lucias Sub Shop                Veggie Soup                               4.85
Lss Lucias Sub Shop                Grilled Cheese                            5.95

5 rows selected. 

--1B

SUP SUPPLIER_NAME                  DESCRIPTION          PRICE_UPCHARGE      PRICE
--- ------------------------------ -------------------- -------------- ----------
Crm Crystal Market                 Grilled Cheese                   .4       5.25
Dpz Downtowner Pizza               Cheese Pizza                               8.5
Dpz Downtowner Pizza               Cheese Sauce                               .75
Lak Lakeshore Bakery               Cheese Stick                              2.35
Lss Lucias Sub Shop                Grilled Cheese                            5.95

--1C
SUP SUPPLIER_NAME                  DESCRIPTION          PRICE_UPCHARGE      PRICE
--- ------------------------------ -------------------- -------------- ----------
Crm Crystal Market                 Grilled Cheese                   .4       5.25
*/


--*********************************************************************************
--Question 2
--2A
select f.supplier_id, description, sum(quantity)
from food f left join lunch_item li
on f.supplier_id = li.supplier_id and f.product_code=li.product_code
group by f.supplier_id, description
order by description;

--2B
select f.supplier_id, description, sum(quantity)
from food f inner join lunch_item li
on f.supplier_id = li.supplier_id and f.product_code=li.product_code
group by f.supplier_id, description
order by description;

/*
Results:
--2A

SUP DESCRIPTION          SUM(QUANTITY)
--- -------------------- -------------
Foi Apple Pie                        3
Foi Barley Soup                      4
Gls Breadstick                       1
Foi Broccoli Salad                   1
Jd6 Brownie                         10
Lak Caprese                          2
Dpz Cheese Pizza                     4
Dpz Cheese Sauce                     2
Lak Cheese Stick                     5
Hsd Chef Salad                      14
Ard Chicken Avocado Wrap              

SUP DESCRIPTION          SUM(QUANTITY)
--- -------------------- -------------
Hsd Chicken Soup                    13
Blu Chips                            2
Jd6 Coffee                           6
Jmd Cole Slaw                         
Dpz Dinner Roll                      8
Foi French Fries                    11
Crm Grilled Cheese                   7
Lss Grilled Cheese                   4
Crm Ham Melt                        10
Jmd Iced Tea                        10
Gls Mango Smoothie                    

SUP DESCRIPTION          SUM(QUANTITY)
--- -------------------- -------------
Jmd Mushroom Pizza                   3
Ard PB Cookie                         
Crm Philly Melt                     12
Jmd Potato Soup                      1
Hsd Protein Box                      2
Jd6 Soda                            25
Lak Spinach Salad                    2
Gls Sugar Cookie                     9
Blu Turkey Club                      1
Ard Veggie Pizza                     4
Lss Veggie Soup                      2

SUP DESCRIPTION          SUM(QUANTITY)
--- -------------------- -------------
Crm Wheat Bagel                      1
Hsd Yellow Cake                      6

35 rows selected. 

--2B
Explaination: The table results are different because when using the left join PB cookie with the id of Ard exists but does
not have a value for quantity. Using the inner join your results would not product a row with the id of Ard and a description of PB Cookie. 
SUP DESCRIPTION          SUM(QUANTITY)
--- -------------------- -------------
Foi Apple Pie                        3
Foi Barley Soup                      4
Gls Breadstick                       1
Foi Broccoli Salad                   1
Jd6 Brownie                         10
Lak Caprese                          2
Dpz Cheese Pizza                     4
Dpz Cheese Sauce                     2
Lak Cheese Stick                     5
Hsd Chef Salad                      14
Hsd Chicken Soup                    13

SUP DESCRIPTION          SUM(QUANTITY)
--- -------------------- -------------
Blu Chips                            2
Jd6 Coffee                           6
Dpz Dinner Roll                      8
Foi French Fries                    11
Crm Grilled Cheese                   7
Lss Grilled Cheese                   4
Crm Ham Melt                        10
Jmd Iced Tea                        10
Jmd Mushroom Pizza                   3
Crm Philly Melt                     12
Jmd Potato Soup                      1

SUP DESCRIPTION          SUM(QUANTITY)
--- -------------------- -------------
Hsd Protein Box                      2
Jd6 Soda                            25
Lak Spinach Salad                    2
Gls Sugar Cookie                     9
Blu Turkey Club                      1
Ard Veggie Pizza                     4
Lss Veggie Soup                      2
Crm Wheat Bagel                      1
Hsd Yellow Cake                      6

31 rows selected. 
*/


--*********************************************************************************

--Question 3
--3A
set linespace 200;
select worker_id, city, d.dept_code, department_name
from department d
inner join worker w
on d.dept_code=w.dept_code
order by dept_code;
--3B
set linespace 200;
select worker_id, city, d.dept_code, department_name
from department d
right join worker w
on d.dept_code=w.dept_code
order by worker_id; 

--3C
select worker_id, city, d.dept_code, department_name
from worker w
right join department d
on d.dept_code=w.dept_code
order by dept_code; 

--3D
select dept_code, department_name
from department 
where dept_code 
not in(select dept_code from worker where dept_code is not null);

/*
Results:
--3A

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
580                                Acc Accounting                    
582 Hinsdale                       Acc Accounting                    
563 Oak Brook                      Acc Accounting                    
570 Aurora                         Aud Auditing                      
573                                Aud Auditing                      
560 Chicago                        Aud Auditing                      
562 Glencoe                        Com Compliance                    
555 Aurora                         Exe Executive                     
575 Glencoe                        Fin Finance                       
569 Evanston                       Fin Finance                       
558 Oak Brook                      Hmn Human Resources               

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
566 Oak Brook                      Hmn Human Resources               
571 Chicago                        Hmn Human Resources               
567 Oak Brook                      Leg Legal                         
557 Wilmette                       Leg Legal                         
587 Oak Brook                      Leg Legal                         
577 Wilmette                       Sal Sales                         
564 Chicago                        Sal Sales                         
559 Hinsdale                       Srv Service                       
585 Evanston                       Srv Service                       
581 Oak Brook                      Srv Service                       
556 Hinsdale                       Tch Technology                    

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
565                                Tch Technology                    
584 Chicago                        Tch Technology                    
576 Hinsdale                       Tch Technology                    
578 Evanston                       Tch Technology                    

26 rows selected. 

--3B

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
555 Aurora                         Exe Executive                     
556 Hinsdale                       Tch Technology                    
557 Wilmette                       Leg Legal                         
558 Oak Brook                      Hmn Human Resources               
559 Hinsdale                       Srv Service                       
560 Chicago                        Aud Auditing                      
561 Wilmette                                                         
562 Glencoe                        Com Compliance                    
563 Oak Brook                      Acc Accounting                    
564 Chicago                        Sal Sales                         
565                                Tch Technology                    

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
566 Oak Brook                      Hmn Human Resources               
567 Oak Brook                      Leg Legal                         
568 Wilmette                                                         
569 Evanston                       Fin Finance                       
570 Aurora                         Aud Auditing                      
571 Chicago                        Hmn Human Resources               
572 Hinsdale                                                         
573                                Aud Auditing                      
574                                                                  
575 Glencoe                        Fin Finance                       
576 Hinsdale                       Tch Technology                    

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
577 Wilmette                       Sal Sales                         
578 Evanston                       Tch Technology                    
579                                                                  
580                                Acc Accounting                    
581 Oak Brook                      Srv Service                       
582 Hinsdale                       Acc Accounting                    
583 Aurora                                                           
584 Chicago                        Tch Technology                    
585 Evanston                       Srv Service                       
586 Glencoe                                                          
587 Oak Brook                      Leg Legal                         

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
588 Chicago                                                          

34 rows selected. 

--3C

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
580                                Acc Accounting                    
582 Hinsdale                       Acc Accounting                    
563 Oak Brook                      Acc Accounting                    
570 Aurora                         Aud Auditing                      
573                                Aud Auditing                      
560 Chicago                        Aud Auditing                      
562 Glencoe                        Com Compliance                    
                                   Eng Engineering                   
555 Aurora                         Exe Executive                     
                                   Fac Facilities                    
575 Glencoe                        Fin Finance                       

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
569 Evanston                       Fin Finance                       
558 Oak Brook                      Hmn Human Resources               
566 Oak Brook                      Hmn Human Resources               
571 Chicago                        Hmn Human Resources               
567 Oak Brook                      Leg Legal                         
557 Wilmette                       Leg Legal                         
587 Oak Brook                      Leg Legal                         
                                   Mkt Marketing                     
                                   Pur Purchasing                    
577 Wilmette                       Sal Sales                         
564 Chicago                        Sal Sales                         

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
                                   Shp Shipping                      
559 Hinsdale                       Srv Service                       
585 Evanston                       Srv Service                       
581 Oak Brook                      Srv Service                       
556 Hinsdale                       Tch Technology                    
565                                Tch Technology                    
584 Chicago                        Tch Technology                    
576 Hinsdale                       Tch Technology                    
578 Evanston                       Tch Technology                    

31 rows selected. 

--3D

DEP DEPARTMENT_NAME               
--- ------------------------------
Eng Engineering                   
Fac Facilities                    
Mkt Marketing                     
Pur Purchasing                    
Shp Shipping  

*/

--*********************************************************************************
--Question 4
--4A
select supplier_city, supplier_name
from food_supplier
where supplier_city not in('Skokie','Oak Brook', 'Chicago')
union
select city,first_name || ' ' || last_name as full_name
from worker
where city not in('Skokie','Oak Brook', 'Chicago')
order by supplier_name;

/*
Results:
--4

SUPPLIER_CITY                  SUPPLIER_NAME                  
------------------------------ -------------------------------
Hinsdale                       Angie Templeton                
Glencoe                        Arnoldo Deli                   
Aurora                         Avery Trance                   
Evanston                       Blair Reynolds                 
Wilmette                       Carey Martin                   
Hinsdale                       Carole Sumner                  
Hinsdale                       Chase Johnson                  
Hinsdale                       Crystal Market                 
Aurora                         Dane Shreve                    
Orland Park                    Framer and Samson              
Aurora                         Fresh Daily Vegetables         

SUPPLIER_CITY                  SUPPLIER_NAME                  
------------------------------ -------------------------------
Wilmette                       Great Lakes Station            
Hinsdale                       Harold Bakery                  
Glencoe                        Jodie Williams                 
Glencoe                        Jose Sanchez                   
Evanston                       Katelynn Rayner                
Hinsdale                       Keyanna Jones                  
Aurora                         Lucias Sub Shop                
Wilmette                       Maria Bensen                   
Wilmette                       Rita Gradle                    
Glencoe                        Rosemont Bakery                
Evanston                       Sam Frank                      

SUPPLIER_CITY                  SUPPLIER_NAME                  
------------------------------ -------------------------------
Glencoe                        Shawn Smith                    
Wilmette                       Taylor Young                   
Hinsdale                       Tom Neal                       
Aurora                         Tonya Montre                   

26 rows selected. 

*/

--*********************************************************************************
--Question 5
select supplier_city 
from food_supplier 
intersect  
select city
from worker;

/*
Results:

SUPPLIER_CITY                 
------------------------------
Aurora
Chicago
Glencoe
Hinsdale
Oak Brook
Wilmette

6 rows selected. 
  
*/

--*********************************************************************************
--Question 6
--6A
select distinct city from worker;
--6B
select distinct supplier_city from food_supplier;
--6C
select distinct city from worker
minus
select distinct supplier_city from food_supplier;
/*
Results:
--6A

CITY                          
------------------------------
Aurora
Oak Brook
Chicago

Wilmette
Evanston
Hinsdale
Glencoe

8 rows selected. 
--6B

SUPPLIER_CITY                 
------------------------------
Oak Brook
Aurora
Orland Park
Chicago
Wilmette
Glencoe
Hinsdale

7 rows selected. 
--6C

CITY                          
------------------------------
Evanston

*/
