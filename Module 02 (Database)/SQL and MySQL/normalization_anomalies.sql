# Normalization

CREATE SCHEMA normal_demo;

USE normal_demo;

CREATE TABLE nf0_ecom (
    order_id INT,
    user_name VARCHAR(100),
    user_email VARCHAR(100),
    user_phone VARCHAR(15),
    product_ids VARCHAR(255),       -- NOT atomic
    product_names VARCHAR(255),     -- NOT atomic
    quantities VARCHAR(255),        -- NOT atomic
    prices VARCHAR(255),            -- NOT atomic
    order_date DATE,
    delivery_address VARCHAR(255)
);

INSERT INTO nf0_ecom VALUES
(101, 'Rahul Sharma', 'rahul.sharma@gmail.com', '9876543210',
 '201,305',                                -- multiple product IDs
 'Boat Airdopes 141,Dell Wireless Mouse',  -- multiple names
 '1,1',                                    -- multiple quantities
 '999,699',                                -- multiple prices
 '2025-01-10', '101, MG Road, Indore, MP'),

(102, 'Aditi Verma', 'aditi.verma@yahoo.com', '9123456780',
 '402',                                    -- single product still allowed
 'Campus Running Shoes',
 '2',
 '1299',
 '2025-01-11', '22, Nehru Nagar, Bhopal, MP'),

(103, 'Rohan Patil', 'rohan.patil@gmail.com', '9988776655',
 '201,509',
 'Boat Airdopes 141,Prestige Kettle',
 '1,1',
 '999,799',
 '2025-01-12', '14, FC Road, Pune, MH'),

(104, 'Kavya Iyer', 'kavya.iyer@outlook.com', '9090909090',
 '611',
 'Samsung Galaxy M34 Cover',
 '1',
 '299',
 '2025-01-12', '55, Anna Nagar, Chennai, TN'),

(105, 'Arjun Singh', 'arjun.singh@gmail.com', '9000011111',
 '402,305',
 'Campus Running Shoes,Dell Wireless Mouse',
 '1,1',
 '1299,699',
 '2025-01-14', '18, Hazratganj, Lucknow, UP');
 
# 1 NF
CREATE TABLE nf1_ecom (
    order_id INT,
    user_name VARCHAR(100),
    user_email VARCHAR(100),
    user_phone VARCHAR(15),
    product_id INT,
    product_name VARCHAR(100),
    qty INT,
    price DECIMAL(10,2),
    order_date DATE,
    delivery_address VARCHAR(255)
);

INSERT INTO nf1_ecom
(order_id, user_name, user_email, user_phone, product_id, product_name, qty, price, order_date, delivery_address)
VALUES
(101, 'Rahul Sharma', 'rahul.sharma@gmail.com', '9876543210', 201, 'Boat Airdopes 141', 1, 999.00, '2025-01-10', '101, MG Road, Indore, MP'),

(101, 'Rahul Sharma', 'rahul.sharma@gmail.com', '9876543210', 305, 'Dell Wireless Mouse', 1, 699.00, '2025-01-10', '101, MG Road, Indore, MP'),

(102, 'Aditi Verma', 'aditi.verma@yahoo.com', '9123456780', 402, 'Campus Running Shoes', 2, 1299.00, '2025-01-11', '22, Nehru Nagar, Bhopal, MP'),

(103, 'Rohan Patil', 'rohan.patil@gmail.com', '9988776655', 201, 'Boat Airdopes 141', 1, 999.00, '2025-01-12', '14, FC Road, Pune, MH'),

(103, 'Rohan Patil', 'rohan.patil@gmail.com', '9988776655', 509, 'Prestige Kettle', 1, 799.00, '2025-01-12', '14, FC Road, Pune, MH'),

(104, 'Kavya Iyer', 'kavya.iyer@outlook.com', '9090909090', 611, 'Samsung Galaxy M34 Cover', 1, 299.00, '2025-01-12', '55, Anna Nagar, Chennai, TN'),

(105, 'Arjun Singh', 'arjun.singh@gmail.com', '9000011111', 402, 'Campus Running Shoes', 1, 1299.00, '2025-01-14', '18, Hazratganj, Lucknow, UP'),

