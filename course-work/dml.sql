#скрипты наполнения БД данными;

INSERT into Category (category_id, name)
VALUES (1, 'квартира'),
       (2, 'дом'),
       (3, 'участок');

INSERT INTO User
VALUES ('bfeest'),
       ('gabe46'),
       ('ijohnson'),
       ('leora31'),
       ('lgoldner'),
       ('lilly13'),
       ('sarina99'),
       ('skiles.logan'),
       ('yborer'),
       ('ypfannerstill');

INSERT INTO Seller
VALUES ('George Murazik', 'Hintz', '106-759-67', '1'),
       ('Lamar Jerde MD', 'Smitham', '+16(2)1832', '2'),
       ('Marta Green', 'Blanda', '(451)666-5', '3'),
       ('Dr. Norwood Bernier', 'Jerde', '174.194.75', '4'),
       ('Reba Sawayn', 'Hane', '1-687-221-', '5');



INSERT INTO Region
VALUES ('Орехово', 1),
       ('Нагатино', 2),
       ('Бирюлево', 3);

INSERT INTO InfrastructureObject
VALUES (1, 'Школа'),
       (2, 'Больница'),
       (3, 'Садик');

INSERT INTO Realty
VALUES ('0', '1', '5', '3', '-49.093287', '-133.83435', 'Velit omnis et autem dignissimos. A deleniti quo q',
        '8564 Zulauf Lights Apt. 475\nWest Darianbury, VA 11', '4000'),
       ('1', '1', '1', '1', '63.992630', '88.157449', 'Quaerat ad ut et sunt deserunt illo quae fuga. Ut ',
        '065 Crist Common Apt. 516\nStreichtown, NM 78161', '8000'),
       ('2', '3', '1', '1', '68.551765', '16.505752', 'Magni dolores molestiae voluptas repudiandae. Nisi',
        '066 Jenkins Throughway Suite 396\nEast Javier, NJ 7', '2000'),
       ('3', '2', '3', '3', '61.661917', '-135.03371', 'Similique tenetur dolores et et eius non aut. Maxi',
        '357 Toney Road\nProhaskastad, WI 90444', '6000'),
       ('4', '1', '4', '3', '-30.260999', '-30.521490', 'Repellat asperiores blanditiis architecto repellen',
        '439 Archibald Plains Suite 669\nNew Pauline, IA 680', '5000'),
       ('5', '2', '2', '1', '-36.057781', '48.220198', 'Aut numquam accusantium omnis minima saepe ab pari',
        '5981 Stacey Vista Suite 309\nLake Elizabethland, OH', '8000'),
       ('6', '3', '4', '2', '-68.847130', '-27.599907', 'Omnis reiciendis modi iure quis aliquid. Eveniet d',
        '68677 Karley Throughway Suite 721\nGerlachbury, CT ', '7000'),
       ('7', '3', '4', '1', '-59.022013', '-22.157590', 'At voluptate modi architecto adipisci velit a cons',
        '227 Rutherford Place\nAshleebury, DC 25304-4010', '4000'),
       ('8', '3', '2', '1', '-88.459920', '-69.702731', 'Qui cum natus odio sit eum fugit. Repellendus ut l',
        '18063 Rempel Club\nLake Lily, MN 69786-3079', '6000'),
       ('9', '1', '4', '1', '-82.135763', '31.132807', 'Magnam vero ipsam consequatur. Dolores ut vel prae',
        '207 Botsford Mountain Suite 297\nEmiliafort, WV 080', '4000');