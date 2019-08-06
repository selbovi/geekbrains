/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     7/30/2019 5:36:21 PM                         */
/*==============================================================*/
DROP DATABASE IF EXISTS SALAVAT_COURSE_WORK;
CREATE DATABASE SALAVAT_COURSE_WORK CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use SALAVAT_COURSE_WORK;


drop table if exists Bookmark;

drop table if exists Category;

drop table if exists InfrastructureObject;

drop table if exists Photos;

drop table if exists Realty;

drop table if exists TotalRealty;

drop table if exists RealtyMeta;

drop table if exists Region;

drop table if exists Seller;

drop table if exists User;

drop table if exists Visitors;

drop table if exists realty2infrastructure;

/*==============================================================*/
/* Table: Bookmark                                              */
/*==============================================================*/
create table Bookmark
(
    realty_id int         not null,
    login     varchar(20) not null
);

/*==============================================================*/
/* Table: Category                                              */
/*==============================================================*/
create table Category
(
    category_id int         not null,
    name        varchar(50) not null,
    primary key (category_id)
);

alter table Category
    comment 'Раздел (Продажа, Аренда)';

/*==============================================================*/
/* Table: InfrastructureObject                                  */
/*==============================================================*/
create table InfrastructureObject
(
    object_id int not null,
    name      varchar(50),
    primary key (object_id)
);

/*==============================================================*/
/* Table: Photos                                                */
/*==============================================================*/
create table Photos
(
    realty_id int not null,
    name      varchar(50),
    photo     longblob
);

/*==============================================================*/
/* Table: Realty                                                */
/*==============================================================*/
create table Realty
(
    realty_id   int         not null,
    category_id int         not null,
    seller_id   int         not null,
    code        int         not null,
    latitude    varchar(10) not null,
    longitude   varchar(10) not null,
    description varchar(50),
    address     varchar(50) not null,
    price       int         not null,
    primary key (realty_id)
);

alter table Realty
    comment 'недвижимость';


/*==============================================================*/
/* Table: TotalRealty                                           */
/*==============================================================*/
create table TotalRealty
(
    count                int,
    type                 int not null,
    primary key (type)
);

/*==============================================================*/
/* Table: RealtyMeta                                            */
/*==============================================================*/
create table RealtyMeta
(
    meta_id      int not null,
    realty_id    int not null,
    area         float,
    num_of_rooms int,
    level        int,
    primary key (meta_id)
);

/*==============================================================*/
/* Table: Region                                                */
/*==============================================================*/
create table Region
(
    name varchar(50) not null,
    code int         not null,
    primary key (code)
);

/*==============================================================*/
/* Table: Seller                                                */
/*==============================================================*/
create table Seller
(
    name      varchar(50) not null,
    surname   varchar(50) not null,
    phone     varchar(10),
    seller_id int         not null,
    primary key (seller_id)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
    login varchar(20) not null,
    primary key (login)
);

/*==============================================================*/
/* Table: Visitors                                              */
/*==============================================================*/
create table Visitors
(
    realty_id int not null,
    count     int
);

alter table Visitors
    comment 'Счетчик посещений';

/*==============================================================*/
/* Table: realty2infrastructure                                 */
/*==============================================================*/
create table realty2infrastructure
(
    realty_id int not null,
    object_id int not null,
    primary key (realty_id, object_id)
);

alter table Bookmark
    add constraint FK_Bookmark foreign key (realty_id)
        references Realty (realty_id) on delete restrict on update restrict;

alter table Bookmark
    add constraint FK_User_Bookmarks foreign key (login)
        references User (login) on delete restrict on update restrict;

alter table Photos
    add constraint FK_realty2photo foreign key (realty_id)
        references Realty (realty_id) on delete restrict on update restrict;

alter table Realty
    add constraint FK_realty2category foreign key (category_id)
        references Category (category_id) on delete restrict on update restrict;

alter table Realty
    add constraint FK_realty2region foreign key (code)
        references Region (code) on delete restrict on update restrict;

alter table Realty
    add constraint FK_seller2realty foreign key (seller_id)
        references Seller (seller_id) on delete restrict on update restrict;

alter table RealtyMeta
    add constraint FK_realty2meta foreign key (realty_id)
        references Realty (realty_id) on delete restrict on update restrict;

alter table Visitors
    add constraint FK_Просмотры foreign key (realty_id)
        references Realty (realty_id) on delete restrict on update restrict;

alter table realty2infrastructure
    add constraint FK_realty2infrastructure foreign key (realty_id)
        references Realty (realty_id) on delete restrict on update restrict;

alter table realty2infrastructure
    add constraint FK_realty2infrastructure2 foreign key (object_id)
        references InfrastructureObject (object_id) on delete restrict on update restrict;