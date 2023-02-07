--visit Replit site: https://replit.com/@mynattha/SQLhomeworkbatch6#main.sql
--Restaurant Owners
--5 Tables
--1x Fact, 4x Dimension
--add foreign key
--write SQL 3 queries analyze data
--1x subquery/ with

--SQLite command
--column, list, command
.mode column
.header on

--Fact
CREATE TABLE transactions (
  order_id INT PRIMARY KEY,
  order_ref INT,
  order_date date,
  order_type_id INT  NOT NULL,
  branch_id INT NOT NULL,
  customer_name TEXT,
  employee_id INT NOT NULL,
  menu_id TEXT NOT NULL,
  quantity INT,
  FOREIGN KEY(order_type_id) REFERENCES order_type(order_type_id)
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id)
  FOREIGN KEY(employee_id) REFERENCES employee(employee_id)
  FOREIGN KEY(menu_id) REFERENCES menu(menu_id)
);


INSERT INTO transactions VALUES
 (1, 1, '2023-12-01', 101, 1, 'Katie', 8, 'A1',  2),
 (2, 2, '2023-12-01', 201, 1, 'Ben', 11, 'B3',  3),
 (3, 2, '2023-12-01', 201, 1, 'Ben', 11, 'C5',  1),
 (4, 4, '2023-12-01', 302, 1, 'Mook', 20, 'C6',  2),
 (5, 5, '2023-12-01', 302, 1, 'Emma', 20, 'C18',  3),
 (6, 6, '2023-12-01', 301, 1, 'Kik', 8, 'A6',  2),
 (7, 6, '2023-12-01', 301, 1, 'Kik', 8, 'A4',  2),
 (8, 8, '2023-12-01', 101, 1, 'May', 8, 'C10',  1),
 
 (9, 9, '2023-12-01', 101, 2, 'Kim', 2, 'A3',  2),
 (10, 10, '2023-12-01', 101, 2, 'Tom', 2, 'B2',  1),
 (11, 11, '2023-12-01', 301, 2, 'Gina', 4, 'C15',  1),
 (12, 12, '2023-12-01', 201, 2, 'Pond', 4, 'A7',  2),
 (13, 13, '2023-12-01', 101, 2, 'Piggy', 10, 'A5',  1),
 (14, 13, '2023-12-01', 101, 2, 'Piggy', 10, 'C22',  1),
 (15, 15, '2023-12-01', 304, 2, 'Ploy', 2, 'A4',  2),
 (16, 15, '2023-12-01', 304, 2, 'Ploy', 2, 'A4',  2),
 (17, 17, '2023-12-01', 101, 2, 'Amber', 4, 'C10',  1),
 (18, 18, '2023-12-01', 302, 2, 'Clark', 4, 'C15',  3),
 
 (19, 19, '2023-12-01', 101, 3, 'Penny', 5, 'A7',  2),
 (20, 20, '2023-12-01', 101, 3, 'Ted', 5, 'B2',  2),
 (21, 21, '2023-12-01', 201, 3, 'Sofia', 5, 'C8',  3),
 (22, 21, '2023-12-01', 201, 3, 'Sofia', 5, 'A13',  1),
 (23, 23, '2023-12-01', 101, 3, 'Nate', 12, 'A5',  4),
 (24, 24, '2023-12-01', 301, 3, 'Mim', 12, 'B5',  2),
 (25, 25, '2023-12-01', 304, 3, 'Kelly', 12, 'A4',  3),
 (26, 26, '2023-12-01', 304, 3, 'Pat', 5, 'A6',  1),
 (27, 27, '2023-12-01', 303, 3, 'Nat', 12, 'C10',  1),
 (28, 28, '2023-12-01', 302, 3, 'Jerry', 5, 'C15',  3);
 
 

--Dimension
--1.1 Order type
CREATE TABLE order_type (
  order_type_id INT PRIMARY KEY,
  order_type_des TEXT NOT NULL, --take away, delivery, dine in
  order_sub_type_des TEXT --delivery via grab, lineman, robinhood, phone
);

INSERT INTO order_type VALUES
 (101 ,'Take away' ,'-'),
 (201 ,'Dine in', '-'),
 (301 ,'Delivery', 'Grab'),
 (302 ,'Delivery', 'lineman'),
 (303 ,'Delivery', 'Robinhood'),
 (304 ,'Delivery', 'Phone');


--1.2 Branch
CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name TEXT NOT NULL,
  phone_number TEXT,
  manager_id INT
);


INSERT INTO branch VALUES
  (1, 'Central Rama-3', '022-351-234', 1),
  (2, 'Paragon', '022-451-457', 2),
  (3, 'Central Bangna', '025-551-453', 3);

  

--1.3 Employee
CREATE TABLE employee (
  employee_id INT PRIMARY KEY,
  employee_name TEXT NOT NULL,
  gender TEXT,
  age REAL,
  position TEXT,
  branch_id INT,
  FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);


