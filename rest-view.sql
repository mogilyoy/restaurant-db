-- Представления БД 
USE rest;

-- Показать свободные столы
CREATE OR REPLACE ALGORITHM = MERGE VIEW free_tables_view AS
SELECT 
	tables.id,
	tables.status,
	CONCAT(staff.firstname, ' ', staff.lastname) AS waiter
FROM 
	tables
		JOIN
	staff 
			ON tables.last_waiter_id = staff.id 
WHERE 
	status='free';


-- Посмотреть 10 последних логов
CREATE OR REPLACE ALGORITHM = MERGE VIEW logs_view AS
SELECT 
	`time`,
	`table`,
	`command`
FROM logs
ORDER BY `time` DESC
LIMIT 10;


-- Показать количество заказов у каждого пользователя по убыванию
CREATE OR REPLACE ALGORITHM = MERGE VIEW client_orders_count_view AS
SELECT 
	clients.name,
	COUNT(orders.id)
FROM 
	clients
		JOIN 
	orders
			ON orders.client_id = clients.id
GROUP BY orders.client_id
ORDER BY COUNT(orders.id) DESC;


-- Количество заказов у каждого курьера в день
CREATE OR REPLACE ALGORITHM = MERGE VIEW total_courier_count_view AS 
SELECT 
	CONCAT(staff.firstname, ' ', staff.lastname) AS courier,
	COUNT(deliveries.order_id) AS total
FROM 
	staff
		JOIN 
	deliveries
			ON staff.id = deliveries.courier_id
GROUP BY deliveries.courier_id
ORDER BY COUNT(staff.firstname) DESC;


