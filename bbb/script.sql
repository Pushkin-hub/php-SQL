ATTACH DATABASE 'first.db';

CREATE TABLE 'Companies' (
company_id INTEGER NOT NULL,
company_name TEXT NOT NULL,
founded_year DATE NOT NULL);

INSERT INTO Companies (company_name, founded_year) VALUES 
('Гастраном', '22-09-2000'),
();

CREATE TABLE 'Departments' (
dept_id INTEGER NOT NULL,
dept_name TEXT NOT NULL,
company_id INTEGER,
PRIMARY KEY ('dept_id' AUTOINCREMENT)
FOREIGN KEY ('company_id') REFERENCES 'Companies' ('company_id'));




CREATE TABLE 'Empoyees' (
emp_id INTEGER NOT NULL,
emp_name TEXT NOT NULL,
hire_date DATE NOT NULL,
dept_id INTEGER,
PRIMARY KEY ('emp_id' AUTOINCREMENT)
FOREIGN KEY ('dept_id') REFERENCES 'Departments' ('dept_id'));




CREATE TABLE 'Projects' (
project_id INTEGER NOT NULL,
project_name TEXT NOT NULL,
budget INTEGER,
dept_id INTEGER,
PRIMARY KEY ('project_id' AUTOINCREMENT)
FOREIGN KEY ('dept_id') REFERENCES 'Departments' ('dept_id'));


DROP TABLE Projects;



