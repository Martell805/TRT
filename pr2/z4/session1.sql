BEGIN TRANSACTION;

UPDATE sales_order SET total = total * 2 WHERE total = 1000.0;

UPDATE sales_order SET total = total * 2 WHERE total = 1000.0;

COMMIT;

SELECT * FROM sales_order;
