DROP TABLE IF EXISTS example;
CREATE TABLE IF NOT EXISTS example(id INT PRIMARY KEY, value INT);

INSERT INTO example (id, value)
SELECT x.id, x.id
FROM generate_series(1, 100) AS x(id);
