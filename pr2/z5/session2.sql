BEGIN TRANSACTION;

INSERT INTO sales_order (order_id, order_date, customer_id, ship_date, total)
VALUES (6, '2024-06-06', 1, '2024-07-07', 1000.0);

COMMIT;
