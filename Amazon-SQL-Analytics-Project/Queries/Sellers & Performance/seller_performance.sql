
/*
11. Top Performing Sellers
Find the top 5 sellers based on total sales value.
Challenge: Include both successful and failed orders, and display their percentage of successful orders.
*/


WITH seller as 
(
SELECT o.seller_id as seller_id,
s.seller_name,o.order_status AS order_status,
SUM(oi.quantity * oi.price_per_unit) AS total_sales
FROM seller s
JOIN orders o
ON s.seller_id = o.seller_id
JOIN order_items oi
ON oi.order_id = o.order_id
GROUP BY 1,2,3
),

status as
(
SELECT o.seller_id,
TRIM(o.order_status) AS order_status,
count(TRIM(o.order_status)) as total_orders
FROM orders o
WHERE o.order_status = 'Completed' OR o.order_status = 'Cancelled'
GROUP BY 1,2
)


SELECT s.seller_id,s.seller_name,s.total_sales,
SUM(CASE WHEN st.order_status ='Completed' THEN st.total_orders ELSE 0 END) AS Completed_orders,
SUM(CASE WHEN st.order_status ='Cancelled' THEN st.total_orders ELSE 0 END) AS Cancelled_orders,
(SUM(CASE WHEN st.order_status ='Completed' THEN st.total_orders ELSE 0 END) * 100/SUM(st.total_orders)) AS Success_percentage
FROM seller s
JOIN status st
ON s.seller_id=st.seller_id
GROUP BY 1,2,3
ORDER BY s.total_sales DESC
LIMIT 5;





/*
15.Active Sellers
Identify sellers who have made any sales in the first 6 months of 2023.
Challenge: Show the last sale date and total sales from those sellers.
*/



SELECT s.seller_id,s.seller_name,o.order_date AS last_sale_date,
SUM(oi.quantity * oi.price_per_unit) AS total_sale
FROM seller s
JOIN orders o
ON s.seller_id = o.seller_id
JOIN order_items oi 
ON oi.order_id = o.order_id
WHERE o.order_date between '2023-01-01' and '2023-07-1'
GROUP BY 1,2,3;