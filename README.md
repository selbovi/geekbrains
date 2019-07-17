# geekbrains
домашние задания 

## настройки инфраструктуры для ДЗ по БД

образ БД
> https://hub.docker.com/_/mysql

запуск
> docker run --name geek-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123 -d mysql:5.7

исполнение команд внутри контейнера с БД
> docker exec -it geek-mysql bash

запуск mysql
> mysql -u root -p123