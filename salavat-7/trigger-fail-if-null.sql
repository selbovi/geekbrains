DROP DATABASE IF EXISTS SALAVAT_HOMEWORK;
CREATE DATABASE SALAVAT_HOMEWORK CHARACTER SET utf8 COLLATE utf8_general_ci;
use SALAVAT_HOMEWORK;

DROP TABLE IF EXISTS products;
CREATE TABLE products (
                          id SERIAL PRIMARY KEY AUTO_INCREMENT,
                          name VARCHAR(255) COMMENT 'Название',
                          description TEXT COMMENT 'Описание'
) COMMENT = 'Товарные позиции';

DELIMITER //

DROP TRIGGER IF EXISTS check_products;

--TODO добавить триггер на update
--TODO вынести проверку в процедуру, чтобы не плодить повторяющийся код в триггерах

CREATE TRIGGER check_products BEFORE insert ON products
FOR EACH ROW BEGIN
    IF NEW.name is null and NEW.description is null THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'insert canceled';
    END IF;
END//

insert into products (name, description) values ('mouse', 'pc mouse');
insert into products (name, description) values ('keyboard', null);

insert into products (name, description) values (null, null);

select * from products;

