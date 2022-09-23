DROP DATABASE IF EXISTS rest;
CREATE DATABASE rest;
USE rest;


/*
 * База данных абстрактного ресторана.
 */


DROP TABLE IF EXISTS suppliers;
CREATE TABLE suppliers (
	id SERIAL,
	name VARCHAR(255),
	adress TEXT,
	phone_number BIGINT UNSIGNED UNIQUE	
);


DROP TABLE IF EXISTS storehouse;
CREATE TABLE storehouse (
	product_id SERIAL,
	name VARCHAR(255),
	quantity BIGINT UNSIGNED,
	supplier_id BIGINT UNSIGNED NOT NULL,
	last_supply DATETIME DEFAULT NOW(),
	
	INDEX(name),
	FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);


DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
	id SERIAL,
	name VARCHAR(255), 
	phone_number BIGINT UNSIGNED UNIQUE,
	pwd_hash VARCHAR(256),
	INDEX(name)
);


DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id SERIAL,
	client_id BIGINT UNSIGNED NOT NULL,
	body JSON,
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (client_id) REFERENCES clients(id) 
);


DROP TABLE IF EXISTS menu_categories;
CREATE TABLE menu_categories (
	id SERIAL,
	name VARCHAR(255),
	INDEX(name)
);


DROP TABLE IF EXISTS menu;
CREATE TABLE menu (
	id SERIAL,
	name VARCHAR(255) NOT NULL,
	description TEXT NOT NULL, 
	price INT UNSIGNED NOT NULL,
	category_id BIGINT UNSIGNED NOT NULL,
	weight INT UNSIGNED,
	
	FOREIGN KEY (category_id) REFERENCES menu_categories(id), 
	INDEX(name, price, weight)
);


DROP TABLE IF EXISTS staff_hierarchy;
CREATE TABLE staff_hierarchy (
	id SERIAL,
	name VARCHAR(255)  -- waiter, cook, hostesses, etc...
);


DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
	id SERIAL,
	firstname VARCHAR(255),
	lastname VARCHAR(255),
	phone_number BIGINT UNSIGNED UNIQUE,
	salary INT UNSIGNED,
	hierarchy_id BIGINT UNSIGNED,
	
	INDEX(firstname, lastname),
	FOREIGN KEY (hierarchy_id) REFERENCES staff_hierarchy(id)
);


DROP TABLE IF EXISTS tables;
CREATE TABLE tables (
	id SERIAL,
	status ENUM('free', 'reserved'),
	last_client_id BIGINT UNSIGNED NOT NULL,
	last_waiter_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (last_client_id) REFERENCES clients(id),
	FOREIGN KEY (last_waiter_id) REFERENCES staff(id),
	
	INDEX(status)
);


DROP TABLE IF EXISTS table_reservation;
CREATE TABLE table_reservation (
	table_id BIGINT UNSIGNED,
	client_id BIGINT UNSIGNED NOT NULL,
	reserved_at DATETIME ON UPDATE NOW(),
	
	FOREIGN KEY (client_id) REFERENCES clients(id),
	FOREIGN KEY (table_id) REFERENCES tables(id)
);


DROP TABLE IF EXISTS deliveries;
CREATE TABLE deliveries (
	order_id BIGINT UNSIGNED NOT NULL,
	adress VARCHAR(255),
	delievery_time DATETIME DEFAULT NOW(),
	courier_id BIGINT UNSIGNED NOT NULL,
	client_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (courier_id) REFERENCES staff(id),
	FOREIGN KEY (client_id) REFERENCES clients(id)
);



