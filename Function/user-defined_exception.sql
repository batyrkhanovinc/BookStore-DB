CREATE OR REPLACE FUNCTION insert_book_title(p_title VARCHAR, p_edition VARCHAR, p_language VARCHAR, p_count_of_page INTEGER, p_author_id INTEGER) RETURNS VOID AS
$$
BEGIN
    IF LENGTH(p_title) < 5 THEN
        RAISE EXCEPTION 'Book title must be at least 5 characters long';
    ELSE
        INSERT INTO "Book" (title, edition, language, count_of_page, author_id) VALUES (p_title, p_edition, p_language, p_count_of_page, p_author_id);
    END IF;
END;
$$ LANGUAGE plpgsql;


SELECT insert_book_title('Abay', '3.0', 'Kazakh', 359, 1);
SELECT insert_book_title('Abay Zholy', '3.0', 'Kazakh', 359, 1);