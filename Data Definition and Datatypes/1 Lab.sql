CREATE SCHEMA `gamebar`;

CREATE TABLE employees(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(50),
`last_name` VARCHAR(50)
);


ALTER TABLE products
ADD CONSTRAINT fk_categories_products FOREIGN KEY (`category_id`) REFERENCES categories (`id`);

ALTER TABLE employees
CHANGE COLUMN `middle_name` `middle_name` VARCHAR(100);
