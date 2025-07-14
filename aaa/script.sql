ATTACH DATABASE 'first.db';

CREATE TABLE IF NOT EXISTS Clients (
    ClientID INTEGER PRIMARY KEY,
    Name TEXT,
    Email TEXT);

INSERT INTO Clients (ClientID, Name, Email) VALUES 
(1, 'Иван Иванов', 'ivan@ya.ru'),
(2, 'Мария Петрова', 'mary@ya.ru'),
(3, 'Денис Орешников', 'den@ya.ru'),
(4, 'Путр Семенов', 'petr@ya.ru'),
(5, 'Елена Воробьева', 'elena@ya.ru'),
(6, 'Дамир Гаримов', 'damir@ya.ru'),
(7, 'Лилия Захарова', 'lili@ya.ru');

CREATE TABLE IF NOT EXISTS Orders (
OrderID INTEGER PRIMARY KEY,
ClientID INTEGER,
Product TEXT,
Price REAL,
FOREIGN KEY (ClientID) REFERENCES Clients (ClientID));

INSERT INTO Orders (OrderID, ClientID, Product, Price) VALUES 
(101, 1, 'Монитор', 25000),
(102, 2, 'Клавиатура', 4200),
(103, 3, 'Мышь', 1700),
(104, 4, 'HDD', 3800),
(105, 5, 'Наушники', 7400),
(106, 6, 'SSD', 5300),
(107, 7, 'Коврик', 250);

SELECT Clients.Name, Orders.Product 
FROM Clients 
INNER JOIN Orders ON Clients.ClientID=Orders.ClientID;

DROP TABLE Orders;

SELECT Orders.Product, Clients.Name 
FROM Orders 
LEFT JOIN Clients ON Clients.ClientID=Orders.ClientID;

SELECT Clients.Name, COUNT (OrderID) AS OrderCount
FROM Clients
LEFT JOIN Orders ON Clients.ClientID=Orders.ClientID;