(105, 'Arjun Singh', 'arjun.singh@gmail.com', '9000011111', 305, 'Dell Wireless Mouse', 1, 699.00, '2025-01-14', '18, Hazratganj, Lucknow, UP'),

(106, 'Neha Gupta', 'neha.gupta@gmail.com', '9822334455', 788, 'Milton Water Bottle 1L', 1, 499.00, '2025-01-15', '88, Civil Lines, Kanpur, UP'),

(107, 'Vikas Yadav', 'vikas.yadav@gmail.com', '9811122233', 402, 'Campus Running Shoes', 1, 1299.00, '2025-01-16', '40, Sector 18, Noida, UP');
 
# NF 2
CREATE TABLE nf2_orders (
    order_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    user_email VARCHAR(100),
    user_phone VARCHAR(15),
    order_date DATE,
    delivery_address VARCHAR(255)
);

CREATE TABLE nf2_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE nf2_order_items (
    order_id INT,
    product_id INT,
    qty INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES nf2_orders(order_id),
    FOREIGN KEY (product_id) REFERENCES nf2_products(product_id)
);

INSERT INTO nf2_orders VALUES
(101, 'Rahul Sharma', 'rahul.sharma@gmail.com', '9876543210', '2025-01-10', '101, MG Road, Indore, MP'),
(102, 'Aditi Verma', 'aditi.verma@yahoo.com', '9123456780', '2025-01-11', '22, Nehru Nagar, Bhopal, MP'),
(103, 'Rohan Patil', 'rohan.patil@gmail.com', '9988776655', '2025-01-12', '14, FC Road, Pune, MH'),
(104, 'Kavya Iyer', 'kavya.iyer@outlook.com', '9090909090', '2025-01-12', '55, Anna Nagar, Chennai, TN'),
(105, 'Arjun Singh', 'arjun.singh@gmail.com', '9000011111', '2025-01-14', '18, Hazratganj, Lucknow, UP'),
(106, 'Neha Gupta', 'neha.gupta@gmail.com', '9822334455', '2025-01-15', '88, Civil Lines, Kanpur, UP'),
(107, 'Vikas Yadav', 'vikas.yadav@gmail.com', '9811122233', '2025-01-16', '40, Sector 18, Noida, UP');

INSERT INTO nf2_products VALUES
(201, 'Boat Airdopes 141', 999.00),
(305, 'Dell Wireless Mouse', 699.00),
(402, 'Campus Running Shoes', 1299.00),
(509, 'Prestige Kettle', 799.00),
(611, 'Samsung Galaxy M34 Cover', 299.00),
(788, 'Milton Water Bottle 1L', 499.00);

INSERT INTO nf2_order_items VALUES
(101, 201, 1),
(101, 305, 1),
(102, 402, 2),
(103, 201, 1),
(103, 509, 1),
(104, 611, 1),
(105, 402, 1),
(105, 305, 1),
(106, 788, 1),
(107, 402, 1);

# NF 3
CREATE TABLE nf3_users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100),
    user_email VARCHAR(100) UNIQUE,
    user_phone VARCHAR(15)
);

CREATE TABLE nf3_orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    delivery_address VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES nf3_users(user_id)
);

CREATE TABLE nf3_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE nf3_order_items (
    order_id INT,
    product_id INT,
    qty INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES nf3_orders(order_id),
    FOREIGN KEY (product_id) REFERENCES nf3_products(product_id)
);

INSERT INTO nf3_users (user_name, user_email, user_phone) VALUES
('Rahul Sharma', 'rahul.sharma@gmail.com', '9876543210'),
('Aditi Verma', 'aditi.verma@yahoo.com', '9123456780'),
('Rohan Patil', 'rohan.patil@gmail.com', '9988776655'),
('Kavya Iyer', 'kavya.iyer@outlook.com', '9090909090'),
('Arjun Singh', 'arjun.singh@gmail.com', '9000011111'),
('Neha Gupta', 'neha.gupta@gmail.com', '9822334455'),
('Vikas Yadav', 'vikas.yadav@gmail.com', '9811122233');

