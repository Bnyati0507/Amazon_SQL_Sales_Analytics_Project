
/*
21
-- Store Procedure
create a function as soon as the product is sold the the same quantity should reduced from inventory table
after adding any sales records it should update the stock in the inventory table 
based on the product and qty purchased


*/


CREATE OR REPLACE PROCEDURE add_sales
(
p_order_id INT,
p_customer_id INT,
p_seller_id INT,
p_order_item_id INT,
p_product_id INT,
p_quantity INT
)
LANGUAGE PLPGSQL
AS
$$

DECLARE
s_count INT; 
s_price FLOAT;
s_product_name VARCHAR(50);


BEGIN
---- fetching price and product name availability in products
   SELECT price,product_name 
   INTO s_price,s_product_name
   FROM products
   WHERE product_id = p_product_id;

---- checking stock and product availability in inventory
   
   SELECT 
   COUNT(*) 
   INTO s_count 
   FROM inventory
   WHERE product_id = p_product_id AND 
         stock >= p_quantity;

   
IF s_count>0 THEN

----adding into orders
INSERT INTO orders(order_id,order_date,customer_id,seller_id)
VALUES
(p_order_id,CURRENT_DATE,p_customer_id,p_seller_id);

---adding into order_items
INSERT INTO order_items(order_item_id,order_id,product_id,quantity,price_per_unit)
VALUES
(p_order_item_id,p_order_id,p_product_id,p_quantity,s_price);


---updating inventory
UPDATE inventory
SET stock = stock - p_quantity
WHERE product_id = p_product_id;

RAISE NOTICE 'Thank you product : % sale has been added also inventory stock updated',s_product_name;

ELSE

RAISE NOTICE 'Product : % Quantity is Unavailable',s_product_name;

END IF;  
   
END;
$$

 

CALL add_sales
(
25000,2,5,25001,1,40

);
