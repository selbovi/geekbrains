DROP DATABASE IF EXISTS SALAVAT_HOMEWORK;
CREATE  DATABASE SALAVAT_HOMEWORK CHARACTER SET utf8 COLLATE utf8_general_ci;
use SALAVAT_HOMEWORK;

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(255) COMMENT 'Имя пользователя',
    birthday_at DATE COMMENT 'Дата рождения',
    created_at  DATETIME,
    updated_at  DATETIME
) COMMENT = 'пользователи';

INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('1', 'Shaniya Stokes', '1982-08-17', '2014-05-15 11:18:57', '1980-04-17 05:12:03');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('2', 'Hertha Tillman', '1993-09-12', '2001-10-08 20:17:08', '1989-07-08 18:47:28');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('3', 'Brannon O\'Connell', '1970-01-07', '2005-10-11 02:58:13', '1998-06-21 04:17:29');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('4', 'Xavier Douglas', '1984-12-26', '1984-12-21 02:49:23', '2009-05-24 11:14:54');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('5', 'River VonRueden III', '1974-02-02', '1982-11-18 21:05:36', '1988-05-15 17:37:31');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('6', 'Madisen Ritchie', '1998-04-10', '1981-10-26 19:00:25', '2005-02-28 05:57:21');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('7', 'Ms. Candida Dare', '2001-03-28', '1993-04-20 06:35:35', '2009-01-01 19:36:17');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('8', 'Halle Homenick', '2013-12-07', '2005-12-26 10:59:21', '1972-07-05 23:13:28');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('9', 'Rowena Bauch', '2001-03-22', '2017-08-26 04:50:48', '2000-02-14 21:21:21');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('10', 'Hertha McLaughlin', '2005-07-18', '2011-05-01 16:42:43', '1991-08-22 08:00:49');

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  description TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users (id)
) COMMENT = 'Заказы';

INSERT INTO orders (id, user_id) VALUES (1, 2);
INSERT INTO orders (id, user_id) VALUES (2, 4);
INSERT INTO orders (id, user_id) VALUES (3, 10);
INSERT INTO orders (id, user_id) VALUES (4, 2);
INSERT INTO orders (id, user_id) VALUES (5, 7);


DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  id SERIAL PRIMARY KEY,
  order_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED,
  total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (order_id) REFERENCES orders (id),
  FOREIGN KEY (product_id) REFERENCES products (id)
) COMMENT = 'Состав заказа';

INSERT into orders_products (id, order_id, product_id, total) VALUES (1, 1, 5, 10);
INSERT into orders_products (id, order_id, product_id, total) VALUES (2, 2, 4, 2);
INSERT into orders_products (id, order_id, product_id, total) VALUES (3, 3, 3, 2);
INSERT into orders_products (id, order_id, product_id, total) VALUES (4, 4, 2, 0);
INSERT into orders_products (id, order_id, product_id, total) VALUES (5, 5, 1, 1);

SELECT
	u.name as 'покупатель', p.name as 'позиция', p.price as 'цена за шт', op.total as 'кол-во'
FROM
	users u
RIGHT JOIN
	orders o on u.id = o.user_id
INNER JOIN
	orders_products op on o.id = op.order_id
INNER JOIN
	products p on op.product_id = p.id
WHERE
	op.total is not null AND op.total > 0;
