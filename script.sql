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
-- WHERE - фильтрация по условию. 

SELECT * FROM empioes WHERE salary > 50000;

-- LIKE - поиск строк по шаблону % 
-- % - любое количество символов

SELECT email FROM student_and_grade WHERE email LIKE '%shin%';
SELECT * FROM student_and_grade WHERE city LIKE '%о%';
SELECT * FROM student_and_grade WHERE birth_data LIKE '20%';

-- ORDER BY - Сортирует значение по 1 или нескольким столбцам
-- ASC - сортирует по возростанию 
-- DESC - сортирует по выбыванию

SELECT full_name, phone FROM employees
ORDER BY full_name ASC;
-- выбираем имя и телефон
-- сортируем по имени в алфовитном порядке

SELECT full_name, city FROM student_and_grade
ORDER BY city DESC;

-- GROUP BY - используется для объединения строк по 1 или нескольких столбцов

SELECT city AS c FROM student_and_grade
GROUP BY city;

-- Агрегатные функции:
-- COUNT () - считает строки
-- SUM () - суммируются значения
-- AVG () - среднее значение
-- MIN () - минимальное значение
-- MAX () - максимально значение
-- AS - задаем псевдоним
-- JULIANDAY - возвращает число дней
-- JULIANDAY (finish_data) - JULIANDAY (start_data) 

-- DIATANCT - получаем уникальные значения


-- Арифмитичемкие операторы:
-- - (discount-10)
-- + (prise+10)

-- Операторы сравнения:
-- < - меньше
-- > - больше
-- <= - меньше или равно
-- >= - больше или равно
-- = - равно
-- <> - не равно (!=)

-- Логические операторы:
-- AND
-- OR
-- NOT

-- IN - проверка на содержание значения
-- IS NUL / IS NOT NULL - проверка NULL

-- INSERT OR IGNORE INTO

-- PRIMARY KEY - первичный ключ
-- Не допускается NOT NULL
-- В таблице допускается только один PRIMARY KEY

-- CREATE TABLE student (
--     id INT PRIMARY KEY,
--     name TEXT NOT NULL)

-- FOREIGN KEY - Вторичный ключ
-- Ссылается на первичный ключ другой таблицы
-- Обеспечивает целосность данных
-- Используется для создания связей между таблицами

-- ПРИМЕР:
-- CREATE TABLE Enrollments (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     student_id INTEGER,
--     course_id INTEGER,
--     FOREIGN KEY (student_id) REFERENCES students (student_id),
--     FOREIGN KEY (course_id) REFERENCES students (course_id));

-- ON DELETE
-- ON UPDATE

-- SELECT * (SELECT);

-- 1. Скалярные значения (одно единственное значение)
-- возвращает одно значение
-- имеет конкретный тип данных

-- В SEKECT:

-- SELECT product_name, (SELECT MAX(price)FROM prodects) AS max_price FROM prodects;

-- 2. Множество значений

-- 3. Целую таблицу

-- Разбор конкретного запроса:

-- SELECT project_name FROM Projects WHERE dept_id IN (
-- SELECT dept_id FROM Departments WHERE dept_id NOT IN (
-- SELECT dept_id FROM Employees));

-- INNER JOIN - возвращает строки, которые имеют совпадения в обоих таблицах
-- LEFT JOIN - возвращает все строки из левой таблицы и совпадающие из правой
-- RIGHT JOIN - возвращает все строки из правой таблицы и совпадающие из левой
-- FULL JOIN - возвращает все строки, когда есть совпадения, хотя бы в одной из таблиц
-- CROSS JOIN - декартово произведение: каждая строка из первой таблици соединяется с каждой из второй таблицы

-- UNION - соединяет без дублирования
-- UNION ALL - соединяет с дублированием

-- SELECT * FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name


-- UPDATE table_name SET column_1 = value_1 WHERE condition;
-- UPDATE - указывает таблицу, которую мы хотим изменить
-- SET - указывает новые столбцы
-- WHERE - фильтрует строки, которые будут обновлены

-- CASE - позволяет возвращать значения в зависимости от условий
















