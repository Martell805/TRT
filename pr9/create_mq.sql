CREATE TABLE msg_queue
(
    id      bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    payload jsonb NOT NULL,
    pid     integer DEFAULT NULL
);

CREATE FUNCTION take_message(OUT msg msg_queue) AS
$$
BEGIN
    SELECT *
    INTO msg
    FROM msg_queue
    WHERE pid IS NULL
    ORDER BY id
    LIMIT 1 FOR UPDATE SKIP LOCKED;

    UPDATE msg_queue
    SET pid = pg_backend_pid()
    WHERE id = msg.id;
END;
$$ LANGUAGE plpgsql VOLATILE;

CREATE FUNCTION complete_message(msg msg_queue) RETURNS void AS
$$
DELETE
FROM msg_queue
WHERE id = msg.id;
$$ LANGUAGE sql VOLATILE;

CREATE TABLE msg_log
(
    id  bigint,
    pid integer
);

CREATE PROCEDURE process_queue() AS $$
DECLARE
    msg msg_queue;
BEGIN
    LOOP
        SELECT * INTO msg FROM take_message();
        EXIT WHEN msg.id IS NULL;

        -- обработка
        PERFORM pg_sleep(1);
        RAISE NOTICE '[%] processed %; backend_xmin=%',
            pg_backend_pid(),
            msg.payload,
            (SELECT backend_xmin FROM pg_stat_activity
             WHERE pid = pg_backend_pid());

        PERFORM complete_message(msg);
    END LOOP;
END;
$$ LANGUAGE plpgsql;



