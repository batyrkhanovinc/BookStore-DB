CREATE TABLE IF NOT EXISTS "Customer" (
    id serial PRIMARY KEY,
    name VARCHAR (100) NOT NULL,
    country VARCHAR (100) NOT NULL,
    city VARCHAR (100) NOT NULL,
    birthdate date NOT NULL
);

CREATE TABLE IF NOT EXISTS "CustomerData" (
    id serial PRIMARY KEY,
    email VARCHAR (100) NOT NULL,
    phone_number VARCHAR (100) NOT NULL,
    paycard VARCHAR (100) NOT NULL,
    citizenship VARCHAR (100) NOT NULL,
    address VARCHAR (100) NOT NULL,
    post_code VARCHAR (100),
    customer_id integer NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES "Customer" (id)
);

CREATE TABLE IF NOT EXISTS "Author" (
    id serial PRIMARY KEY,
    fullname VARCHAR (100) NOT NULL,
    citizenship VARCHAR (50) NOT NULL,
    birthdate date NOT NULL,
    gender VARCHAR (100) NOT NULL
);

CREATE TABLE IF NOT EXISTS "Book" (
    id serial PRIMARY KEY,
    title VARCHAR (100) NOT NULL,
    edition VARCHAR (100) NOT NULL,
    language VARCHAR (100) NOT NULL,
    count_of_page integer NOT NULL,
    author_id integer NOT NULL,
	FOREIGN KEY (author_id) REFERENCES "Author" (id)
);

CREATE TABLE IF NOT EXISTS "BookData" (
    id serial PRIMARY KEY,
    description text,
    publication_date date NOT NULL,
    age_permission integer NOT NULL,
    price numeric(10,2) NOT NULL,
    book_id integer NOT NULL,
    FOREIGN KEY (book_id) REFERENCES "Book" (id)
);

CREATE TABLE IF NOT EXISTS "Genre" (
    id serial PRIMARY KEY,
    title VARCHAR (100) NOT NULL,
    description text
);

CREATE TABLE IF NOT EXISTS "BookGenre" (
    id serial PRIMARY KEY,
    book_id integer NOT NULL,
    genre_id integer NOT NULL,
    FOREIGN KEY (book_id) REFERENCES "Book" (id),
	FOREIGN KEY (genre_id) REFERENCES "Genre" (id)
);

CREATE TABLE IF NOT EXISTS "Order" (
    id serial PRIMARY KEY,
    comment text,
    customer_id integer NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES "Customer" (id)
);

CREATE TABLE IF NOT EXISTS "Order_book" (
    id serial PRIMARY KEY,
    order_id integer NOT NULL,
    book_id integer NOT NULL,
    FOREIGN KEY (order_id) REFERENCES "Order" (id),
	FOREIGN KEY (book_id) REFERENCES "Book" (id)
);

CREATE TABLE IF NOT EXISTS "Payment" (
    id serial PRIMARY KEY,
    quantity integer NOT NULL,
    payment_date TIMESTAMP with time zone NOT NULL,
    payment_amount numeric(10,2) NOT NULL,
    order_id integer NOT NULL,
    FOREIGN KEY (order_id) REFERENCES "Order" (id)
);