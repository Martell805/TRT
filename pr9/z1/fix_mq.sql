CREATE OR REPLACE FUNCTION take_message(OUT msg msg_queue) AS $$
BEGIN
    SELECT *
    INTO msg
    FROM msg_queue
    WHERE pid IS NULL
    ORDER BY id LIMIT 1
        FOR UPDATE SKIP LOCKED;

    UPDATE msg_queue
    SET pid = pg_backend_pid()
    WHERE id = msg.id;
END;
$$ LANGUAGE plpgsql VOLATILE;

CREATE OR REPLACE FUNCTION take_message(OUT msg msg_queue) AS $$
BEGIN
    SELECT *
    INTO msg
    FROM msg_queue
    WHERE pid IS NULL OR pid NOT IN (SELECT pid FROM pg_stat_activity)
    ORDER BY id LIMIT 1
        FOR UPDATE SKIP LOCKED;

    UPDATE msg_queue
    SET pid = pg_backend_pid()
    WHERE id = msg.id;
END;
$$ LANGUAGE plpgsql VOLATILE;
