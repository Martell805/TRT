INSERT INTO location (name)
VALUES ('Головной офис'),
       ('Офис 2'),
       ('Офис 3'),
       ('Офис 4'),
       ('Офис 5');

INSERT INTO department (name, location_id)
VALUES ('Менеджмент', 1),
       ('Разработка', 2),
       ('Поддержка', 2),
       ('Бухгалтерия', 1),
       ('Маркетинг', 3);

INSERT INTO job (function)
VALUES ('Менеджер'),
       ('Разработчик'),
       ('Специалист поддержки'),
       ('Бухгалтер'),
       ('Маркетолог');

INSERT INTO employee (last_name, first_name, middle_initial, manager_id, job_id, hire_date, salary, commission,
                      department_id)
VALUES ('Менеджер', 'Главный', 'М', 1, 1, '2024-01-01', 10000.00, 1000.00, 1),
       ('Разработчик', 'Тоже-Главный', 'Р', 1, 1, '2024-02-02', 4000.00, 400.00, 2),
       ('Специалист', 'Поддержки', 'С', 1, 3, '2024-03-03', 1000.00, 100.00, 3),
       ('Бухгалтер', 'Кропотливый', 'Б', 1, 4, '2024-04-04', 2000.00, 200.00, 4),
       ('Маркетолог', 'Хитрый', 'М', 1, 5, '2024-05-05', 3000.00, 300.00, 5);

INSERT INTO customer (name, address, city, state, zip_code, area_code, phone_number, salesperson_id, credit_limit,
                      comments)
VALUES ('ООО Партнёр Номер Один', 'ул. Партнёра, д.1', 'Москва', 'МО', '111111', 111, 11111, 5, 100000.00,
        'Самый старый клиент'),
       ('ИП Индивидуальный Предприниматель', 'ул. Индивидуалистов, д.7', 'Москва', 'МО', '123456', 123, 12345, 5,
        10000.00,
        'ИП'),
       ('Правительство', 'Красная площадь, д.1', 'Москва', 'МО', '574675', 685, 12548, 5, 1000000.00,
        'Не отказывать!'),
       ('ОАО Компания', 'ул. Улица, д.20', 'Санкт-Петербург', 'СП', '746465', 863, 27532, 5, 20000.00,
        'Просто клиент'),
       ('ООО Ещё копания', 'ул. Улица, д.14', 'Санкт-Петербург', 'СП', '356356', 754, 16534, 5, 30000.00,
        'Очень много надо придумать(');

INSERT INTO product (description)
VALUES ('Продукт номер один'),
       ('Красивый продукт'),
       ('Полезный продукт'),
       ('Непопулярный продукт'),
       ('Последний продукт');

INSERT INTO price (product_id, list_price, min_price, start_date, end_date)
VALUES (1, 200.0, 150.0, '2024-01-01', '2024-12-31'),
       (2, 500.0, 450.0, '2024-01-01', '2024-12-31'),
       (3, 400.0, 350.0, '2024-01-01', '2024-12-31'),
       (4, 100.0, 50.0, '2024-01-01', '2024-12-31'),
       (5, 300.0, 250.0, '2024-01-01', '2023-12-31');

INSERT INTO sales_order (order_id, order_date, customer_id, ship_date, total)
VALUES (1, '2024-01-01', 5, '2024-02-02', 1000.0),
       (2, '2024-02-02', 4, '2024-03-03', 2000.0),
       (3, '2024-03-03', 3, '2024-04-04', 1200.0),
       (4, '2024-04-04', 2, '2024-05-05', 200.0),
       (5, '2024-05-05', 1, '2024-06-06', 300.0);

INSERT INTO item (order_id, product_id, actual_price, quantity, total)
VALUES (1, 1, 200.0, 5, 1000.0),
       (2, 2, 500.0, 4, 2000.0),
       (3, 3, 400.0, 3, 1200.0),
       (4, 4, 100.0, 2, 200.0),
       (5, 5, 300.0, 1, 300.0);