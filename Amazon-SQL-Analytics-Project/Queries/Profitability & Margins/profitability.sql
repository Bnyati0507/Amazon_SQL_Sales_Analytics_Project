/*
12. Product Profit Margin
Calculate the profit margin for each product (difference between price and cost of goods sold).
Challenge: Rank products by their profit margin, showing highest to lowest.
*/

SELECT p.product_id,p.product_name,
SUM((oi.quantity*oi.price_per_unit)-(p.cogs * oi.quantity)) AS profit,
(SUM((oi.quantity*oi.price_per_unit)-(p.cogs * oi.quantity))/ SUM(oi.quantity *oi.price_per_unit))*100 AS profit_margin,
DENSE_RANK()OVER
(ORDER BY SUM((oi.quantity*oi.price_per_unit)-(p.cogs * oi.quantity))*100/ SUM(oi.quantity *oi.price_per_unit)DESC)
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY 1,2;