INSERT INTO nf3_orders VALUES
(101, 1, '2025-01-10', '101, MG Road, Indore, MP'),
(102, 2, '2025-01-11', '22, Nehru Nagar, Bhopal, MP'),
(103, 3, '2025-01-12', '14, FC Road, Pune, MH'),
(104, 4, '2025-01-12', '55, Anna Nagar, Chennai, TN'),
(105, 5, '2025-01-14', '18, Hazratganj, Lucknow, UP'),
(106, 6, '2025-01-15', '88, Civil Lines, Kanpur, UP'),
(107, 7, '2025-01-16', '40, Sector 18, Noida, UP');

INSERT INTO nf3_products VALUES
(201, 'Boat Airdopes 141', 999.00),
(305, 'Dell Wireless Mouse', 699.00),
(402, 'Campus Running Shoes', 1299.00),
(509, 'Prestige Kettle', 799.00),
(611, 'Samsung Galaxy M34 Cover', 299.00),
(788, 'Milton Water Bottle 1L', 499.00);

INSERT INTO nf3_order_items VALUES
(101, 201, 1),
(101, 305, 1),
(102, 402, 2),
(103, 201, 1),
(103, 509, 1),
(104, 611, 1),
(105, 402, 1),
(105, 305, 1),
(106, 788, 1),
(107, 402, 1);

# NF 4
CREATE TABLE nf4_users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100),
    user_email VARCHAR(100) UNIQUE,
    user_phone VARCHAR(15),
    delivery_address VARCHAR(255)
);

CREATE TABLE nf4_orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES nf4_users(user_id)
);

CREATE TABLE nf4_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE nf4_order_items (
    order_id INT,
    product_id INT,
    qty INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES nf4_orders(order_id),
    FOREIGN KEY (product_id) REFERENCES nf4_products(product_id)
);

INSERT INTO nf4_users (user_name, user_email, user_phone) VALUES
('Rahul Sharma', 'rahul.sharma@gmail.com', '9876543210', '101, MG Road, Indore, MP'),
('Aditi Verma', 'aditi.verma@yahoo.com', '9123456780', '22, Nehru Nagar, Bhopal, MP'),
('Rohan Patil', 'rohan.patil@gmail.com', '9988776655', '14, FC Road, Pune, MH'),
('Kavya Iyer', 'kavya.iyer@outlook.com', '9090909090', '55, Anna Nagar, Chennai, TN'),
('Arjun Singh', 'arjun.singh@gmail.com', '9000011111', '18, Hazratganj, Lucknow, UP'),
('Neha Gupta', 'neha.gupta@gmail.com', '9822334455', '88, Civil Lines, Kanpur, UP'),
('Vikas Yadav', 'vikas.yadav@gmail.com', '9811122233', '40, Sector 18, Noida, UP');

INSERT INTO nf4_orders VALUES
(101, 1, '2025-01-10'),
(102, 2, '2025-01-11'),
(103, 3, '2025-01-12'),
(104, 4, '2025-01-12'),
(105, 5, '2025-01-14'),
(106, 6, '2025-01-15'),
(107, 7, '2025-01-16');

INSERT INTO nf4_products VALUES
(201, 'Boat Airdopes 141', 999.00),
(305, 'Dell Wireless Mouse', 699.00),
(402, 'Campus Running Shoes', 1299.00),
(509, 'Prestige Kettle', 799.00),
(611, 'Samsung Galaxy M34 Cover', 299.00),
(788, 'Milton Water Bottle 1L', 499.00);

INSERT INTO nf4_order_items VALUES
(101, 201, 1),
(101, 305, 1),
(102, 402, 2),
(103, 201, 1),
(103, 509, 1),
(104, 611, 1),
(105, 402, 1),
(105, 305, 1),
(106, 788, 1),
(107, 402, 1);

# Joins
CREATE DATABASE ecommerce;

use ecommerce;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100),
    user_email VARCHAR(100) UNIQUE,
    user_phone VARCHAR(15),
    delivery_address VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    qty INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO users (user_name, user_email, user_phone, delivery_address) VALUES
