ALTER SYSTEM SET log_parser_stats = on;
ALTER SYSTEM SET log_planner_stats = on;
ALTER SYSTEM SET log_executor_stats = on;
SELECT pg_reload_conf();

DROP TABLE IF EXISTS example;
CREATE TABLE IF NOT EXISTS example(id INT PRIMARY KEY, value INT);

INSERT INTO example(id, value) SELECT n, n FROM generate_series(1, 100) n;

EXPLAIN (ANALYZE, COSTS OFF, TIMING OFF) SELECT * FROM example;

DO $$
    BEGIN
        FOR i in 1..100 LOOP
            EXECUTE 'SELECT * FROM example WHERE value > 9000';
        END LOOP ;
    END;
$$;

DO $$
    BEGIN
        FOR i in 1..100 LOOP
                PERFORM * FROM example WHERE value > 9000;
            END LOOP ;
    END;
$$;

DO $$
    BEGIN
        FOR i in 1..3 LOOP
                EXECUTE 'SELECT avg(value) FROM example';
            END LOOP ;
    END;
$$;

DO $$
    BEGIN
        FOR i in 1..3 LOOP
                PERFORM avg(value) FROM example;
            END LOOP ;
    END;
$$;