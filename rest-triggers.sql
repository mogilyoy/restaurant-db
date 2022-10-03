-- Триггеры
USE rest;


DELIMITER //
DROP TRIGGER IF EXISTS tables_trigger//
CREATE TRIGGER tables_trigger AFTER UPDATE ON table_reservation
FOR EACH ROW
BEGIN
	UPDATE `tables` SET status = 'reserved' WHERE tables.id = NEW.table_id;
END//

DELIMITER ;

