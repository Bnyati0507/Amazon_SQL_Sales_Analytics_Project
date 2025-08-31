--Amazon Database Project

--category TABLE

CREATE TABLE category
(
category_id INT PRIMARY KEY,
category_name VARCHAR(20)
);

--customers TABLE

CREATE TABLE customers
(
customer_id	INT PRIMARY KEY,
first_name VARCHAR(15),	
last_name VARCHAR(15),	
state VARCHAR(20),
address VARCHAR(25) DEFAULT('XXXX')
);

--sellers TABLE

CREATE TABLE seller
(
seller_id INT PRIMARY KEY,
seller_name VARCHAR(25),
origin VARCHAR(10)
);

--products TABLE


CREATE TABLE products
(
product_id INT PRIMARY KEY,	
product_name VARCHAR(50),	
price FLOAT,
cogs FLOAT,
category_id INT,   ---FK
CONSTRAINT product_fk_category FOREIGN KEY(category_id) REFERENCES category(category_id) 
);

--orders TABLE


CREATE TABLE orders
(
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT, ---FK
CONSTRAINT order_fk_category FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
seller_id INT, ---FK
CONSTRAINT order_fk_seller FOREIGN KEY(seller_id) REFERENCES seller(seller_id),
order_status VARCHAR(20)
);

--order_items TABLE

CREATE TABLE order_items
(
order_item_id INT PRIMARY KEY,
order_id INT,  --FK
CONSTRAINT order_items_fk_order FOREIGN KEY(order_id) REFERENCES orders(order_id),
product_id INT,  --FK
CONSTRAINT order_items_fk_products FOREIGN KEY(product_id) REFERENCES products(product_id),
quantity INT,
price_per_unit FLOAT
);

--payment TABLE

CREATE TABLE payments
(
payment_id INT PRIMARY KEY,
order_id INT,  --FK
CONSTRAINT payment_fk_orders FOREIGN KEY(order_id) REFERENCES orders(order_id),
payment_date DATE,
payment_status VARCHAR(20)
);


---shipping TABLE

CREATE TABLE shipping
(
shipping_id	INT PRIMARY KEY,
order_id INT,  ---FK
CONSTRAINT shipping_fk_order FOREIGN KEY(order_id)  REFERENCES orders(order_id),
shipping_date DATE,
return_date DATE,	
shipping_providers VARCHAR(20),
delivery_status VARCHAR(20)
);



--inventory TABLE


CREATE TABLE inventory
(
inventory_id INT PRIMARY KEY,
product_id INT, 	--FK
CONSTRAINT inventory_items_fk_products FOREIGN KEY(product_id) REFERENCES products(product_id),
stock INT,
warehouse_id INT,
last_stock_date DATE
);


--END OF SCHEMAS
