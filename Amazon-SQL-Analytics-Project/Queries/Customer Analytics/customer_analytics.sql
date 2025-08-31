/*
5. Customers with No Purchases
Find customers who have registered but never placed an order.
Challenge: List customer details and the time since their registration.
*/


SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS full_name
FROM customers c
LEFT JOIN orders o
on c.customer_id=o.customer_id
WHERE o.order_id IS NULL;




/*
13. Most Returned Products
Query the top 10 products by the number of returns.
Challenge: Display the return rate as a percentage of total units sold for each product.
*/


SELECT p.product_id,
p.product_name,
o.order_status,
COUNT(*)FILTER(WHERE o.order_status = 'Returned') *100/SUM(oi.quantity) as return_rate_percentage
FROM products p 
JOIN order_items oi
ON p.product_id = oi.product_id
JOIN orders o
ON oi.order_id=o.order_id
WHERE o.order_status = 'Returned'
GROUP BY 1,2,3
ORDER BY 4 DESC;



/*
16. IDENTITY customers into returning or new
if the customer has done more than 5 return categorize them as returning otherwise new
Challenge: List customers id, name, total orders, total returns
*/



SELECT c.customer_id AS customer_id,
CONCAT(c.first_name,' ',c.last_name) AS full_name,
COUNT(o.order_id) AS total_orders,
SUM(CASE WHEN o.order_status = 'Returned' THEN 1 ELSE 0 END) AS total_returns,
CASE
WHEN SUM(CASE WHEN o.order_status = 'Returned' THEN 1 ELSE 0 END)>5 THEN 'Returning Customer' ELSE 'New Customer'
END cus_category
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY 1
ORDER BY 4 DESC;



/*
17. Cross-Sell Opportunities
Find customers who purchased product A but not product B 
(e.g., customers who bought AirPods but not AirPods Max).
Challenge: Suggest cross-sell opportunities by displaying matching product categories.
*/

-- Example: Customers who bought AirPods but not AirPods Max


WITH product_a_customers AS (
    SELECT DISTINCT c.customer_id
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Order_items oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
    WHERE p.product_name = 'Apple AirPods 3rd Gen'
),
product_b_customers AS (
    SELECT DISTINCT c.customer_id
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Order_items oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
    WHERE p.product_name = 'Apple AirPods Max'
)
SELECT DISTINCT c.customer_id,
       CONCAT(c.first_name,' ',c.last_name) AS full_name,
       pa.product_name AS purchased_product,
       cat.category_name,
       p2.product_name AS recommended_product
FROM product_a_customers pac
JOIN Customers c ON pac.customer_id = c.customer_id
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_items oi ON o.order_id = oi.order_id
JOIN Products pa ON oi.product_id = pa.product_id
JOIN Category cat ON pa.category_id = cat.category_id
JOIN Products p2 ON cat.category_id = p2.category_id
WHERE pa.product_name = 'Apple AirPods 3rd Gen'
  AND c.customer_id NOT IN (SELECT customer_id FROM product_b_customers)
  AND p2.product_name <> 'Apple AirPods Max';





/*
18. Top 5 Customers by Orders in Each State
Identify the top 5 customers with the highest number of orders for each state.
Challenge: Include the number of orders and total sales for each customer.
*/


WITH sale AS
(
SELECT c.customer_id AS customer_id,
CONCAT(c.first_name,' ',c.last_name) AS full_name,
c.state,
COUNT(o.order_id) AS total_order,
SUM(oi.quantity * oi.price_per_unit) as total_sale,
ROW_NUMBER()OVER(PARTITION BY c.state ORDER BY COUNT(o.order_id)DESC) AS rank
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY 1,2,3
)

SELECT *
FROM sale
WHERE rank<=5;

