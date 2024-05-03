CREATE TABLE IF NOT EXISTS poses (pos TEXT);

INSERT INTO poses SELECT pg_current_wal_lsn();

BEGIN TRANSACTION;

INSERT INTO job (job_id, function) VALUES (10, 'Hi!');
INSERT INTO job (job_id, function) VALUES (11, 'Hi!');

COMMIT;

INSERT INTO poses SELECT pg_current_wal_lsn();

SELECT * FROM poses;
