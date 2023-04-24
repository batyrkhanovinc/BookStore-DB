CREATE OR REPLACE FUNCTION show_rows() RETURNS trigger AS $$
DECLARE
    row_count INTEGER;
BEGIN
    EXECUTE 'SELECT count(*) FROM "Author"' INTO row_count;
    RAISE NOTICE 'The number of rows in table "Author" is %', row_count;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER show_row_count
BEFORE INSERT ON "Author"
FOR EACH ROW
EXECUTE FUNCTION show_rows();


INSERT INTO "Author"(id, fullname, citizenship, birthdate, gender) VALUES (103, 'Abay Kunanbayev', 'Kazakh', '10-08-1845', 'Male');
INSERT INTO "Author"(id, fullname, citizenship, birthdate, gender) VALUES (104, 'Abay', 'Kazakh', '10-08-1845', 'Male');