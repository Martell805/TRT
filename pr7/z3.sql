ALTER SYSTEM SET log_lock_waits = on;
ALTER SYSTEM SET deadlock_timeout = '100ms';
SELECT pg_reload_conf();

START TRANSACTION ;

UPDATE example SET value = 50 WHERE id = 1;

SELECT pg_sleep(1);

COMMIT ;