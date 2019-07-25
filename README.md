# geekbrains
домашние задания 

## настройки инфраструктуры для ДЗ по БД

образ БД MySql
> https://hub.docker.com/_/mysql

запуск
> docker run --name geek-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123 -d mysql:5.7

исполнение команд внутри контейнера с БД
> docker exec -it geek-mysql bash

запуск mysql
> mysql -u root -p123


образ БД Redis
> https://hub.docker.com/_/redis/

запуск
> docker run --name some-redis -d redis

исполнение команд внутри контейнера с Redis
> docker exec -it /some-redis /bin/bash

запуск redis-cli
> redis-cli