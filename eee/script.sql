ATTACH DATABASE 'first.db';

CREATE TABLE Movies (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    duration INT,          -- длительность в минутах
    rating DECIMAL(3,1),   -- рейтинг, например 8.5
    tickets_sold INT
);

INSERT INTO Movies (id, title, genre, duration, rating, tickets_sold) VALUES
(1, 'Зарождение', 'Научная фантастика', 148, 8.8, 120000),
(2, 'Крестный отец', 'Преступление', 175, 9.2, 95000),
(3, 'История игрушек', 'Анимация', 81, 8.3, 80000),
(4, 'Титаник', 'Романтика', 195, 7.8, 110000),
(5, 'Мстители: Финал', 'Фантастика', 181, 8.4, 150000),
(6, 'Паразит', 'Триллер', 132, 8.6, 70000),
(7, 'Темный рыцарь', 'Фантастика', 152, 9.0, 130000);

UPDATE Movies SET tickets_sold = tickets_sold + 500;

UPDATE Movies SET rating = 0 WHERE title = 'Название_фильма';

UPDATE Movies SET rating = 8.5 WHERE title = 'Название_фильма';

ALTER TABLE Movies ADD COLUMN release_year INT;

UPDATE Movies SET release_year = 2010 WHERE title = 'Зарождение';
UPDATE Movies SET release_year = 1972 WHERE title = 'Крестный отец';
UPDATE Movies SET release_year = 1995 WHERE title = 'История игрушек';
UPDATE Movies SET release_year = 1997 WHERE title = 'Титаник';
UPDATE Movies SET release_year = 2019 WHERE title = 'Мстители: Финал';
UPDATE Movies SET release_year = 2019 WHERE title = 'Паразит';
UPDATE Movies SET release_year = 2008 WHERE title = 'Темный рыцарь';

ALTER TABLE Movies ADD COLUMN is_blockbuster INTEGER DEFAULT 0;

UPDATE Movies SET is_blockbuster = 1 WHERE tickets_sold > 7000;

ALTER TABLE Movies RENAME COLUMN rating TO imdb_rating;

ALTER TABLE Movies RENAME TO CinemaMovies;

ALTER TABLE CinemaMovies ADD COLUMN added_at DATE;

UPDATE CinemaMovies SET added_at = DATE('now');

ALTER TABLE CinemaMovies ADD COLUMN language VARCHAR(50);

UPDATE CinemaMovies SET language = 'French' WHERE title = 'Название_фильма';

UPDATE CinemaMovies SET duration = duration + 10 WHERE genre = 'Жанр';

UPDATE CinemaMovies SET imdb_rating = 9.0 WHERE tickets_sold > 9000;

DELETE FROM CinemaMovies WHERE imdb_rating < 4.0;

ALTER TABLE CinemaMovies ADD COLUMN price DECIMAL(5,2);

UPDATE CinemaMovies SET price = CASE WHEN duration > 150 THEN 15.00 ELSE 10.00 END;

ALTER TABLE CinemaMovies ADD COLUMN subtitles INTEGER DEFAULT 0;

UPDATE CinemaMovies SET subtitles = 0 WHERE title = 'Зарождение';

ALTER TABLE CinemaMovies DROP COLUMN subtitles;

DELETE FROM CinemaMovies WHERE release_year < 2005;

SELECT * FROM CinemaMovies;














