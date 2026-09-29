SELECT setseed(0.42);

DROP TABLE IF EXISTS order_items, orders, products, customers;

CREATE TABLE customers (
    customer_id  INT PRIMARY KEY,
    name         TEXT NOT NULL,
    city         TEXT NOT NULL,
    signup_date  DATE NOT NULL
);

CREATE TABLE products (
    product_id  INT PRIMARY KEY,
    name        TEXT NOT NULL,
    category    TEXT NOT NULL,
    price       NUMERIC(10, 2) NOT NULL
);

CREATE TABLE orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT NOT NULL REFERENCES customers (customer_id),
    order_date   DATE NOT NULL,
    status       TEXT NOT NULL
);

CREATE TABLE order_items (
    order_id    INT NOT NULL REFERENCES orders (order_id),
    product_id  INT NOT NULL REFERENCES products (product_id),
    quantity    INT NOT NULL,
    unit_price  NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id)
);

INSERT INTO customers
SELECT i,
       'Customer ' || i,
       (ARRAY['New York', 'Chicago', 'Austin', 'Seattle', 'Miami', 'Denver'])[1 + floor(random() * 6)::int],
       DATE '2024-01-01' + floor(random() * 365)::int
FROM generate_series(1, 200) AS i;

INSERT INTO products
SELECT i,
       'Product ' || i,
       (ARRAY['Electronics', 'Books', 'Home', 'Sports', 'Grocery'])[1 + floor(random() * 5)::int],
       round((5 + random() * 495)::numeric, 2)
FROM generate_series(1, 50) AS i;

INSERT INTO orders
SELECT i,
       1 + floor(random() * 200)::int,
       DATE '2025-01-01' + floor(random() * 365)::int,
       (ARRAY['completed', 'completed', 'completed', 'completed', 'cancelled', 'returned'])[1 + floor(random() * 6)::int]
FROM generate_series(1, 5000) AS i;

INSERT INTO order_items
SELECT o.order_id, p.product_id, 1 + floor(random() * 4)::int, p.price
FROM orders AS o
CROSS JOIN LATERAL (
    SELECT product_id, price
    FROM products
    WHERE o.order_id IS NOT NULL
    ORDER BY random()
    LIMIT 1 + floor(random() * 3)::int
) AS p;