ATTACH DATABASE 'first.db';

CREATE TABLE IF NOT EXISTS 'student_and_grade'(
id INTEGER PRIMARY KEY AUTOINCREMENT,
full_name TEXT NOT NULL,
city TEXT NOT NULL,
birth_data DATE NOT NULL,
email TEXT UNIQUE NOT NULL,
grade REAL CHECK (grade BETWEEN 0 AND 10));

INSERT INTO student_and_grade (full_name, city, birth_data, email, grade) VALUES
('Петр Петров', 'Краснодар', '2000-05-15', 'petrov@mail.ru', 7);

INSERT INTO student_and_grade (full_name, city, birth_data, email, grade) VALUES
('Михаил Мишин', 'Москва', '2001-08-12', 'mishin@mail.ru', 10);

INSERT INTO student_and_grade (full_name, city, birth_data, email, grade) VALUES
('Остап Остапов', 'Волгоград', '2001-08-12', 'ostapov@mail.ru', 9);

SELECT * FROM student_and_grade;
SELECT full_name, email FROM student_and_grade;
SELECT * FROM student_and_grade WHERE id=1;
SELECT * FROM student_and_grade WHERE birth_data='2001-08-12';
SELECT * FROM student_and_grade WHERE city='Краснодар';
SELECT * FROM student_and_grade WHERE grade > 9;

DROP TABLE student_and_grade;