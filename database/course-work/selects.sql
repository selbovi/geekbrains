#скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы);

select reg.name, sum(price) as 'сумма недвижимости в продаже по району'
from Realty r
         inner join Category c on r.category_id = c.category_id
         inner join Region reg on r.code = reg.code
group by reg.name;

select (select name from Seller where Realty.seller_id = Seller.seller_id) as 'продавец',
       longitude,
       latitude,
       address,
       price
from Realty;