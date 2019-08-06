DROP DATABASE IF EXISTS SALAVAT_HOMEWORK;
CREATE  DATABASE SALAVAT_HOMEWORK;
use SALAVAT_HOMEWORK;

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    id          SERIAL PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(255) COMMENT 'Имя пользователя',
    birthday_at DATE COMMENT 'Дата рождения',
    created_at  DATETIME,
    updated_at  DATETIME
) COMMENT = 'пользователи';

INSERT INTO users (name, birthday_at)
VALUES ('Kelton', '1975-02-24'),
       ('Madalyn', '1974-07-23'),
       ('Mireya', '1985-04-30'),
       ('Ebony', '1986-11-10'),
       ('Ernestine', '1972-06-18'),
       ('Akeem', '1991-12-24'),
       ('Lennie', '1973-02-09'),
       ('Elsa', '1999-11-05'),
       ('Cecile', '2003-10-25'),
       ('Braeden', '1973-11-06');

UPDATE users SET created_at=NOW(), updated_at=NOW();

SELECT * FROM users;