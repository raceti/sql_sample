use restaurant_db;

-- 1. view the menu_items table.
select * from menu_items;

-- 2. finding the number of items on the menu.
select count(*) from menu_items;

-- 3. presenting least and move expensive menu items.
select * from menu_items
order by price;
select * from menu_items;
order by price DESC;

-- 4. filtering italian dishes on the menu.
select * from menu_items
where category = 'italian';

-- 5. filtering least and most expensive italian dishes.
select * from menu_items
where category = 'italian'
order by price desc;

-- 6. count of dishes in each category.
select category, count(menu_item_id) as num_dishes
from menu_items
group by category;

-- 7. calculating avg price of dish in each category.
select category, avg(price) as avg_price
from menu_items
group by category;

-- 1. view the order_details table.

select * from order_details;

-- 2. identifying the date range of the table

select min(order_date), max(order_date) from order_details;

-- 3. filtering order count made within a specified date range.

select count(distinct order_id) from order_details;

-- 4. filtering order count within a specified date range.

select count(*) from order_details;
-- 5. orders with the most # of items. 
select order_id, count(item_id) as num_items
from order_details
group by order_id
order by num_items desc;

-- 6. presenting orders with >12 items.

select count(*) from

(select order_id, count(item_id) as num_items
from order_details
group by order_id
having num_items > 12) as num_orders; 

-- 1. combine menu and order tables.

select * from menu_items;
select * from order_details;

select *
from order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id;
	
-- 2. least and most order items. display categories.

select item_name, category, count(order_details_id) as num_purchases
from order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id
    group by item_name, category
    order by num_purchases desc;
    
-- 3. top 5 orders that spent most money.

select order_id, sum(price) as total_spend
from order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id
    group by order_id
    order by total_spend desc
    limit 5;
    
-- 4. details of highest spent order. provide analysis

select category, count(item_id) as num_items
from order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id
    where order_id = 440
    group by category;

    
-- 5. details of 5 highest spending orders. provide analysis. 

select order_id, category, count(item_id) as num_items
from order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id
    where order_id in (440, 2075, 1957, 330, 2675)
    group by order_id, category;