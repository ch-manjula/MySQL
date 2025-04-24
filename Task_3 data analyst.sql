show databases;
create database Ecommerce;
use  Ecommerce;

-- Create tables
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT,
    email TEXT
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    price REAL
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

SELECT order_id, order_date FROM orders;

ALTER TABLE orders MODIFY COLUMN order_date DATE;


CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    amount REAL,
    payment_date TEXT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Inserting sample data
INSERT INTO customers VALUES (1, 'Alice', 'alice@gmail.com');
INSERT INTO customers VALUES (2, 'Bob', 'bob@gmail.com');
INSERT INTO customers VALUES (3, 'Charlie', 'charlie@gmail.com');

select * from customers;

INSERT INTO products VALUES (1, 'Laptop', 'Electronics', 1200.00);
INSERT INTO products VALUES (2, 'Headphones', 'Electronics', 150.00);
INSERT INTO products VALUES (3, 'Coffee Mug', 'Home', 12.00);
INSERT INTO products VALUES (4, 'Notebook', 'Office', 5.00);

select * from products;

INSERT INTO orders VALUES (1, 1, '2024-06-15');
INSERT INTO orders VALUES (2, 2, '2024-07-20');
INSERT INTO orders VALUES (3, 1, '2024-09-05');

select * from orders;

INSERT INTO order_items VALUES (1, 1, 1, 1);
INSERT INTO order_items VALUES (2, 1, 2, 2);
INSERT INTO order_items VALUES (3, 2, 3, 4);
INSERT INTO order_items VALUES (4, 3, 4, 10);

select * from  order_items;

INSERT INTO payments VALUES (1, 1, 1500.00, '2024-06-15');
INSERT INTO payments VALUES (2, 2, 48.00, '2024-07-21');
INSERT INTO payments VALUES (3, 3, 50.00, '2024-09-06');

select * from payments;

-- Basic SELECT, WHERE, ORDER BY
SELECT product_name, price FROM products ORDER BY price DESC LIMIT 10;
SELECT COUNT(*) AS total_orders_2024 FROM orders WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31';

-- JOINs
SELECT c.customer_name, o.order_id, o.order_date
FROM customers c INNER JOIN orders o ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.order_id
FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Subquery
SELECT product_name, price FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- Aggregates
SELECT category, SUM(price * quantity) AS total_revenue
FROM order_items
JOIN products ON order_items.product_id = products.product_id
GROUP BY category;

-- Views
CREATE VIEW customer_summary AS
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders,
       SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id;

-- Indexes (SQLite syntax)
CREATE INDEX idx_order_date ON orders(order_date);
CREATE INDEX idx_customer_id ON orders(customer_id);

SHOW INDEX FROM orders;

