CREATE OR REPLACE PROCEDURE group_books_by_genre() 
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT g.title AS genre_title, COUNT(*) AS total_books
    FROM "BookGenre" bg
    JOIN "Genre" g ON bg.genre_id = g.id
    GROUP BY g.title;
END;
$$


CALL group_books_by_genre();


/* In PostgreSQL We can not use Select method in Procedure. */


CREATE OR REPLACE FUNCTION group_books_by_genre() 
RETURNS TABLE(genre_title text, total_books bigint) AS $$
BEGIN
    RETURN QUERY SELECT g.title AS genre_title, COUNT(*) AS total_books
                 FROM "BookGenre" bg
                 JOIN "Genre" g ON bg.genre_id = g.id
                 GROUP BY g.title
				 ORDER BY total_books DESC;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM group_books_by_genre();