('Rahul Sharma', 'rahul.sharma@gmail.com', '9876543210', '101, MG Road, Indore, MP'),
('Aditi Verma', 'aditi.verma@yahoo.com', '9123456780', '22, Nehru Nagar, Bhopal, MP'),
('Rohan Patil', 'rohan.patil@gmail.com', '9988776655', '14, FC Road, Pune, MH'),
('Kavya Iyer', 'kavya.iyer@outlook.com', '9090909090', '55, Anna Nagar, Chennai, TN'),
('Arjun Singh', 'arjun.singh@gmail.com', '9000011111', '18, Hazratganj, Lucknow, UP'),
('Neha Gupta', 'neha.gupta@gmail.com', '9822334455', '88, Civil Lines, Kanpur, UP'),
('Vikas Yadav', 'vikas.yadav@gmail.com', '9811122233', '40, Sector 18, Noida, UP'),
('Yash Mukati', 'yash.mukati@yahoo.com', '9897969594', '19, LIG, Jabalpur, MP'),
('Gaurav Tiwari', 'gaurav.tiwari@rediff.com', '9987766345', '21, Sector 18, Gwalior, MP');

INSERT INTO orders VALUES
(101, 1, '2025-01-10'),
(102, 2, '2025-01-11'),
(103, 3, '2025-01-12'),
(104, 4, '2025-01-12'),
(105, 5, '2025-01-14'),
(106, 6, '2025-01-15'),
(107, 7, '2025-01-16');

INSERT INTO products VALUES
(201, 'Boat Airdopes 141', 999.00),
(305, 'Dell Wireless Mouse', 699.00),
(402, 'Campus Running Shoes', 1299.00),
(509, 'Prestige Kettle', 799.00),
(611, 'Samsung Galaxy M34 Cover', 299.00),
(788, 'Milton Water Bottle 1L', 499.00);

INSERT INTO order_items VALUES
(101, 201, 1),
(101, 305, 1),
(102, 402, 2),
(103, 201, 1),
(103, 509, 1),
(104, 611, 1),
(105, 402, 1),
(105, 305, 1),
(106, 788, 1),
(107, 402, 1);

# Inner Join
SELECT u.user_name, o.order_id, o.order_date
FROM users u
INNER JOIN orders o
ON u.user_id = o.user_id;

# Inner Join
SELECT o.order_id, p.product_name, oi.qty
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

# Left Inner Join
SELECT u.user_id, u.user_name, o.order_id
FROM users u
LEFT JOIN orders o
ON u.user_id = o.user_id;

# Right Join
SELECT u.user_name, o.order_id
FROM users u
RIGHT JOIN orders o
ON u.user_id = o.user_id;

# Full Join
SELECT u.user_name, o.order_id
FROM users u
LEFT JOIN orders o
ON u.user_id = o.user_id

UNION

SELECT u.user_name, o.order_id
FROM users u
RIGHT JOIN orders o
ON u.user_id = o.user_id;

# Cross Join
SELECT u.user_name, p.product_name
FROM users u
CROSS JOIN products p;

# Sub-queries
SELECT product_name, price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

SELECT user_name
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM orders
);

SELECT product_name
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM order_items
);

SELECT user_name
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM orders
    WHERE order_id IN (
        SELECT order_id
        FROM order_items
        WHERE product_id = (
            SELECT product_id
            FROM products
            WHERE product_name = 'Campus Running Shoes'
        )
    )
);

INSERT INTO orders (order_id, user_id, order_date)
VALUES (
    200,
    (SELECT user_id FROM users WHERE user_name = 'Rahul Sharma'),
    CURDATE()
);

UPDATE products
SET price = price + 100
WHERE product_id IN (
    SELECT product_id
    FROM order_items
);

UPDATE products
SET price = price * 1.10
WHERE price < (
    SELECT avg_price
    FROM (
        SELECT AVG(price) AS avg_price
        FROM products
    ) AS temp
);

DELETE FROM users
WHERE user_id NOT IN (
    SELECT user_id
    FROM orders
);

DELETE FROM orders
WHERE order_id IN (
    SELECT order_id
    FROM order_items
    GROUP BY order_id
    HAVING COUNT(product_id) = 1
);