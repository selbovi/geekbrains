#квартиры в орехово
CREATE OR REPLACE VIEW
    flats_in_orehovo
as
select c.name, reg.name latitude, longitude, address, price
from Realty r
         inner join Category c on r.category_id = c.category_id
         inner join Region reg on r.code = reg.code
where reg.code = 1
  and c.category_id = 1;
;

#View вся недвижимость
CREATE OR REPLACE VIEW
    all_realty_view
as
select c.name, reg.name latitude, longitude, address, price
from Realty r
         inner join Category c on r.category_id = c.category_id
         inner join Region reg on r.code = reg.code;
;

select *
from flats_in_orehovo;

select *
from all_realty_view;