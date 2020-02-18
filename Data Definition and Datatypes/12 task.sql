CREATE SCHEMA `car_rental`;

CREATE TABLE `categories`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`category` VARCHAR(50) NOT NULL,
`daily_rate` DOUBLE NOT NULL,
`weekly_rate` DOUBLE NOT NULL,
`monthly_rate` DOUBLE NOT NULL,
`weekend_rate` DOUBLE NOT NULL
);

INSERT INTO `categories`(category,daily_rate,weekly_rate,monthly_rate,weekend_rate)VALUES
('sedan',3.5,3.0,3.2,3.6),
('hatchback',4.5,4.0,4.2,4.6),
('van',5.5,5.0,5.2,5.6);

CREATE TABLE `cars`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`plate_number` VARCHAR(50) NOT NULL,
`make` VARCHAR(50) NOT NULL,
`model` VARCHAR(100) NOT NULL,
`car_year` YEAR(4) NOT NULL,
`category_id` INT NOT NULL,
`doors`INT NOT NULL,
`picture` BLOB,
`car_condition` VARCHAR(50) NOT NULL,
`available` BOOLEAN
);

INSERT INTO `cars`(plate_number,make,model,car_year,category_id,doors,picture,car_condition,available)VALUES
('A4433AH','BMW','3','2009',23141,5,NULL,'good',TRUE),
('Y7233AT','Honda','Civic','2005',232321,3,NULL,'exellent',TRUE),
('B6432AH','Mercedes','C class','2001',23231,5,NULL,'good',FALSE);


CREATE TABLE `employees`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(50) NOT NULL,
`last_name` VARCHAR(50) NOT NULL,
`title` VARCHAR(50) NOT NULL,
`notes` TEXT
);


INSERT INTO `employees`(first_name,last_name,title,notes)VALUES
('George','Petrov','junior',NULL),
('Petur','Hristov','middle',NULL),
('Nikolay','Ivanov','senior',NULL);

CREATE TABLE `customers`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`driver_licence_number` VARCHAR(100) NOT NULL,
`full_name` VARCHAR(200),
`address` VARCHAR(200) NOT NULL,
`city` VARCHAR(100) NOT NULL,
`zip_code` INT NOT NULL,
`notes` TEXT
);

INSERT INTO `customers`(driver_licence_number,full_name,address,city,zip_code,notes)VALUES
('L312131AD','George Petrov','alabala','Sofia',1000,NULL),
('MA12131AH','Tihomir Stoqnov','dsada','Varna',9000,NULL),
('LR12131AE','Maria Dimova','gdfgdf','Plovdiv',4000,NULL);

CREATE TABLE `rental_orders`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`employee_id` INT NOT NULL,
`customer_id` INT,
`car_id` INT NOT NULL,
`car_condition` VARCHAR(50) NOT NULL,
`tank_level` INT,
`kilometrage_start` INT,
`kilometrage_end` INT,
`total_kilometrage` INT,
`start_date` DATE,
`end_date` DATE,
`total_days` INT,
`rate_applied` DOUBLE,
`tax_rate` DOUBLE,
`order_status` VARCHAR(50),
`notes` TEXT
);


INSERT INTO `rental_orders`(employee_id,car_id,car_condition,tank_level,kilometrage_start,kilometrage_end,total_kilometrage,total_days,rate_applied,tax_rate,order_status)VALUES
(3213112,4523434,'good',25,0,200,200,12,4.3,3.3,'free'),
(5342342,878,'excellent',75,0,250,250,3,5.3,4.6,'not free'),
(67567567,67576,'good',95,0,220,220,5,6.3,5.4,'free');



