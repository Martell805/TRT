CREATE OR REPLACE FUNCTION take_message(OUT msg msg_queue) AS
$$
BEGIN
    SELECT *
    INTO msg
    FROM msg_queue
    WHERE pid IS NULL
    ORDER BY id
    LIMIT 1;

    UPDATE msg_queue
    SET pid = pg_backend_pid()
    WHERE id = msg.id;
END;
$$ LANGUAGE plpgsql VOLATILE;

CREATE OR REPLACE PROCEDURE process_queue() AS $$
DECLARE
    msg msg_queue;
BEGIN
    LOOP
        SELECT * INTO msg FROM take_message();
        EXIT WHEN msg.id IS NULL;
        COMMIT;

        -- обработка
        INSERT INTO msg_log(id, pid) VALUES (msg.id, pg_backend_pid());

        PERFORM complete_message(msg);
        COMMIT;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
