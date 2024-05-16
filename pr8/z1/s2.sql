BEGIN ;

SELECT txid_current(), pg_backend_pid();

UPDATE example SET value = 30 WHERE id = 1;

COMMIT ;