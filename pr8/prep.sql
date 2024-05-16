DROP TABLE IF EXISTS example;
CREATE TABLE IF NOT EXISTS example(id INT PRIMARY KEY, value INT);
INSERT INTO example VALUES (1, 10);
INSERT INTO example VALUES (2, 20);
INSERT INTO example VALUES (3, 30);

DROP EXTENSION IF EXISTS pageinspect;
CREATE EXTENSION IF NOT EXISTS pageinspect;

DROP VIEW IF EXISTS locks;
CREATE VIEW locks AS
SELECT pid,
       locktype,
       CASE locktype
           WHEN 'relation' THEN relation::REGCLASS::text
           WHEN 'virtualxid' THEN virtualxid::text
           WHEN 'transactionid' THEN transactionid::text
           WHEN 'tuple' THEN relation::REGCLASS::text||':'||tuple::text
           END AS lockid,
       mode,
       granted
FROM pg_locks;

