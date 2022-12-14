-- Lesson 2: Retrieving Data

-- 1. Retrieve all customer IDs from the Customers table

select cust_id from customers;

-- 2. Get unique list of products ordered

select distinct prod_id from orderitems;

-- 3. All columns from Customers and also just the customer ID. Use comment 

select * -- cust_id
from customers;

-- ==========================================================================
-- Lesson 3: Sorting retrieved data

-- 1. Get all customer names, sort z to a

select cust_name from customers 
order by cust_name desc;

-- 2. Get cust_id and order_num. Sort by cust_id then by order date in reverse.

select cust_id, order_num, order_date
from orders
order by cust_id, order_date desc;

-- 3. Display quantity and price from orderitems. Sort with highest quantity
-- and highest price first.

select quantity, item_price
from orderitems
order by quantity, item_price;

-- ==========================================================================
-- Lesson 4: Filtering Data

-- 1. Retrieve prod_id and prod_name from products. Return only those with price = 9.49

select prod_id, prod_name
from products
where prod_price = 9.49;

-- 2. 

















