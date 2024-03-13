BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT count(*) from sales_order WHERE total = 30000.0;

INSERT INTO sales_order (order_id, order_date, customer_id, ship_date, total)
VALUES (7, '2024-07-07', 1, '2024-08-08', 20000.0);

SELECT count(*) from sales_order WHERE total = 30000.0;

COMMIT;
