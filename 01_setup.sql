DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (customer_id INTEGER PRIMARY KEY, segment TEXT NOT NULL, signup_date TEXT NOT NULL);
CREATE TABLE orders (order_id INTEGER PRIMARY KEY, customer_id INTEGER NOT NULL, order_date TEXT NOT NULL, amount_aud REAL NOT NULL CHECK(amount_aud >= 0), FOREIGN KEY(customer_id) REFERENCES customers(customer_id));
INSERT INTO customers VALUES (1,'Small business','2026-01-05'),(2,'Enterprise','2026-01-12'),(3,'Small business','2026-02-02'),(4,'Mid-market','2026-02-10');
INSERT INTO orders VALUES (101,1,'2026-02-01',120.00),(102,1,'2026-03-01',85.50),(103,2,'2026-02-05',450.00),(104,3,'2026-03-12',90.00),(105,2,'2026-03-20',210.00);
