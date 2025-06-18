ATTACH DATABASE 'database.sqlite';

CREATE TABLE IF NOT EXISTS 'Students' (
id INT PRIMARY KEY AUTOINCREMENT,
full_name TEXT NOT NULL,
sity TEXT NOT NULL);

INSERT INTO Students (full_name, city) VALUES ('Петр Петрович Петров', 'Краснодар');

INSERT INTO Students (full_name, city) VALUES ('Гадя Петрович Хреново', 'Гадюкина');

SELECT * FROM Students;