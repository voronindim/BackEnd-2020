-- 2. Добавление таблиц в БД
CREATE TABLE dvd
(
dvd_id INTEGER PRIMARY KEY AUTOINCREMENT,
title TEXT NOT NULL,
production_year TEXT NOT NULL
);

CREATE TABLE customer 
(
	customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	passport_code INTEGER NOT NULL,
	registration_date TEXT NOT NULL
);

CREATE TABLE offer 
(
	offer_id INTEGER PRIMARY KEY AUTOINCREMENT,
	dvd_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	offer_date TEXT NOT NULL,
	return_date TEXT
);

-- 3. Заполнение таблиц данными
INSERT INTO dvd (title, production_year) VALUES 
('Начало', date('2010-01-01')),
('Гарри Поттер и Филосовский камень', date('2001-02-01')),
('Гарри Поттер и тайная комната', date('2008-03-01')),
('Гарри Поттер и узник Азкабана', date('2009-04-01')),
('Гарри Поттер и кубок огня', date('2010-05-01')),
('Гарри Поттер и ордин феникса', date('2010-06-01')),
('Гарри Поттер и принц полукровка', date('2010-07-01')),
('Гарри Поттер и дары смерти 1', date('2014-08-01')),
('Гарри Поттер и дары смерти 2', date('2020-09-01')),
('Счастливый Конец', date('2016-06-29'));

INSERT INTO customer (first_name, last_name, passport_code, registration_date) VALUES 
('Евгений', 'Иванов', 88834243315, date('2015-08-12')),
('Иван', 'Иванов', 88834243323, date('2015-12-05')),
('Стас', 'Иванов', 88834243123, date('2015-02-05')),
('Саша', 'Иванов', 546732, date('2017-09-12')),
('Афанасий', 'Иванов', 900987, date('2015-02-12'));

INSERT INTO offer (dvd_id, customer_id, offer_date, return_date) VALUES 
(2, 1, date('2020-02-15'), date('2020-03-20')),
(6, 2, date('2020-02-15'), date('2020-03-20')),
(7, 3, date('2020-02-15'), date('2020-03-20')),
(2, 4, date('2020-02-15'), date('2020-03-20'));

INSERT INTO offer (dvd_id, customer_id, offer_date) VALUES 
(1, 2, date('2020-04-01')),
(4, 2, date('2020-04-01')),
(8, 4, date('2020-04-01')),
(3, 5, date('2020-04-01'));

-- 4. Получение списка всех DVD, год выпуска которых 2010, отсортированных в алфавитном порядке по названию DVD.
SELECT dvd_id, title
FROM dvd 
WHERE STRFTIME('%Y', production_year) = '2010' 
ORDER BY title;

--5. Получение списка DVD дисков, которые в настоящее время находятся у клиентов.
SELECT dvd_id, title, STRFTIME('%Y', production_year)  AS production_year
FROM dvd
WHERE EXISTS (
    SELECT * FROM offer 
    WHERE dvd.dvd_id = offer.dvd_id AND offer.return_date IS NULL
);

-- 6. Получение списка клиентов, которые брали какие-либо DVD диски в текущем году. В результатах запроса необходимо также отразить какие диски брали клиенты.
SELECT customer.first_name, customer.last_name, customer.passport_code, customer.registration_date,
       dvd.title, STRFTIME('%Y', dvd.production_year)  AS production_year
FROM customer 
LEFT JOIN offer ON offer.customer_id = customer.customer_id
LEFT JOIN dvd ON offer.dvd_id = dvd.dvd_id     
WHERE STRFTIME('%Y', offer.offer_date) = STRFTIME('%Y', 'now');