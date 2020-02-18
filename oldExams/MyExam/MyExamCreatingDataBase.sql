1. CREATE TABLE `countries`(
`id` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(45) NOT NULL
);

CREATE TABLE `towns`(
`id` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(45) NOT NULL,
`country_id` INT NOT NULL,
FOREIGN KEY (`country_id`) REFERENCES `countries`(`id`)
);

CREATE TABLE `stadiums`(
`id` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(45) NOT NULL,
`capacity` INT NOT NULL,
`town_id` INT NOT NULL,
FOREIGN KEY (`town_id`) REFERENCES `towns`(`id`)
);

CREATE TABLE `teams`(
`id` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(45) NOT NULL,
`established` DATE NOT NULL,
`fan_base` BIGINT NOT NULL,
`stadium_id` INT NOT NULL,
FOREIGN KEY (`stadium_id`) REFERENCES `stadiums`(`id`)
);

CREATE TABLE `skills_data`(
`id` INT AUTO_INCREMENT PRIMARY KEY,
`dribbling` INT,
`pace` INT,
`passing` INT,
`shooting` INT,
`speed` INT,
`strength` INT
);

CREATE TABLE `players`(
`id` INT AUTO_INCREMENT PRIMARY KEY,
`first_name` VARCHAR(10) NOT NULL,
`last_name` VARCHAR(20) NOT NULL,
`age` INT NOT NULL DEFAULT 0,
`position` CHAR NOT NULL,
`salary` DECIMAL(10,2) NOT NULL DEFAULT 0,
`hire_date` DATETIME,
`skills_data_id` INT NOT NULL,
`team_id` INT NOT NULL,
FOREIGN KEY (`skills_data_id`) REFERENCES `skills_data`(`id`),
FOREIGN KEY (`team_id`) REFERENCES `teams`(`id`)
);

CREATE TABLE `coaches`(
`id` INT AUTO_INCREMENT PRIMARY KEY,
`first_name` VARCHAR(10) NOT NULL,
`last_name` VARCHAR(20) NOT NULL,
`salary` DECIMAL(10,2) NOT NULL DEFAULT 0,
`coach_level` INT NOT NULL DEFAULT 0
);

CREATE TABLE `players_coaches`(
`player_id` INT,
`coach_id` INT,
PRIMARY KEY (`player_id`,`coach_id`),
FOREIGN KEY (`player_id`) REFERENCES `players`(`id`),
FOREIGN KEY (`coach_id`) REFERENCES `coaches`(`id`)
);