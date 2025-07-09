ATTACH DATABASE 'first.db';

CREATE TABLE Companies (
company_id INTEGER NOT NULL,
company_name TEXT NOT NULL,
founded_year DATE NOT NULL);

INSERT INTO Companies (company_name, founded_year) VALUES 
('Гастраном', '22-09-2000'),
('СТМУ', '17-03-1999');

CREATE TABLE Departments (
dept_id INTEGER NOT NULL,
dept_name TEXT NOT NULL,
company_id INTEGER,
PRIMARY KEY ('dept_id' AUTOINCREMENT)
FOREIGN KEY ('company_id') REFERENCES 'Companies' ('company_id'));




CREATE TABLE Empoyees (
emp_id INTEGER NOT NULL,
emp_name TEXT NOT NULL,
hire_date DATE NOT NULL,
dept_id INTEGER,
PRIMARY KEY ('emp_id' AUTOINCREMENT)
FOREIGN KEY ('dept_id') REFERENCES 'Departments' ('dept_id'));




CREATE TABLE Projects (
project_id INTEGER NOT NULL,
project_name TEXT NOT NULL,
budget INTEGER,
dept_id INTEGER,
PRIMARY KEY ('project_id' AUTOINCREMENT)
FOREIGN KEY ('dept_id') REFERENCES 'Departments' ('dept_id'));


DROP TABLE Companies;
DROP TABLE Departments;
DROP TABLE Empoyees;
DROP TABLE Projects;


SELECT * FROM Companies;

SELECT dept_mane, company_id FROM Departments;

SELECT emp_name, dept_id FROM Employees;

SELECT project_name, dept_id FROM Projects;

SELECT emp_name FROM Employees WHERE hire_date > '01-01-2020';

SELECT dept_id, COUNT (emp_id) AS employee_count FROM Employyes GROUP BY dept_id;

SELECT dept_id, SUM (budget) AS total_budget FROM Projects GROUP BY dept_id;

SELECT dept_id, AVG (budget) AS avg_budget FROM Projects GROUP BY dept_id;

SELECT DISTINCT company_id FROM Departments WHERE dept_id IN (SELECT dept_id FROM Projects);

SELECT DISTINCT emp_name FROM Employyes WHERE dept_id NOT IN (SELECT dept_id FROM Projects);

SELECT dept_id, COUNT (*) AS project_count FROM Projects GROUP BY dept_id;

SELECT company_name FROM Companies WHERE founded_year > 2000;

SELECT project_name, budget FROM Projects ORDER BY budget DESC LIMIT 1;

SELECT SUM (budget) FROM Projects WHERE dept_id IN (SELECT dept_id FROM Departments WHERE company_id = 2);



