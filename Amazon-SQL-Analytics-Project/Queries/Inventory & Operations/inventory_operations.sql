/*
8. Inventory Stock Alerts
Query products with stock levels below a certain threshold (e.g., less than 10 units).
Challenge: Include last restock date and warehouse information.
*/




Select p.product_id,
p.product_name,
i.stock as stock_left,i.warehouse_id,
i.last_stock_date as last_restock_date
FROM products p
JOIN inventory i
ON p.product_id=i.product_id
WHERE i.stock<5;




/*
9. Shipping Delays
Identify orders where the shipping date is later than 3 days after the order date.
Challenge: Include customer, order details, and delivery provider.
*/


SELECT c.customer_id,
CONCAT(c.first_name,' ',c.last_name) as full_name,
o.order_id,
o.order_date,
s.shipping_date,
s.shipping_providers
FROM customers c
JOIN orders o 
ON c.customer_id=o.customer_id
JOIN shipping s
ON o.order_id=s.order_id
WHERE (shipping_date - order_date) >= 3;




/*
14. Orders Pending Shipment
Find orders that have been paid but are still pending shipment.
Challenge: Include order details, payment date, and customer information.
*/



Select c.*,o.order_status,p.payment_date 
FROM orders o 
JOIN payments p
ON  o.order_id = p.order_id
JOIN customers c 
ON c.customer_id=o.customer_id
WHERE p.payment_status = 'Payment Successed' 
AND o.order_status NOT IN ('Completed');




/*
19. Revenue by Shipping Provider
Calculate the total revenue handled by each shipping provider.
Challenge: Include the total number of orders handled and the average delivery time for each provider.
*/


SELECT s.shipping_providers AS Shipping_company,
COUNT(o.order_id) AS total_order,
SUM(oi.quantity * oi.price_per_unit) as Revenue,
AVG(s.shipping_date - o.order_date) as Average_delivery_time
FROM shipping s
JOIN orders o
ON s.order_id = o.order_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY 1;
