CREATE SCHEMA `Movies`;

CREATE TABLE `directors`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`director_name` VARCHAR(50) NOT NULL,
`notes` TEXT
);

CREATE TABLE `genres`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`genre_name` VARCHAR(50) NOT NULL,
`notes` TEXT
);

CREATE TABLE `categories`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`category_name` VARCHAR(50) NOT NULL,
`notes` TEXT
);

CREATE TABLE `movies`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`title` VARCHAR(50) NOT NULL,
`director_id` INT NOT NULL,
`copyright_year` YEAR(4) NOT NULL,
`length` TIME,
`genre_id` INT NOT NULL,
`category_id` INT NOT NULL,
`rating` DOUBLE NOT NULL,
`notes` TEXT
);

INSERT INTO `directors`(director_name,notes)VALUES
('Gosho',NULL),
('Pesho',NULL),
('Ivan',NULL),
('Niki',NULL),
('Mitko',NULL);

INSERT INTO `genres`(genre_name,notes)VALUES
('action',NULL),
('drama',NULL),
('trailer',NULL),
('comedy',NULL),
('fantacy',NULL);

INSERT INTO `categories`(category_name,notes)VALUES
('best_movie',NULL),
('best_actor',NULL),
('best_female_role',NULL),
('best_male_role',NULL),
('best_scene',NULL);


INSERT INTO `movies`(title,director_id,copyright_year,length,genre_id,category_id,rating) VALUES
('Gladiaor',312435,'2000','120:00:00',51413,314141,5.7),
('Joker',314325,'2019','140:00:00',534413,351,5.0),
('The Godfather',2323,'1972','130:00:00',32323,43443,9.2),
('Psycho',222435,'1960','120:30:00',51413,314141,8.2),
('Forrest Gump',552435,'1994','90:00:00',51413,314141,8.8);




