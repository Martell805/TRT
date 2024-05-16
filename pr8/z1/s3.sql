BEGIN ;

SELECT txid_current(), pg_backend_pid();

UPDATE example SET value = 40 WHERE id = 1;

COMMIT ;