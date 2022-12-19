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

-- 2. Retrieve prod_id and prod_name from Products returning only those with price over 9.

select prod_id, prod_name
from products
where prod_price > 9;

-- 3. Get unique list of order numbers from orderitems which contain 100 or more of any item.

select distinct order_num
from orderitems
where quantity > 100;

-- 4. Get all prod_name and prod_price between 3 and 6 $. Sort by price

select prod_name, prod_price
from products
where prod_price > 3 and prod_price < 6
order by prod_price;

-- =====================================================================
-- Lesson 5: Advanced data filtering
 
-- 1. Get vendor name from vendors table. Only vendors in California.alter

select vend_name 
from vendors
where vend_country in ('USA') and vend_state in ('CA');

-- 2. Get all orders where at least 100 of BR01, BR02, or BR03 were ordered. 

select order_num, prod_id, quantity
from orderitems
where quantity >= 100 and prod_id in ('BR01', 'BR02', 'BR03')  ;

-- 3. Return prod_name and prod_price from products between 3 and 6$. Sort by price.

select prod_name, prod_price
from products
where prod_price > 3 and prod_price < 6
order by prod_price;

-- =====================================================================
-- Lesson 6: Wildcard filtering
-- 1. Get prod_name and prod_desc from Products where toy is in the description.

select prod_name, prod_desc
from products
where prod_desc like '%toy%';

-- 2. Same but no toy in prod_desc. Sort by prod_name.

select prod_name, prod_desc
from products
where prod_desc not like '%toy%'
order by prod_name;

-- 3. Get prod_name and prod_desc where both toy and carrots are in description.
-- Use and and two likes

select prod_name, prod_desc
from products
where prod_desc like '%toy%' and prod_desc like '%carrots%';

-- 4. Same but toy and carrots in that order

select prod_name, prod_desc
from products
where prod_desc like '%toy%carrots%';

-- ================================================================
-- Lesson 7: Creating calculated fields
-- 1. Retrieve vend_id, vend_name, vend_address, vend_city from Vendors.
-- rename vend_name to vname, vend_city to vcity, vend_address to vaddress.
-- sort by vendor name

select vend_id, vend_name as vname, vend_city as vcity, vend_address as vaddress
from vendors
order by vname;

-- 2. Return prod_id, prod_price and sale_price from products.
-- make sale_price 10% off.alter

select prod_id, prod_price, 0.9*prod_price as sale_price
from products;

-- ==========================================================
-- Lesson 8: Data manipulation fuctions
-- 1. Return cust_id, customer_name, and user login. Make user login
-- uppercase and first 2 characters of cust_contact and first 3 characters
-- of cust_city.

select cust_id, cust_name, concat(substring(UPPER(cust_contact), 1,2), substring(upper(cust_city), 1, 3)) as user_login
from customers;

-- 2. Return order_num and order_date for all orders in Jan 2020. Sort by order date.
select * from orders;

select order_num, order_date
from orders
where year(order_date) = 2020 and month(order_date) = 01;

-- ==============================================================
-- Lesson 9: Summarizing data
-- 1. Determine total number of items sold using quanity in orderitems. 
 
select sum(quantity) as total_items
from orderitems;

-- 2. Modify to get total number of BR01 sold. 

select sum(quantity) as total_BR01
from orderitems
where prod_id in ('BR01');

-- 3. Determine prod_price of most expensive item in Products that costs
-- no more than $10. Call it max_price.

select prod_name, max(prod_price) as max_price
from products
where prod_price <= 10;

-- ============================================================
-- Lesson 10: Grouping Data
-- 1. Get the number of lines (as order_lines) for each order_num. Sort by order_lines. 

select order_item, count(*) as order_lines 
from orderitems
group by order_item
order by order_lines;

-- 2. Return a field called cheapest_item which contains the lowest cost item for each vendor.
-- sort from lowest to highest  cost

select vend_id, min(prod_price) as cheapest_item
from products
group by vend_id
order by prod_price;

-- 3. Return order number for all orders of at least 100 items.

select * from orderitems;

select order_num 
from orderitems
where quantity >= 100;





 





























