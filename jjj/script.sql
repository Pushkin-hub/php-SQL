ATTACH DATABASE 'first.db';

-- Guests (Гости) - хранит информацию о гостях отеля
CREATE TABLE Guests (
    guest_id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    phone TEXT,
    email TEXT,
    passport_number TEXT UNIQUE
);

INSERT INTO Guests (full_name, phone, email, passport_number) VALUES
('Иван Иванов', '+79991234567', 'ivanov@example.com', '1234567890'),
('Мария Петрова', '+79997654321', 'petrova@example.com', '2345678901'),
('Алексей Смирнов', '+79990001122', 'smirnov@example.com', '3456789012'),
('Елена Кузнецова', '+79998887766', 'kuznetsova@example.com', '4567890123'),
('Дмитрий Соколов', '+79995553322', 'sokolov@example.com', '5678901234'),
('Ольга Васильева', '+79991112233', 'vasilieva@example.com', '6789012345'),
('Сергей Михайлов', '+79994445566', 'mihailov@example.com', '7890123456'),
('Наталья Федорова', '+79993332211', 'fedorova@example.com', '8901234567'),
('Павел Новиков', '+79992221100', 'novikov@example.com', '9012345678'),
('Анна Морозова', '+79990009900', 'morozova@example.com', '0123456789'),
('Виктор Козлов', '+79998880011', 'kozlov@example.com', '1122334455'),
('Татьяна Орлова', '+79997770022', 'orlova@example.com', '2233445566'),
('Константин Лебедев', '+79996660033', 'lebedev@example.com', '3344556677'),
('Ирина Соколова', '+79995550044', 'sokolova@example.com', '4455667788'),
('Андрей Григорьев', '+79994440055', 'grigorev@example.com', '5566778899');

-- RoomTypes (Типы номеров) - типы номеров (стандарт, люкс и т.д.)
CREATE TABLE RoomTypes (
    room_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    type_name TEXT NOT NULL,
    description TEXT,
    price_per_night DECIMAL NOT NULL
);

INSERT INTO RoomTypes (type_name, description, price_per_night) VALUES
('Стандарт', 'Одноместный номер с базовыми удобствами', 2500),
('Стандарт', 'Двухместный номер с базовыми удобствами', 3500),
('Полулюкс', 'Улучшенный номер с дополнительной мебелью', 4500),
('Люкс', 'Просторный номер с гостиной зоной', 7000),
('Апартаменты', 'Номер с кухней и отдельной спальней', 9000),
('Стандарт', 'Одноместный номер с видом на парк', 2700),
('Стандарт', 'Двухместный номер с видом на город', 3600),
('Полулюкс', 'Номер с балконом и видом на море', 4800),
('Люкс', 'Номер с джакузи и панорамным окном', 7500),
('Апартаменты', 'Двухкомнатные апартаменты с кухней', 9500),
('Стандарт', 'Одноместный номер с кондиционером', 2600),
('Стандарт', 'Двухместный номер с кондиционером', 3700),
('Полулюкс', 'Номер с мини-баром и сейфом', 4600),
('Люкс', 'Номер с камином и мини-баром', 7200),
('Апартаменты', 'Апартаменты с двумя спальнями', 10000);

-- RoomStatus (Статусы номеров) - статусы номеров (свободен, занят, на ремонте)
CREATE TABLE RoomStatus (
    status_id INTEGER PRIMARY KEY AUTOINCREMENT,
    status_name TEXT NOT NULL
);

INSERT INTO RoomStatus (status_name) VALUES
('Свободен'),
('Занят'),
('На ремонте'),
('Забронирован'),
('В ожидании уборки'),
('Заблокирован'),
('Резерв'),
('Техническое обслуживание'),
('Занят гостем'),
('Ожидание заселения'),
('Занят персоналом'),
('Временно закрыт'),
('Проверка качества'),
('Подготовка к заселению'),
('Забронирован с предоплатой');

-- Rooms (Номера) - содержит данные о номерах отеля
CREATE TABLE Rooms (
    room_id INTEGER PRIMARY KEY AUTOINCREMENT,
    room_number TEXT UNIQUE NOT NULL,
    room_type_id INTEGER NOT NULL,
    status_id INTEGER NOT NULL,
    FOREIGN KEY (room_type_id) REFERENCES RoomTypes(room_type_id),
    FOREIGN KEY (status_id) REFERENCES RoomStatus(status_id)
);

INSERT INTO Rooms (room_number, room_type_id, status_id) VALUES
('101', 1, 1),
('102', 2, 1),
('103', 3, 2),
('104', 4, 1),
('105', 5, 3),
('201', 1, 1),
('202', 2, 4),
('203', 3, 1),
('204', 4, 2),
('205', 5, 1),
('301', 1, 1),
('302', 2, 1),
('303', 3, 5),
('304', 4, 1),
('305', 5, 1);

