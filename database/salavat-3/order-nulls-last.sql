DROP DATABASE IF EXISTS SALAVAT_HOMEWORK;
CREATE DATABASE SALAVAT_HOMEWORK;
use SALAVAT_HOMEWORK;

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products
(
    id            SERIAL PRIMARY KEY,
    storehouse_id INT UNSIGNED,
    product_id    INT UNSIGNED,
    value         INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at    DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT INTO `storehouses_products` (id, storehouse_id, product_id, value)
VALUES ('1', '2', '5', '2'),
       ('2', '1', '8', '1'),
       ('3', '4', '6', '9'),
       ('4', '2', '1', NULL),
       ('5', '7', '2', '7'),
       ('6', '3', '5', NULL),
       ('7', '5', '2', '6'),
       ('8', '3', '6', '0'),
       ('9', '6', '9', '4'),
       ('10', '7', '9', '3');

SELECT *
FROM storehouses_products
order by value IS NULL, value ASC;