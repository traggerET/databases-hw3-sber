CREATE TABLE myt (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE OR REPLACE FUNCTION rand_str(length INTEGER) RETURNS TEXT AS
$$
DECLARE
    letters TEXT := 'abcdefghijklmnopqrstuvwxyz';
    result TEXT := '';
BEGIN
    FOR i IN 1..length LOOP
        result := result || substr(letters, floor(random() * length(letters) + 1)::integer, 1);
    END LOOP;
    RETURN result;
END;
$$ LANGUAGE plpgsql;