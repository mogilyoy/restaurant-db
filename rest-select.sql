-- Скрипты характерных выборок


-- Выборка товаров на складе с указанием поставщика
SELECT 
	storehouse.name,
	storehouse.quantity,
	suppliers.name,
	suppliers.phone_number
FROM 
	storehouse 
		JOIN 
	suppliers
		ON storehouse.supplier_id = suppliers.id
ORDER BY storehouse.quantity;


-- Товары на скалде с остаткатком меньше 10
SELECT 
	name,
	quantity,
	last_supply
FROM storehouse
WHERE quantity < 10
ORDER BY quantity;
	

-- Забронированные столы
SELECT 
	tables.id,
	table_reservation.reserved_at,
	clients.name
FROM 
	tables
		JOIN 
	table_reservation
			ON tables.id=table_reservation.table_id
		JOIN
	clients 
			ON table_reservation.client_id=clients.id
WHERE tables.status = 'reserved'
;
	

-- Выборка для курьерского интерфейса
SELECT 
	deliveries.adress,
	orders.body,
	clients.name AS client_name,
	clients.phone_number
FROM 
	deliveries
		JOIN
	orders
			ON deliveries.order_id = orders.id 
		JOIN 
	clients
			ON deliveries.client_id = clients.id 
WHERE deliveries.courier_id = 6
ORDER BY deliveries.delievery_time DESC;


-- Инормация для клиента доставки
SELECT
	orders.body, 
	deliveries.delievery_time,
	CONCAT(staff.firstname, ' ', staff.lastname) AS courier_name,
	staff.phone_number AS courier_phone
FROM 
	deliveries
		JOIN
	orders
			ON deliveries.order_id = orders.id 
		JOIN 
	staff
			ON deliveries.courier_id = staff.id
WHERE deliveries.client_id = 6
ORDER BY deliveries.delievery_time DESC; 
	

-- Количество заказов по дням
SELECT 
	COUNT(id) AS total_orders,
	DATE(created_at) AS `date`
FROM 
	orders 
GROUP BY DATE(created_at) 
ORDER BY DATE(created_at) DESC;








