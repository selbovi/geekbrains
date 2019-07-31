#хранимые процедуры / триггеры;

DELIMITER //

#Процедура увеличивает счетчик, категория недвижимости, при добавлении недвижимости
#участок - 0
#квартира - 10
CREATE PROCEDURE `increment_count_realty_by_type`(IN type2 INT)
BEGIN
    set @currentCnt = 0;
    select count into @currentCnt from TotalRealty where TotalRealty.type = type2;
    IF @currentCnt is null then
        insert into TotalRealty (count, type) values (1, type2);
    ELSE
        update TotalRealty set count = @currentCnt where TotalRealty.type = type2;
    END IF;
END//

# триггер срабатывает когда вставляется запись о недвижимости, и вызывает процедуру выше
DROP TRIGGER IF EXISTS count_realty;
CREATE TRIGGER count_realty after insert ON Realty
    FOR EACH ROW BEGIN
    call increment_count_realty_by_type(new.category_id);
END//

