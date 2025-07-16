ATTACH DATABASE 'first.db';

CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    birth_date DATE,
    phone TEXT,
    email TEXT,
    reg_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO Clients (first_name, last_name, birth_date, phone, email, reg_date) VALUES
('Иван', 'Иванов', '1985-03-12', '+79161234567', 'ivan.ivanov@mail.com', '2023-01-10'),
('Мария', 'Петрова', '1990-07-25', '+79161234568', 'maria.petrova@mail.com', '2023-02-15'),
('Алексей', 'Сидоров', '1988-11-05', '+79161234569', 'alex.sidorov@mail.com', '2023-03-20'),
('Елена', 'Кузнецова', '1995-06-30', '+79161234570', 'elena.kuznetsova@mail.com', '2023-04-10'),
('Дмитрий', 'Новиков', '1982-09-17', '+79161234571', 'dmitry.novikov@mail.com', '2023-05-05'),
('Ольга', 'Васильева', '1993-12-22', '+79161234572', 'olga.vasilieva@mail.com', '2023-06-01'),
('Сергей', 'Морозов', '1987-04-14', '+79161234573', 'sergey.morozov@mail.com', '2023-07-07');

CREATE TABLE Trainers (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty TEXT,
    phone TEXT,
    email TEXT
);

INSERT INTO Trainers (first_name, last_name, specialty, phone, email) VALUES
('Андрей', 'Смирнов', 'Йога', '+79160001111', 'andrey.smirnov@mail.com'),
('Наталья', 'Федорова', 'Пилатес', '+79160002222', 'natalia.fedorova@mail.com'),
('Виктор', 'Козлов', 'Силовые тренировки', '+79160003333', 'viktor.kozlov@mail.com'),
('Оксана', 'Лебедева', 'Кардиотренировки', '+79160004444', 'oksana.lebedeva@mail.com'),
('Павел', 'Новиков', 'Бокс', '+79160005555', 'pavel.novikov@mail.com'),
('Ирина', 'Крылова', 'Танцы', '+79160006666', 'irina.krylova@mail.com'),
('Максим', 'Орлов', 'Функциональный тренинг', '+79160007777', 'maxim.orlov@mail.com');

CREATE TABLE Subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    type TEXT,
    price TEXT,
    CONSTRAINT fk_sub_client FOREIGN KEY (client_id) REFERENCES Clients(client_id) ON DELETE CASCADE
);

INSERT INTO Subscriptions (client_id, start_date, end_date, type, price) VALUES
(1, '2023-01-10', '2023-04-10', '3 месяца', 9000.00),
(2, '2023-02-15', '2023-05-15', '3 месяца', 9000.00),
(3, '2023-03-20', '2023-09-20', '6 месяцев', 17000.00),
(4, '2023-04-10', '2023-10-10', '6 месяцев', 17000.00),
(5, '2023-05-05', '2024-05-05', 'Годовой', 30000.00),
(6, '2023-06-01', '2023-09-01', '3 месяца', 9000.00),
(7, '2023-07-07', '2023-10-07', '3 месяца', 9000.00);

CREATE TABLE GroupClasses (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name TEXT NOT NULL,
    trainer_id INT NOT NULL,
    schedule DATETIME NOT NULL,
    duration_minutes INT NOT NULL,
    max_participants INT NOT NULL,
    CONSTRAINT fk_class_trainer FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id) ON DELETE SET NULL
);

INSERT INTO GroupClasses (class_name, trainer_id, schedule, duration_minutes, max_participants) VALUES
('Йога для начинающих', 1, '2023-08-01 09:00:00', 60, 15),
('Пилатес', 2, '2023-08-01 11:00:00', 60, 12),
('Силовые тренировки', 3, '2023-08-02 18:00:00', 90, 10),
('Кардио микс', 4, '2023-08-03 07:00:00', 45, 20),
('Бокс для всех', 5, '2023-08-04 19:00:00', 60, 15),
('Танцевальная аэробика', 6, '2023-08-05 17:00:00', 50, 25),
('Функциональный тренинг', 7, '2023-08-06 08:00:00', 60, 15);

CREATE TABLE Visits (
    visit_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    class_id INT NOT NULL,
    visit_date DATETIME NOT NULL,
    CONSTRAINT fk_visit_client FOREIGN KEY (client_id) REFERENCES Clients(client_id) ON DELETE CASCADE,
    CONSTRAINT fk_visit_class FOREIGN KEY (class_id) REFERENCES GroupClasses(class_id) ON DELETE CASCADE,
    CONSTRAINT uc_client_class_date UNIQUE (client_id, class_id, visit_date)
);

INSERT INTO Visits (client_id, class_id, visit_date) VALUES
(1, 1, '2023-08-01 09:00:00'),
(2, 2, '2023-08-01 11:00:00'),
(3, 3, '2023-08-02 18:00:00'),
(4, 4, '2023-08-03 07:00:00'),
(5, 5, '2023-08-04 19:00:00'),
(6, 6, '2023-08-05 17:00:00'),
(7, 7, '2023-08-06 08:00:00');



