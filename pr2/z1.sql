BEGIN TRANSACTION;

INSERT INTO sales_order (order_id, order_date, customer_id, ship_date, total)
VALUES (6, '2024-10-01', 1, '2024-10-10', 500.0);

INSERT INTO item (order_id, product_id, actual_price, quantity, total)
VALUES (6, 5, 50.0, 2, 100.0),
       (6, 5, 20.0, 1, 20.0);

ROLLBACK;
