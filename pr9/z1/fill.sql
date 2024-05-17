INSERT INTO msg_queue(payload)
SELECT to_jsonb(id) FROM generate_series(1,20) id;

TRUNCATE msg_queue;
TRUNCATE msg_log;

INSERT INTO msg_queue(payload)
SELECT to_jsonb(id) FROM generate_series(1, 10000) id;
