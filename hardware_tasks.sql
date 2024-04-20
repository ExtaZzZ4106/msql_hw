-- Задача 1: Вывести суммарное количество единиц техники на складе
SELECT SUM(amount) FROM hardware;

-- Задача 2: Вывести какие товары на складе закончились
SELECT title FROM hardware WHERE amount = 0;

-- Задача 3: Вывести среднюю цену монитора
SELECT AVG(price) FROM hardware WHERE title LIKE '%Монитор%';

-- Задача 4: Вывести все клавиатуры, отсортированные от самой дешевой до самой дорогой
SELECT title, price FROM hardware WHERE title LIKE '%Клавиатура%' ORDER BY price ASC;

-- Задача 5: Вывести количество товарных позиций по каждому тегу с использованием группировки
SELECT tag, COUNT(*) AS tag_count
FROM hardware
WHERE tag IS NOT NULL
GROUP BY tag
ORDER BY tag_count DESC;

-- Задача 6: Вывести количество товарных позиций со скидками на складе
SELECT COUNT(*) AS discounted_items FROM hardware WHERE tag = 'discount';

-- Задача 7: Вывести название и цену самой дорогой новинки
SELECT title, price
FROM hardware
WHERE tag = 'new'
ORDER BY price DESC
LIMIT 1;

-- Задача 8: Добавить в таблицу новый товар "Ноутбук Lenovo 2BXKQ7E9XD" как новинку
INSERT INTO hardware (title, price, amount, tag)
VALUES ('Ноутбук Lenovo 2BXKQ7E9XD', 54500, 1, 'new');

-- Задача 9: Найти и удалить по названию ошибочно добавленный товар "Очки PS VR 2"
DELETE FROM hardware WHERE title = 'Очки PS VR 2' id IS NOT NULL;
