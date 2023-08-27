-- Урок 1. Установка СУБД, подключение к БД, просмотр и создание таблиц
-- Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
-- Необходимые поля таблицы: product_name (название товара), 
-- manufacturer (производитель), product_count (количество), price (цена). 

--
CREATE TABLE `geekbrains`.`Homework_1` (
  `id` INT NOT NULL,
  `product_name` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `product_count` INT NULL,
  `price` DECIMAL(8) NULL,
  PRIMARY KEY (`id`));
--


-- Заполните БД произвольными данными. 

--
INSERT INTO `geekbrains`.`Homework_1` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('1', 'Samsung S23 ultra 8/256', 'Samsung', '23', '109865');
INSERT INTO `geekbrains`.`Homework_1` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('2', 'Samsung S23 ultra 12/512', 'Samsung', '34', '129574');
INSERT INTO `geekbrains`.`Homework_1` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('3', 'Xiaomi Redmi Note 12 Pro 5G 256 ГБ / ОЗУ 8 ГБ', 'Xiaomi', '54', '78789');
INSERT INTO `geekbrains`.`Homework_1` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('4', 'Apple iPhone 14 Pro 128 ГБ', 'Apple', '34', '103224');
INSERT INTO `geekbrains`.`Homework_1` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('5', 'Apple iPhone 14 Pro 256 ГБ', 'Apple', '12', '123985');
INSERT INTO `geekbrains`.`Homework_1` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('6', 'Google Pixel 6a 128 ГБ', 'Google', '45', '99455');
INSERT INTO `geekbrains`.`Homework_1` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('7', 'Apple iPhone 13, 128 Гб', 'Apple', '1', '87945');
INSERT INTO `geekbrains`.`Homework_1` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('8', 'Realme Narzo 50, 6/128 Гб', 'Realme', '1', '23465');
INSERT INTO `geekbrains`.`Homework_1` (`id`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('9', 'Xiaomi Redmi 10A 32 ГБ', 'Xiaomi', '1', '45256');
--


-- Напишите SELECT-запрос, который выводит название товара,
-- производителя и цену для товаров, количество которых превышает 2 
SELECT product_name, manufacturer, price FROM geekbrains.Homework_1 where product_count > 2;

-- Выведите SELECT-запросом весь ассортимент товаров марки “Samsung”
SELECT product_name, manufacturer, price FROM geekbrains.Homework_1 where product_count > 2;

-- 4.* С помощью SELECT-запроса с оператором LIKE / REGEXP найти:
-- 4.1.* Товары, в которых есть упоминание "Iphone"
-- 4.2.* Товары, в которых есть упоминание "Samsung"
-- 4.3.* Товары, в названии которых есть ЦИФРЫ
-- 4.4.* Товары, в названии которых есть ЦИФРА "8"