-- Departments (Отделы) - отделы отеля (например, уборка, ресепшен) — для связи с сотрудниками
CREATE TABLE Departments (
    department_id INTEGER PRIMARY KEY AUTOINCREMENT,
    department_name TEXT NOT NULL
);

INSERT INTO Departments (department_name) VALUES
('Ресепшен'),
('Уборка'),
('Ресторан'),
('Технический отдел'),
('Администрация'),
('Безопасность'),
('Маркетинг'),
('Бухгалтерия'),
('Сервисное обслуживание'),
('Отдел продаж'),
('ИТ отдел'),
('HR'),
('Логистика'),
('Склад'),
('Обслуживание номеров');

-- Employees (Сотрудники) - сотрудники отеля (администраторы, горничные и т.п.)
CREATE TABLE Employees (
    employee_id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    position TEXT NOT NULL,
    department_id INTEGER NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Employees (full_name, position, department_id) VALUES
('Анна Белова', 'Администратор', 1),
('Игорь Смирнов', 'Горничный', 2),
('Ольга Крылова', 'Официант', 3),
('Владимир Петров', 'Инженер', 4),
('Елена Сидорова', 'Менеджер', 5),
('Сергей Иванов', 'Охранник', 6),
('Марина Алексеева', 'Маркетолог', 7),
('Дмитрий Козлов', 'Бухгалтер', 8),
('Александр Воронов', 'Техник', 9),
('Наталья Фомина', 'Менеджер по продажам', 10),
('Павел Орлов', 'Программист', 11),
('Татьяна Лебедева', 'HR-специалист', 12),
('Юрий Захаров', 'Логист', 13),
('Ирина Морозова', 'Кладовщик', 14),
('Виктор Кузнецов', 'Официант', 3);

-- EmployeeDetails (Доп. данные о сотрудниках) - дополнительная информация о сотрудниках (например, паспортные данные)
CREATE TABLE EmployeeDetails (
    employee_id INTEGER PRIMARY KEY,
    passport_number TEXT NOT NULL,
    address TEXT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO EmployeeDetails (employee_id, passport_number, address) VALUES
(1, '4500123456', 'г. Москва, ул. Ленина, д.10'),
(2, '4501123456', 'г. Москва, ул. Пушкина, д.5'),
(3, '4502123456', 'г. Москва, ул. Чехова, д.7'),
(4, '4503123456', 'г. Москва, ул. Горького, д.12'),
(5, '4504123456', 'г. Москва, ул. Маяковского, д.3'),
(6, '4505123456', 'г. Москва, ул. Тверская, д.9'),
(7, '4506123456', 'г. Москва, ул. Крылова, д.4'),
(8, '4507123456', 'г. Москва, ул. Лермонтова, д.6'),
(9, '4508123456', 'г. Москва, ул. Садовая, д.11'),
(10, '4509123456', 'г. Москва, ул. Новая, д.8'),
(11, '4510123456', 'г. Москва, ул. Речная, д.2'),
(12, '4511123456', 'г. Москва, ул. Озёрная, д.1'),
(13, '4512123456', 'г. Москва, ул. Пионерская, д.13'),
(14, '4513123456', 'г. Москва, ул. Лесная, д.14'),
(15, '4514123456', 'г. Москва, ул. Полевая, д.15');

-- Reservations (Бронирования) - информация о бронированиях гостей
CREATE TABLE Reservations (
    reservation_id INTEGER PRIMARY KEY AUTOINCREMENT,
    guest_id INTEGER NOT NULL,
    room_id INTEGER NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    employee_id INTEGER NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Reservations (guest_id, room_id, check_in_date, check_out_date, employee_id) VALUES
(1, 1, '2024-07-01', '2024-07-05', 1),
(2, 2, '2024-07-03', '2024-07-07', 1),
(3, 3, '2024-07-10', '2024-07-12', 5),
(4, 4, '2024-07-15', '2024-07-20', 1),
(5, 5, '2024-07-18', '2024-07-22', 1),
(6, 6, '2024-07-05', '2024-07-08', 2),
(7, 7, '2024-07-09', '2024-07-14', 1),
(8, 8, '2024-07-11', '2024-07-13', 5),
(9, 9, '2024-07-20', '2024-07-25', 1),
(10, 10, '2024-07-21', '2024-07-23', 1),
(11, 11, '2024-07-22', '2024-07-26', 1),
(12, 12, '2024-07-24', '2024-07-28', 1),
(13, 13, '2024-07-25', '2024-07-30', 1),
(14, 14, '2024-07-27', '2024-07-31', 1),
(15, 15, '2024-07-29', '2024-08-02', 1);

-- Services (Услуги) - дополнительные услуги, предоставляемые отелем (например, спа, завтрак)
CREATE TABLE Services (
    service_id INTEGER PRIMARY KEY AUTOINCREMENT,
    service_name TEXT NOT NULL,
    description TEXT,
    price DECIMAL NOT NULL
);

INSERT INTO Services (service_name, description, price) VALUES
('Завтрак', 'Шведский стол с горячими блюдами', 500),
('Трансфер', 'Трансфер из аэропорта', 1500),
('СПА', 'Посещение SPA-комплекса', 2000),
('Прачечная', 'Стирка и глажка одежды', 300),
('Экскурсия', 'Обзорная экскурсия по городу', 2500),
('Уборка номера', 'Дополнительная уборка по запросу', 400),
('Мини-бар', 'Пополнение мини-бара', 700),
('Ранний заезд', 'Заселение до 12:00', 1000),
('Поздний выезд', 'Выезд после 14:00', 1000),
('Парковка', 'Место на охраняемой парковке', 600),
('Wi-Fi', 'Высокоскоростной интернет', 0),
('Питание в номере', 'Доставка еды в номер', 800),
('Тренажерный зал', 'Посещение спортзала', 500),
('Детская кроватка', 'Аренда детской кроватки', 300),
('Прокат велосипедов', 'Аренда велосипеда на сутки', 700);

-- ReservationServices (Связь бронирований и услуг) - связующая таблица для многих ко многим между бронированиями и услугами
CREATE TABLE ReservationServices (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    reservation_id INTEGER NOT NULL,
    service_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

INSERT INTO ReservationServices (reservation_id, service_id, quantity) VALUES
(1, 1, 4),
(1, 2, 1),
(2, 1, 4),
(2, 5, 2),
(3, 3, 1),
(4, 1, 5),
(4, 6, 1),
(5, 1, 4),
(6, 1, 3),
(7, 2, 1),
(8, 4, 1),
(9, 1, 5),
(10, 7, 2),
(11, 8, 1),
(12, 9, 1);

CREATE TRIGGER trg_check_room_availability
BEFORE INSERT ON Reservations
FOR EACH ROW
BEGIN
    SELECT
    CASE
        WHEN EXISTS (
            SELECT 1 FROM Reservations r
            WHERE r.room_id = NEW.room_id
              AND NOT (NEW.check_out_date <= r.check_in_date OR NEW.check_in_date >= r.check_out_date)
        )
        THEN RAISE(ABORT, 'Комната уже забронирована на эти даты')
    END;
END; -- не уверен правильно ли я написал триггер

SELECT * FROM Guests;
SELECT * FROM RoomTypes;
SELECT * FROM RoomStatus;
SELECT * FROM Rooms;
SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT * FROM EmployeeDetails;
SELECT * FROM Reservations;
SELECT * FROM Services;
SELECT * FROM ReservationServices;

SELECT full_name, phone, email FROM Guests;

SELECT room_number, type_name FROM Rooms
JOIN RoomTypes ON Rooms.room_type_id = RoomTypes.room_type_id;

SELECT service_name, price FROM Services;

SELECT full_name, position FROM Employees
JOIN Departments ON Employees.department_id = Departments.department_id
WHERE department_name = 'Ресепшен';

SELECT * FROM Reservations WHERE guest_id = 1;

SELECT full_name FROM Guests
WHERE guest_id IN (
    SELECT guest_id FROM Reservations
    WHERE julianday(check_out_date) - julianday(check_in_date) > 5
);

SELECT r.reservation_id, g.full_name, rm.room_number, r.check_in_date, r.check_out_date
FROM Reservations r
JOIN Guests g ON r.guest_id = g.guest_id
JOIN Rooms rm ON r.room_id = rm.room_id;

SELECT e.full_name, e.position, d.department_name
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id;

SELECT s.service_name, rs.quantity
FROM ReservationServices rs
JOIN Services s ON rs.service_id = s.service_id
WHERE rs.reservation_id = 10;

SELECT room_number, status_name, type_name
FROM Rooms
JOIN RoomStatus ON Rooms.status_id = RoomStatus.status_id
JOIN RoomTypes ON Rooms.room_type_id = RoomTypes.room_type_id;

SELECT r.reservation_id, g.full_name as guest, e.full_name as employee, r.check_in_date
FROM Reservations r
JOIN Guests g ON r.guest_id = g.guest_id
JOIN Employees e ON r.employee_id = e.employee_id;

SELECT COUNT(*) as total_guests FROM Guests;

SELECT type_name, AVG(price_per_night) as avg_price FROM RoomTypes GROUP BY type_name;

SELECT guest_id, COUNT(*) as reservations_count FROM Reservations GROUP BY guest_id;

SELECT SUM(s.price * rs.quantity) as total_services_cost
FROM ReservationServices rs
JOIN Services s ON rs.service_id = s.service_id
WHERE rs.reservation_id = 5;

SELECT d.department_name, COUNT(e.employee_id) as employee_count
FROM Departments d
LEFT JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name;
