INSERT INTO employee VALUES
  (1, 'Alice', 'F', 35, 'Manager', 1),
  (2, 'Brandon', 'M', 27, 'Server', 2),
  (3, 'Ken', 'M', 30, 'Barista', 1),
  (4, 'Daisy', 'F', 23, 'Server', 2),
  (5, 'Mint', 'F', 23, 'Server', 3),
  (6, 'Sarah', 'F', 28, 'Manager', 2),
  (7, 'Billy', 'M', 24, 'Barista', 2),
  (8, 'Mic', 'M', 30, 'Server', 1),
  (9, 'Max', 'M', 31, 'Manager', 3),
  (10, 'Katie', 'F', 34, 'Server', 2),
  (11, 'Dave', 'M', 38, 'Server', 1),
  (12, 'Gia', 'F', 29, 'Server', 3),
  (13, 'Gift', 'F', 27, 'Barista', 3),
  (14, 'Ben', 'M', 28, 'ฺฺBaker', 1),
  (15, 'Patrick', 'M', 36, 'Baker', 2),
  (16, 'Pim', 'F', 33, 'Dish washer', 1),
  (17, 'Bible', 'F', 29, 'Dish washer', 2),
  (18, 'Harry', 'M', 27, 'Dish washer', 3),
  (19, 'Jenny', 'F', 25, 'Baker', 3),
  (20, 'William', 'M', 32, 'Server', 1);
  

--1.4 Menu
CREATE TABLE menu (
  menu_id TEXT PRIMARY KEY,
  menu_name TEXT NOT NULL,
  menu_type TEXT,
  price REAL
);


INSERT INTO menu VALUES
   ('A1', 'Banana cake with cream cheese', 'Cake', 75),
   ('A2', 'Apple and strawberry crumble', 'Cake', 85),
   ('A3', 'Chocolate coconut cake', 'Cake', 90),
   ('A4', 'Flourless orange cake', 'Cake', 80),
   ('A5', 'Hummingbird cake', 'Cake', 75),
   ('A6', 'Strawberry cheesecake', 'Cake', 85),
   ('A7', 'White chocolate and raspberry', 'Cake', 85),
   ('B1', 'Chocolate', 'Ice Cream', 75),
   ('B2', 'Vanilla', 'Ice Cream', 75),
   ('B3', 'Strawberry', 'Ice Cream', 75),
   ('B4', 'Chocolate chip', 'Ice Cream', 75),
   ('B5', 'Coffee', 'Ice Cream', 75),
   ('B6', 'Salted caramel', 'Ice Cream', 75),
   ('B7', 'Raspberry ripple', 'Ice Cream', 75),
   ('B8', 'Cotton candy', 'Ice Cream', 75),
   ('B9', 'Matcha green tea', 'Ice Cream', 75),
   ('B10', 'Rum raisin', 'Ice Cream', 75), 
   ('C1', 'Americano(hot)', 'Beverage', 70),
   ('C2', 'Cappucino(hot)', 'Beverage', 70),
   ('C3', 'Espresso(hot)', 'Beverage', 70),
   ('C4', 'Latte(hot)', 'Beverage', 70),
   ('C5', 'Mocha(hot)', 'Beverage', 70),
   ('C6', 'Cocoa(hot)', 'Beverage', 70),
   ('C7', 'Black tea(hot)', 'Beverage', 70),
   ('C8', 'Green tea(hot)', 'Beverage', 70),
   ('C9', 'Oolong tea(hot)', 'Beverage', 70),
   ('C10', 'Thai milk tea(hot)', 'Beverage', 70), 
   ('C11', 'Green milk tea(hot)', 'Beverage', 70), 
   ('C12', 'Hojicha milk tea(hot)', 'Beverage', 70),
   ('C13', 'Matcha milk tea(hot)', 'Beverage', 70), 
   ('C14', 'Americano(cold)', 'Beverage', 80),
   ('C15', 'Cappucino(cold)', 'Beverage', 80),
   ('C16', 'Espresso(cold)', 'Beverage', 80),
   ('C17', 'Latte(cold)', 'Beverage', 80),
   ('C18', 'Mocha(cold)', 'Beverage', 80),
   ('C19', 'Cocoa(cold)', 'Beverage', 80),
   ('C20', 'Black tea(cold)', 'Beverage', 80),
   ('C21', 'Green tea(cold)', 'Beverage', 80),
   ('C22', 'Oolong tea(cold)', 'Beverage', 80),
   ('C23', 'Thai milk tea(cold)', 'Beverage', 80), 
   ('C24', 'Green milk tea(cold)', 'Beverage', 80), 
   ('C25', 'Hojicha milk tea(cold)', 'Beverage', 80),
   ('C26', 'Matcha milk tea(cold)', 'Beverage', 80);



--Q1:Which menu has the highest number of orders?
SELECT trans.menu_id as menu_id,
	mn.menu_name as menu_name,
    mn.menu_type as menu_type,
    Max(trans.total_quantity) as quantity
from 
(
   SELECT menu_id, 
   	   sum(quantity) As total_quantity
   From transactions As trans
   GROUP by menu_id
) as trans
inner join menu as mn
on trans.menu_id = mn.menu_id;

--Q2:Calculate revenue for each branch?
SELECT branch_name,
	SUM(tr_mn.total_price) as total_revenue
FROM
(
	SELECT branch_id,
		trans.menu_id as menu_id,
	    quantity,
	    price as price_per_unit,   
	    quantity * price as total_price
	FROM transactions as trans
	inner join menu as mn
	on trans.menu_id = mn.menu_id
) as tr_mn
inner JOIN branch as br
on tr_mn.branch_id = br.branch_id
group by branch_name
ORDER by total_revenue DESC;

--Q3:About 'Central Rama-3' branch (branch_id=1),
--   which type of platform that has no orders?

SELECT order_type_des,
	order_sub_type_des as platform
from order_type as od

EXCEPT

SELECT order_type_des,
    order_sub_type_des as platform
from
(
SELECT trans.branch_id,
	branch_name,
    order_type_des,
    order_sub_type_des
FROM transactions as trans
inner JOIN branch as br
on trans.branch_id = br.branch_id
AND trans.branch_id = 1
inner join order_type as od
on trans.order_type_id = od.order_type_id
)as a
 ; 
    


  
