CREATE SCHEMA `soft_uni`;
USE `soft_uni`;

CREATE TABLE `towns`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE `addresses`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`address_text` TEXT,
`town_id` INT,
FOREIGN KEY (`town_id`) REFERENCES `towns`(`id`)
); 

CREATE TABLE `departments`(
`id`INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL
); 

CREATE TABLE `employees`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(50) NOT NULL,
`middle_name` VARCHAR(50),
`last_name` VARCHAR(50) NOT NULL,
`job_title` VARCHAR(50) NOT NULL,
`department_id` INT(2),
`hire_date` DATE NOT NULL, 
`salary` DECIMAL, 
`address_id` INT(2),
FOREIGN KEY (`department_id`) REFERENCES `departments`(`id`),
FOREIGN KEY (`address_id`) REFERENCES `addresses`(`id`)
);

