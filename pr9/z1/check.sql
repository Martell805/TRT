SELECT count(*), count(DISTINCT id) from msg_log;

SELECT id, array_agg(pid) from msg_log GROUP BY id HAVING count(*) > 1 LIMIT 10;