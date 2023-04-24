CREATE OR REPLACE PROCEDURE get_books_by_author(p_author_name TEXT)
LANGUAGE plpgsql
AS $$
DECLARE
    book_cursor CURSOR FOR SELECT b.title FROM "Book" b JOIN "Author" a ON b.author_id = a.id WHERE a.fullname = p_author_name;
    book_count INTEGER;
    book_title TEXT;
BEGIN
    OPEN book_cursor;
    LOOP
        FETCH NEXT FROM book_cursor INTO book_title;
        EXIT WHEN NOT FOUND;
    END LOOP;
    CLOSE book_cursor;
    GET DIAGNOSTICS book_count = ROW_COUNT;
    RAISE NOTICE 'Retrieved % books for author %', book_count, p_author_name; -- update the output
END;
$$;


CREATE OR REPLACE PROCEDURE get_books_by_all_authors()
LANGUAGE plpgsql
AS $$
DECLARE
    author_name TEXT;
BEGIN
    FOR author_name IN SELECT fullname FROM "Author"
    LOOP
        CALL get_books_by_author(author_name);
    END LOOP;
END;
$$;


CALL get_books_by_all_authors();