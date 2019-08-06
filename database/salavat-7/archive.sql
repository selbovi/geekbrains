DROP DATABASE IF EXISTS SALAVAT_HOMEWORK;
CREATE DATABASE SALAVAT_HOMEWORK CHARACTER SET utf8 COLLATE utf8_general_ci;
use SALAVAT_HOMEWORK;

CREATE TABLE IF NOT EXISTS `logs`
(
    date       timestamp,
    table_name VARCHAR(20),
    id         VARCHAR(20),
    name       VARCHAR(20)
) ENGINE = ARCHIVE DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS products;
CREATE TABLE products (
                          id SERIAL PRIMARY KEY AUTO_INCREMENT,
                          name VARCHAR(255) COMMENT 'Название',
                          description TEXT COMMENT 'Описание'
) COMMENT = 'Товарные позиции';

DELIMITER //

DROP TRIGGER IF EXISTS log_products;

CREATE TRIGGER log_products AFTER insert ON products
    FOR EACH ROW BEGIN
    insert into logs (date, table_name, id, name) values (now(), 'products', NEW.id, NEW.name);
END//

#TODO такие же триггеры для users, catalogs

insert into products (name, description) values ('mouse', 'pc mouse');

select * from logs;