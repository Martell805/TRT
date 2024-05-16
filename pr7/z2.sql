BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE ;

SELECT locktype, relation::REGCLASS, virtualxid AS virtxid, transactionid AS xid, mode, granted FROM pg_locks WHERE pid = pg_backend_pid();

SELECT * FROM example WHERE id = 1;

SELECT locktype, relation::REGCLASS, virtualxid AS virtxid, transactionid AS xid, mode, granted FROM pg_locks WHERE pid = pg_backend_pid();

COMMIT ;