BEGIN ;

SELECT txid_current(), pg_backend_pid();

UPDATE example SET value = 20 WHERE id = 1;

COMMIT ;