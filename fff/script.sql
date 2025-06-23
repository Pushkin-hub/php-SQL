ATTACH DATABASE 'first.db';

CREATE TABLE IF NOT EXISTS 'employees'(
id INTEGER PRIMARY KEY AUTOINCREMENT,
full_name TEXT NOT NULL,
position TEXT NOT NULL,
birth_data DATE NOT NULL);

INSERT INTO employees (full_name, position, birth_data) VALUES
('Петр Петров', 'Техник', '2000-05-15');

INSERT INTO employees (full_name, position, birth_data) VALUES
('Михаил Мишин', 'Моляр', '2001-08-12');

INSERT INTO employees (full_name, position, birth_data) VALUES
('Остап Остапов', 'Уборщик', '2001-08-12');

CREATE TABLE IF NOT EXISTS 'departments'(
id INTEGER PRIMARY KEY AUTOINCREMENT,
department_name TEXT NOT NULL,
phone TEXT NOT NULL,
email TEXT NOT NULL);

INSERT INTO departments (department_name, phone, email) VALUES
('Снабжение', '221-16', 'omts@mail.ru');

INSERT INTO departments (department_name, phone, email) VALUES
('ПДО', '222-12', 'pdo@mail.ru');

INSERT INTO departments (department_name, phone, email) VALUES
('ОТК', '223-14', 'otk@mail.ru');

CREATE TABLE IF NOT EXISTS 'projeckts'(
id INTEGER PRIMARY KEY AUTOINCREMENT,
projeckt_name TEXT NOT NULL,
data_p TEXT NOT NULL);

INSERT INTO projeckts (projeckt_name, data_p) VALUES
('Эль-Дабаа', '2017-03-15');

INSERT INTO projeckts (projeckt_name, data_p) VALUES
('AKKUYU', '2020-05-22');

INSERT INTO projeckts (projeckt_name, data_p) VALUES
('Куданкулан', '2024-02-17');

CREATE TABLE IF NOT EXISTS 'tools'(
id INTEGER PRIMARY KEY AUTOINCREMENT,
tool_name TEXT NOT NULL,
number_tool TEXT NOT NULL);

INSERT INTO tools (tool_name, number_tool) VALUES
('Компьютер', '2225658');

INSERT INTO tools (tool_name, number_tool) VALUES
('Стул', '1565845');

INSERT INTO tools (tool_name, number_tool) VALUES
('Стол', '9574864');

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM projeckts;
SELECT * FROM tools;

SELECT full_name, position FROM employees;

SELECT department_name FROM departments;
SELECT email FROM departments;

SELECT * FROM employees WHERE id=1;
SELECT * FROM departments WHERE id=1;
SELECT * FROM projeckts WHERE id=1;
SELECT * FROM tools WHERE id=1;

SELECT * FROM employees WHERE birth_data='2001-08-12';
SELECT * FROM employees WHERE position='Техник';

