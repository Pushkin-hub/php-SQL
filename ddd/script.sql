ATTACH DATABASE 'first.db';

CREATE TABLE Books (
    books_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    genre TEXT,
    year_published INTEGER CHECK (year_published > 0));

INSERT INTO Books (title, author, genre, year_published) VALUES
('1984', 'Джордж Оруэлл', 'Антиутопический', 1949),
('Убить пересмешника', 'Харпер Ли', 'Вымысел', 1960),
('Великий Гэтсби', 'Ф. Скотт Фицджеральд', 'Классический', 1925),
('Моби Дик', 'Герман Мелвилл', 'Приключение', 1851),
('Война и мир', 'Лев Толстой', 'Историческая фантастика', 1869);

CREATE TABLE Member (
    member_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    join_date DATE NOT NULL,
    active INTEGER NOT NULL);

INSERT INTO Member (name, email, join_date, active) VALUES
('Михаил Абрамов', 'miha@example.com', '2023-01-15', 1),
('Алексей Васильев', 'lehavasya@example.com', '2023-02-20', 1),
('Сергей Захаров', 'serejka@example.com', '2023-03-10', 0),
('Адриана Грейс', 'adriana001@example.com', '2023-04-05', 1),
('Юрий Акзамов', 'akzamov21@example.com', '2023-05-25', 0);

CREATE TABLE Loan (
    loan_id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id INTEGER,
    member_id INTEGER,
    loan_date DATE NOT NULL,
    return_date DATE NOT NULL);

INSERT INTO Loan (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2023-06-01', '2023-06-15'),
(2, 2, '2023-06-05', '2023-06-20'),
(3, 1, '2023-06-10', '2024-01-22'),
(4, 3, '2023-06-12', '2023-06-26'),
(5, 4, '2023-06-15', '2024-05-15');

CREATE TABLE Fines (
    fine_id INTEGER PRIMARY KEY AUTOINCREMENT,
    loan_id INTEGER,
    member_id INTEGER,
    amount INTEGER,
    paid INTEGER,
    fine_date DATE NOT NULL);

INSERT INTO Fines (loan_id, member_id, amount, paid, fine_date) VALUES
(1, 1, 5.00, 0, '2023-06-16'),
(2, 2, 3.50, 1, '2023-06-21'),
(4, 3, 7.25, 0, '2023-06-27'),
(3, 1, 2.00, 0, '2023-06-20'),
(5, 4, 4.75, 1, '2023-06-30');



SELECT * FROM Books;
SELECT * FROM Member;
SELECT * FROM Loan;
SELECT * FROM Fines;

DELETE FROM Member;
DROP TABLE Member;

