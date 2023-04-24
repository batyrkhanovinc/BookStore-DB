CREATE OR REPLACE FUNCTION count_records(table_name text)
RETURNS integer AS
$$
DECLARE
  record_count integer;
BEGIN
  EXECUTE format('SELECT count(*) FROM %I', table_name) INTO record_count;
  RETURN record_count;
END;
$$
LANGUAGE plpgsql;


SELECT count_records('Book');