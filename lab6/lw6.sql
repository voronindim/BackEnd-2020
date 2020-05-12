-- № 1
CREATE TABLE pc 
(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	cpu INTEGER NOT NULL,
	memory INTEGER NOT NULL,
	hdd INTEGER NOT NULL
);

INSERT INTO pc (cpu, memory, hdd) VALUES 
(1600, 2000, 500),
(2400, 3000, 800),
(3200, 3000, 1200),
(2400, 2000, 500);

SELECT id, cpu, memory
FROM pc
WHERE memory = 3000;

SELECT MIN(hdd) AS min_hdd
FROM pc;

SELECT COUNT(*) AS count, hdd
FROM pc
WHERE hdd IN (SELECT MIN(hdd) FROM pc);


-- № 2

CREATE TABLE track_downloads
 ( 
      download_id INTEGER PRIMARY KEY AUTOINCREMENT, 
      track_id INTEGER NOT NULL, 
      user_id INTEGER NOT NULL, 
      download_time TEXT NOT NULL 
	  );

INSERT INTO track_downloads (track_id, user_id, download_time) VALUES 
(2, 1, date('2010-11-19')),
(3, 5, date('2010-11-19')),
(5, 3, date('2010-11-19')),
(8, 2, date('2010-11-19')),
(6, 5, date('2010-11-19')),
(1, 1, date('2010-11-19')),
(1, 2, date('2010-11-19')),
(1, 2, date('2010-11-13'));

	
SELECT 
	download_count, 
	COUNT(*) AS user_count 
FROM ( 
    SELECT 
	COUNT(*) AS download_count  
    FROM track_downloads 
    WHERE download_time = '2010-11-19' 
    GROUP BY user_id)  
AS download_count
GROUP BY download_count; 

-- № 3 Разница между datetime и timestamps

--datetime представляет из себя дату, как в календаре и время, которое мы видим на часах, в нашей временной зоне.
--timestamp же представляет из себя время, точно определённое для всех, ведь в мире много временных зон.
--DATETIME
--Хранит время в виде целого числа вида YYYYMMDDHHMMSS, используя для этого 8 байтов. 
--Это время не зависит от временной зоны. Оно всегда отображается при выборке точно так же, как было сохранено, независимо от того какой часовой пояс 
--TIMESTAMP
--Хранит 4-байтное целое число, равное количеству секунд, прошедших с полуночи 1 января 1970 года по усреднённому времени Гринвича (т.е. нулевой часовой пояс, точка отсчёта часовых поясов). 
--При получении из базы отображается с учётом часового пояса. Часовой пояс может быть задан в операционной системе

-- № 4

CREATE TABLE student 
(
	id_student INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL
);

CREATE TABLE course 
(
	id_course INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL
);

CREATE TABLE course_student 
(
	id_course_student INTEGER PRIMARY KEY AUTOINCREMENT,
	id_course INTEGER NOT NULL,
	id_student INTEGER NOT NULL,
	FOREIGN KEY(id_student) REFERENCES student(id_student),
	FOREIGN KEY(id_course) REFERENCES course(id_course)
);

INSERT INTO student(name) VALUES
	('Степан'),
	('Андрей'),
	('Саша'),
	('Ваня'),
	('Женя'),
	('Дмитрий'),
	('Стас');
	
INSERT INTO course(name) VALUES
	('Математика'),
	('Физика'),
	('ООП'),
	('Алгоитмы'),
	('История');

INSERT INTO course_student(id_course, id_student) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(2, 1),
	(2, 4),
	(3, 5),
	(3, 6),
	(4, 2),
	(4, 1),
	(5, 1),
	(5, 2),
	(5, 3);
	
	-- № 4.1
	
SELECT  COUNT(curse) AS count_curse
FROM (
	SELECT course_student.id_course AS curse
	FROM course_student
	GROUP BY course_student.id_course
	HAVING COUNT(course_student.id_student) > 5);
	
	-- № 4.2
SELECT  name
FROM course_student
INNER JOIN course ON course_student.id_course= course.id_course
WHERE id_student = 1;

-- № 5
--Если столбец не определен как NOT NULL, то может. 
-- Когда студент зачислен в унверситет, значение ячеек курса, на которые он будет ходить неизвестны = null

-- № 6
--Удаление повторяющейся записи с помощью DISTINCT
CREATE TABLE car (
	id_car INTEGER PRIMARY KEY AUTOINCREMENT,
	country TEXT NOT NULL,
	release_year TEXT NOT NULL,
	brand TEXT NOT NULL
);

INSERT INTO car(brand, release_year, country) VALUES
('лада', "2010", "Россия"),
('ауди', "2010", "Германия"),
('ауди', "2010", "Германия"),
('Газ', "2020", "Россия"),

-- удалит одну запись с ауди 2010 года, производство: Германия 
SELECT DISTINCT release_year,  country, brand
FROM car
-- удалит записи, где повторяются года, выведит 2010, 2020
SELECT DISTINCT country
FROM car
-- № 7

CREATE TABLE users (
	users_id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL
);

CREATE TABLE orders (
	orders_id INTEGER PRIMARY KEY AUTOINCREMENT,
	users_id INTEGER NOT NULL,
	status INTEGER NOT NULL,
	FOREIGN KEY(users_id) REFERENCES users(users_id)
);

INSERT INTO users(name)
VALUES 
	('Саша'),
	('Петя'),
	('Вася'),
	('Катя'),
	('Женя');

INSERT INTO orders(users_id, status) VALUES 
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 0),
	(2, 0),
	(2, 0),
	(3, 0),
	(4, 1),
	(4, 1),
	(4, 1),
	(4, 1),
	(4, 1);

--  7.1
SELECT users.name
FROM users
LEFT JOIN orders ON users.users_id = orders.users_id
GROUP BY orders.users_id
HAVING orders.status = 0;

-- 7.2
SELECT users.name
FROM users
LEFT JOIN orders ON users.users_id = orders.users_id
WHERE orders.status = 1
GROUP BY orders.users_id
HAVING COUNT(orders.orders_id) > 5;

-- 8
--Основное отличие WHERE от HAVING заключается в том, что WHERE сначала выбирает строки, 
--а затем группирует их и вычисляет агрегатные функции (таким образом, она отбирает строки для вычисления агрегатов), 
--тогда как HAVING отбирает строки групп после группировки и вычисления агрегатных функций. Как следствие, 
--предложение WHERE не должно содержать агрегатных функций; 
--не имеет смысла использовать агрегатные функции для определения строк для вычисления агрегатных функций. 
--Предложение HAVING, напротив, всегда содержит агрегатные функции. 