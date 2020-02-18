CREATE DATABASE `relations_database`;

CREATE TABLE `passports`(
`passport_id` INT PRIMARY KEY,
`passport_number` VARCHAR(20) UNIQUE
);

INSERT INTO `passports` VALUES
(101,'N34FG21B'),
(102,'K65LO4R7'),
(103,'ZE657QP2');

CREATE TABLE `persons`(
`person_id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(20),
`salary` DECIMAL(10,2),
`passport_id` INT UNIQUE
);

INSERT INTO `persons` VALUES
(1,'Roberto',43300.00,102),
(2,'Tom',56100.00,103),
(3,'Yana',60200.00,101);

ALTER TABLE `persons`
ADD CONSTRAINT fk_persons_passports
FOREIGN KEY `persons`(passport_id)
REFERENCES `passports`(passport_id);

---------------------------------------------------------------

CREATE TABLE `manufacturers`(
	`manufacturer_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50),
    `established_on` DATE
);

INSERT INTO `manufacturers`(`name`,`established_on`) VALUES
('BMW','1916-03-01'),
('Tesla','2003-01-01'),
('Lada','1966-05-01');

CREATE TABLE `models`(
`model_id` INT PRIMARY KEY,
`name` VARCHAR(50),
`manufacturer_id` INT,
CONSTRAINT fk_models_manufacturers 
FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers`(manufacturer_id)
);

INSERT INTO `models` VALUES
(101,'X1',1),
(102,'i6',1),
(103,'Model S',2),
(104,'Model X',2),
(105,'Model 3',2),
(106,'Nova',3);
---------------------------------------------------------------
CREATE TABLE `students`(
`student_id` INT PRIMARY KEY,
`name` VARCHAR(20)
);

INSERT INTO `students` VALUES 
(1,'Mila'),
(2,'Toni'),
(3,'Ron');

CREATE TABLE `exams`(
`exam_id` INT PRIMARY KEY,
`name` VARCHAR(20)
);

INSERT INTO `exams`VALUES
(101,'Spring MVC'),
(102,'Neo4j'),
(103,'Oracle 11g');

CREATE TABLE `students_exams`(
`student_id` INT,
`exam_id` INT,
CONSTRAINT pk_student_id_exams 
PRIMARY KEY (`student_id`,`exam_id`),
CONSTRAINT fk_student_id_students
FOREIGN KEY (`student_id`) REFERENCES students(`student_id`),
CONSTRAINT fk_exam_id_exams
FOREIGN KEY (`exam_id`) REFERENCES exams(`exam_id`)
);

INSERT INTO `students_exams` VALUES
(1,101),
(1,102),
(2,101),
(3,103),
(2,102),
(2,103);

---------------------------------------------------------------
CREATE TABLE `teachers`(
`teacher_id` INT PRIMARY KEY,
`name` VARCHAR(40),
`manager_id` INT
);

INSERT INTO `teachers` VALUES
(101,'John',NULL),
(102,'Maya',106),
(103,'Silvia',106),
(104,'Ted',105),
(105,'Mark',101),
(106,'Greta',101);

ALTER TABLE `teachers`
ADD CONSTRAINT `fk_manager_id_teacher_id`
FOREIGN KEY (`manager_id`)
REFERENCES teachers(`teacher_id`);

---------------------------------------------------------------
CREATE TABLE `cities`(
`city_id` INT PRIMARY KEY,
`name` VARCHAR(50)
);

CREATE TABLE `customers`(
`customer_id` INT PRIMARY KEY,
`name` VARCHAR(50),
`birthday` DATE,
`city_id` INT,
CONSTRAINT fk_customers_cities
FOREIGN KEY (`city_id`) REFERENCES cities(`city_id`)
);

CREATE TABLE `orders`(
`order_id` INT PRIMARY KEY,
`customer_id` INT,
CONSTRAINT fk_orders_customers
FOREIGN KEY (`customer_id`) REFERENCES customers(`customer_id`)
);

CREATE TABLE `item_types`(
`item_type_id` INT PRIMARY KEY,
`name` VARCHAR(50)
);

CREATE TABLE `items`(
`item_id` INT PRIMARY KEY,
`name` VARCHAR(50),
`item_type_id` INT,
CONSTRAINT fk_items_item_types
FOREIGN KEY (`item_type_id`) REFERENCES item_types(`item_type_id`)
);

CREATE TABLE `order_items`(
`order_id` INT,
`item_id` INT,
CONSTRAINT pk_items_orders
PRIMARY KEY (`order_id`,`item_id`),
CONSTRAINT fk_order_items_items
FOREIGN KEY (`item_id`) REFERENCES items(`item_id`),
CONSTRAINT fk_order_items_orders
FOREIGN KEY (`order_id`) REFERENCES orders(`order_id`)
);

----------------------------------------------------------------------------------
CREATE TABLE `majors`(
`major_id` INT PRIMARY KEY,
`name` VARCHAR(50)
);

CREATE TABLE `students`(
`student_id` INT PRIMARY KEY,
`student_number` VARCHAR(12),
`student_name` VARCHAR(50),
`major_id` INT,
CONSTRAINT fk_students_majors
FOREIGN KEY (`major_id`) REFERENCES majors(`major_id`)
);

CREATE TABLE `payments`(
`payment_id` INT PRIMARY KEY,
`payment_date` DATE,
`payment_amount` DECIMAL(8,2),
`student_id` INT,
CONSTRAINT fk_payments_students 
FOREIGN KEY (`student_id`) REFERENCES students(`student_id`)
);

CREATE TABLE `subjects`(
`subject_id` INT PRIMARY KEY,
`subject_name` VARCHAR(50)
);

CREATE TABLE `agenda`(
`student_id` INT,
`subject_id` INT,
CONSTRAINT pk_agenda_subjects_students
PRIMARY KEY (`student_id`,`subject_id`),
CONSTRAINT fk_agenda_subjects
FOREIGN KEY (`subject_id`) REFERENCES subjects(`subject_id`),
CONSTRAINT fk_agenda_students
FOREIGN KEY (`student_id`) REFERENCES students(`student_id`)
);

----------------------------------------------------------------------------------
SELECT `mountain_range` AS mountain_range,`peak_name`,`elevation` AS peak_elevation FROM `peaks` AS p
JOIN `mountains` AS m
ON m.`id` = p.`mountain_id`
WHERE mountain_range = 'Rila'
ORDER BY peak_elevation DESC;

 