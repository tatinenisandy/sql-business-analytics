-- Customer order frequency and revenue; includes customers with zero orders
SELECT c.customer_id, c.segment, COUNT(o.order_id) AS order_count,
       ROUND(COALESCE(SUM(o.amount_aud), 0), 2) AS revenue_aud
FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.segment ORDER BY revenue_aud DESC;

-- Repeat customer rate among purchasing customers
WITH customer_orders AS (
 SELECT customer_id, COUNT(*) AS order_count FROM orders GROUP BY customer_id
)
SELECT COUNT(*) AS purchasing_customers,
       SUM(CASE WHEN order_count >= 2 THEN 1 ELSE 0 END) AS repeat_customers,
       ROUND(100.0 * SUM(CASE WHEN order_count >= 2 THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0),1) AS repeat_rate_pct
FROM customer_orders;

-- Monthly revenue
SELECT SUBSTR(order_date,1,7) AS month, COUNT(*) AS orders,
       ROUND(SUM(amount_aud),2) AS revenue_aud
FROM orders GROUP BY SUBSTR(order_date,1,7) ORDER BY month;
