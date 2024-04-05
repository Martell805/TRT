BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT count(*) from sales_order WHERE total = 20000.0;

INSERT INTO sales_order (order_id, order_date, customer_id, ship_date, total)
VALUES (6, '2024-06-06', 1, '2024-07-07', 30000.0);

SELECT pg_export_snapshot();

SELECT count(*) FROM sales_order WHERE total = 20000.0;
SELECT count(*) FROM sales_order WHERE total = 30000.0;

COMMIT;
