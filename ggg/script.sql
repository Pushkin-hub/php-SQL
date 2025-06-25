ATTACH DATABASE 'first.db';

CREATE TABLE IF NOT EXISTS 'authors'(
author_id INTEGER PRIMARY KEY AUTOINCREMENT,
author_name TEXT NOT NULL,
birth_year INTEGER DATE NOT NULL);

INSERT INTO authors (author_name, birth_year) VALUES
('Лев Толстой', '09.09.1828');

INSERT INTO authors (author_name, birth_year) VALUES
('Джордж Оруэлл', '25.06.1903');

INSERT INTO authors (author_name, birth_year) VALUES
('Джеймс Джойс', '02.02.1882');

INSERT INTO authors (author_name, birth_year) VALUES
('Владимир Набоков', '22.04.1899');

CREATE TABLE IF NOT EXISTS 'genres'(
genres_id INTEGER PRIMARY KEY AUTOINCREMENT,
genres_name TEXT NOT NULL);

INSERT INTO genres (genres_name) VALUES
('Роман');

INSERT INTO genres (genres_name) VALUES
('Фантастика');

INSERT INTO genres (genres_name) VALUES
('Фикшн');

INSERT INTO genres (genres_name) VALUES
('Психилогический реализм');

CREATE TABLE IF NOT EXISTS 'books'(
book_id INTEGER PRIMARY KEY AUTOINCREMENT,
title TEXT NOT NULL,
author_id INTEGER NOT NULL,
year_published INTEGER DATE NOT NULL,
pages INTEGER NOT NULL,
genre_id INTEGER NOT NULL);

INSERT INTO books (title, author_id, year_published, pages, genre_id) VALUES
('Война и мир', 1, 1867, 1360, 1);

INSERT INTO books (title, author_id, year_published, pages, genre_id) VALUES
('1984', 2, 1949, 352, 2);

INSERT INTO books (title, author_id, year_published, pages, genre_id) VALUES
('Улисс', 3, 1920, 928, 3);

INSERT INTO books (title, author_id, year_published, pages, genre_id) VALUES
('Лолита', 4, 1955, 544, 4);

SELECT * FROM authors;
SELECT * FROM genres;
SELECT * FROM books;

SELECT title, year_published FROM books
ORDER BY year_published DESC;

SELECT title, pages FROM books WHERE pages > 500;

SELECT title, year_published FROM books WHERE year_published < 1900;

SELECT title FROM books WHERE title > 10;

SELECT genre_id FROM books;

SELECT title FROM books WHERE title LIKE '%и%';

SELECT title, year_published FROM books WHERE year_published BETWEEN 1830 AND 1880;

DELETE FROM books WHERE book_id=5;

UPDATE books SET genre_id=4 WHERE book_id=4;