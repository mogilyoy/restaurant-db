-- Хранимые процедуры
USE rest;

-- Процедуры вставки с логгированием
DELIMITER //
DROP PROCEDURE IF EXISTS insert_orders//
CREATE PROCEDURE insert_orders (iclients_id BIGINT UNSIGNED, ibody JSON, icreated_at DATETIME, itable_id BIGINT UNSIGNED, logging BIT)
BEGIN
	INSERT INTO orders(`client_id`, `body`, `created_at`, `table_id`) VALUES(iclients_id, ibody, icreated_at, itable_id);

	IF ( logging = 1 ) THEN 
		INSERT INTO logs VALUES (NOW(), 'orders', CONCAT('INSERT INTO orders(`client_id`, `body`, `created_at`, `table_id`) VALUES(', iclients_id, ', ', ibody, ', ', icreated_at, ', ', itable_id, ');'));
	END IF;
END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS insert_clients//
CREATE PROCEDURE insert_clients (iname VARCHAR(255), iphone_number BIGINT UNSIGNED, ipwd_hash VARCHAR(256), logging BIT)
BEGIN
	INSERT INTO clients (`name`, `phone_number` , `pwd_hash`) VALUES(iname, iphone_number, ipwd_hash);

	IF ( logging = 1 ) THEN 
		INSERT INTO logs VALUES (NOW(), 'clients', CONCAT('INSERT INTO clients (`name`, `phone_number` , `pwd_hash`) VALUES(', iname, ', ', iphone_number, ', ', ipwd_hash, ');'));
	END IF;
END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS insert_deliveries//
CREATE PROCEDURE insert_deliveries (iorder_id BIGINT UNSIGNED, iadress VARCHAR(255), idelivery_time DATETIME, icourier_id BIGINT UNSIGNED, iclient_id BIGINT UNSIGNED, logging BIT)
BEGIN
	INSERT INTO deliveries (`order_id`, `adress` , `delivery_time`, `courier_id`, `client_id`) VALUES(iorder_id, iadress, idelivery_time, icourier_id, iclient_id);

	IF ( logging = 1 ) THEN 
		INSERT INTO logs VALUES (NOW(), 'deliveries', CONCAT('INSERT INTO deliveries (`order_id`, `adress` , `delivery_time`, `courier_id`, `client_id`) VALUES(', iorder_id, ', ', iadress, ', ', idelivery_time, ', ', icourier_id, ', ', iclient_id, ');'));
	END IF;
END//
DELIMITER ;

-- CALL insert_deliveries(131, 'moskow', '2022-10-03 03:14:15', 2, 1, 1);


-- Процедуры обновления с логгированием
DELIMITER //
DROP PROCEDURE IF EXISTS update_orders_on_id//
CREATE PROCEDURE update_orders_on_id (iid BIGINT UNSIGNED, iclients_id BIGINT UNSIGNED, ibody JSON, icreated_at DATETIME, itable_id BIGINT UNSIGNED, logging BIT)
BEGIN
	UPDATE orders 
	SET 
		client_id = iclients_id,
		body = ibody,
		created_at = icreated_at,
		table_id = itable_id
	
	WHERE id = iid;

	IF ( logging = 1 ) THEN 
		INSERT INTO logs VALUES (NOW(), 'orders', CONCAT('UPDATE orders SET client_id =', iclients_id, ', body = ', ibody, ', created_at = ', icreated_at, ', table_id = ', itable_id, ' WHERE id = ', iid, ';'));
	END IF;
END//
DELIMITER ;

-- CALL update_orders_on_id(2, 3, '{"latte": 4, "hot_dog": 1}', NOW(), 3, 1);


DELIMITER //
DROP PROCEDURE IF EXISTS update_clients_on_id//
CREATE PROCEDURE update_clients_on_id (iid BIGINT UNSIGNED, iname VARCHAR(255), iphone_number BIGINT UNSIGNED, ipwd_hash VARCHAR(256), logging BIT)
BEGIN
	UPDATE clients 
	SET 
		name = iname,
		phone_number = iphone_number,
		pwd_hash = ipwd_hash 	
	WHERE id = iid;

	IF ( logging = 1 ) THEN 
		INSERT INTO logs VALUES (NOW(), 'orders', CONCAT('UPDATE clients SET name =', iname, ', phone_number = ', iphone_number, ', pwd_hash = ', ipwd_hash, ' WHERE id = ', iid, ';'));
	END IF;
END//
DELIMITER ;

-- CALL update_clients_on_id(1, 'Матвей', 89234487321, '51ab9d6949e162cb548fbd6093400b324754ba1e', 1);

DELIMITER //
DROP PROCEDURE IF EXISTS update_deliveries_on_order_id//
CREATE PROCEDURE update_deliveries_on_order_id (iorder_id BIGINT UNSIGNED, iadress VARCHAR(255), idelivery_time DATETIME, icourier_id BIGINT UNSIGNED, iclient_id BIGINT UNSIGNED, logging BIT)
BEGIN
	UPDATE deliveries  
	SET 
		adress = iadress,
		delievery_time =idelivery_time, 
		courier_id = icourier_id,
		client_id = iclient_id
		
	WHERE order_id = iorder_id;

	IF ( logging = 1 ) THEN 
		INSERT INTO logs VALUES (NOW(), 'orders', CONCAT('UPDATE deliveries SET adress =', iadress, ', delievery_time = ', idelivery_time, ', courier_id = ', icourier_id, ', client_id = ', iclient_id, ' WHERE order_id = ', iorder_id, ';'));
	END IF;
END//
DELIMITER ;

-- CALL update_deliveries_on_order_id(3, 'kiev', '2022-10-10 10:10:10', 3, 2, 1);












