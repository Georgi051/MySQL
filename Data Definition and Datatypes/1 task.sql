CREATE SCHEMA `minions`;

CREATE TABLE `minions`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`age` INT 
);

CREATE TABLE `towns`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE `people`(
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
`name` VARCHAR(200) NOT NULL,
`picture` BLOB,
`height` DECIMAL(10,2),
`weight` DECIMAL(15,2),
`gender` ENUM('m', 'f') NOT NULL,
`birthdate` DATE NOT NULL,
`biography` TEXT
);

INSERT INTO `people` (`name`,`height`,`weight`,`gender`,`birthdate`) VALUES 
('Pesho',2.32,1.11,'m',"1991-10-08"),
('Gosho',2.00,1.01,'m',"1991-10-08"),
('Mimi',1.55,0.61,'f',"1997-03-15"),
('Stefka',1.62,0.73,'f',"1992-11-22"),
('Ivan',1.82,0.91,'m',"1981-07-02");

CREATE TABLE `users`(
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
`username` VARCHAR(30) NOT NULL,
`password` VARCHAR(26) NOT NULL,
`profile_picture` BLOB(900),
`last_login_time` TIME,
`is_deleted` BOOLEAN
);

INSERT INTO `users`(username,password,last_login_time,is_deleted) VALUES
('Gosho','231213','12:02:04',FALSE), 
('Pesho','77454','09:05:04',FALSE), 
('Stanimir','54545','09:05:04',TRUE),
('Katq','32233','09:05:04',FALSE), 
('Ivanka','414124','09:05:04',TRUE); 



