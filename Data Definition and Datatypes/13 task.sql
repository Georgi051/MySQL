CREATE SCHEMA `Hotel`;

CREATE TABLE `employees`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(50) NOT NULL,
`last_name` VARCHAR(50) NOT NULL,
`title` VARCHAR(50) NOT NULL,
`notes` TEXT
);

INSERT INTO `employees`(first_name,last_name,title)VALUES
('George','Petrov','junior'),
('Petur','Hristov','middle'),
('Nikolay','Ivanov','senior');


CREATE TABLE `customers`(
`account_number` VARCHAR(40) PRIMARY KEY,
`first_name` VARCHAR(50) NOT NULL,
`last_name` VARCHAR(50) NOT NULL,
`phone_number` INT(30),
`emergency_name` VARCHAR(50) NOT NULL,
`emergency_number` INT,
`notes` TEXT
);

INSERT INTO `customers`(account_number,first_name,last_name,emergency_name,emergency_number)VALUES
('SDASDAG','George','Petrov','Todor','0834234237'),
('VDSSDSD','Petur','Hristov','Misho','0883414248'),
('HDSFGGG','Pesho','Peshov','Mitko','0883414148');

CREATE TABLE `room_status`(
`room_status`  VARCHAR(50) PRIMARY KEY NOT NULL,
`notes` TEXT
);

INSERT INTO `room_status`(room_status)VALUES
('Not_free'),
('Free'),
('Reserved');

CREATE TABLE `room_types`(
`room_type` VARCHAR(40) PRIMARY KEY,
`notes` TEXT
);

INSERT INTO `room_types`(room_type)VALUES
('Apartament'),
('Normal'),
('VIP');


CREATE TABLE `bed_types`(
`bed_type` VARCHAR(40) PRIMARY KEY,
`notes` TEXT
);

INSERT INTO `bed_types`(bed_type)VALUES
('Single'),
('Double'),
('Sofa');

CREATE TABLE `rooms`(
`room_number` INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
`room_type` VARCHAR(40),
`bed_type` VARCHAR(50),
`rate` DECIMAL,
`room_status` VARCHAR(40),
`notes` TEXT
);

INSERT INTO `rooms`(room_type,bed_type,room_status)VALUES
('Apartament','Double','Free'),
('Normal','Single','Not_free'),
('VIP','Double','Reserved');

CREATE TABLE `payments`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`employee_id` VARCHAR(40) NOT NULL,
`payment_date` DATE NOT NULL,
`account_number` INT,
`first_date_occupied` DATE,
`last_date_occupied` DATE,
`total_days` INT,
`amount_charged` DOUBLE,
`tax_rate` DECIMAL,
`tax_amount` DECIMAL,
`payment_total`DECIMAL,
`notes` TEXT
);

INSERT INTO `payments`(employee_id,payment_date,account_number)VALUES
('ASD423421','2019-03-23',0883543323),
('DSFFS2333','2019-06-13',0883667753),
('SDA333331','2019-11-05',0887444563);

CREATE TABLE `occupancies`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`employee_id` VARCHAR(40) NOT NULL,
`date_occupied` DATE NOT NULL,
`account_number` INT,
`room_number` VARCHAR(10),
`rate_applied` DECIMAL,
`phone_charge` DECIMAL,
`notes` TEXT
);

INSERT INTO `occupancies`(employee_id,date_occupied)VALUES
('ASD423421','2019-03-23'),
('DSFFS2333','2019-06-13'),
('SDA333331','2019-11-05');