DROP DATABASE IF EXISTS SALAVAT_HOMEWORK;
CREATE DATABASE SALAVAT_HOMEWORK CHARACTER SET utf8 COLLATE utf8_general_ci;
use SALAVAT_HOMEWORK;

DELIMITER //

DROP FUNCTION IF EXISTS hello;
CREATE FUNCTION hello()
    RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE hh INT(2) DEFAULT HOUR(now());
    IF (hh >= 6 AND hh < 12) THEN
        return 'Доброе утро';
    ELSEIF (hh >= 12 AND hh < 18) THEN
        return 'Добрый день';
    ELSEIF (hh >= 18 AND hh < 24) THEN
        return 'Добрый вечер';
    ELSEIF (hh >= 24 AND hh < 6) THEN
        return 'Доброй ночи';
    end if ;
    return hh;
END//

select hello() as приветствие //
