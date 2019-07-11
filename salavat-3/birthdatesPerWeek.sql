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
       ('Ernestine', '2019-06-18'),
       ('Akeem', '2019-12-24'),
       ('Lennie', '2019-02-09'),
       ('Elsa', '2019-11-05'),
       ('Cecile', '2019-10-25'),
       ('Braeden', '2019-11-05');



SELECT
    YEAR(NOW()) as year, week(birthday_at) as week_num, count(birthday_at) as birthdate_cnt
FROM
     users
where
      YEAR(birthday_at) = YEAR(NOW())
GROUP BY
         week(birthday_at);