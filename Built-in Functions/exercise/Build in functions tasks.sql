SELECT `first_name`,`last_name` FROM `employees`
WHERE substring(`first_name`,1,2) = 'Sa'
ORDER BY `employee_id`; 

SELECT  `first_name`,`last_name` FROM `employees`
WHERE `last_name` LIKE '%ei%'
ORDER BY `employee_id`;

SELECT `first_name` FROM `employees`
WHERE `department_id` IN(3,10) AND 
year(`hire_date`) BETWEEN 1995 AND 2005
ORDER BY `employee_id`;

SELECT `first_name`,`last_name` FROM `employees`
WHERE `job_title` NOT LIKE '%engineer%'
ORDER BY `employee_id`;

SELECT `name` FROM `towns`
WHERE char_length(`name`) BETWEEN 5 AND 6
ORDER BY `name`;

SELECT * FROM `towns` 
WHERE substring(`name`,1,1) IN ('M','K','B','E')
ORDER BY `name` ASC;

SELECT * FROM `towns` 
WHERE substring(`name`,1,1)NOT IN ('R','B','D')
ORDER BY `name` ASC;


CREATE VIEW v_employees_hired_after_2000
AS SELECT `first_name`,`last_name` FROM `employees`
WHERE year(`hire_date`) > 2000;


SELECT `first_name`,`last_name` FROM `employees`
WHERE  length(`last_name`) = 5;

SELECT `country_name`,`iso_code` FROM `countries`
WHERE `country_name` LIKE ('%a%a%a%')
ORDER BY `iso_code` ASC;


SELECT p.`peak_name`,r.`river_name`,
lower(CONCAT(`peak_name`,SUBSTRING(`river_name`,2))) AS 'mix'
FROM `peaks` AS p ,`rivers` AS r 
WHERE right(`peak_name`,1) = left(`river_name`,1)
ORDER BY `mix`;

SELECT `name`,substring(`start`,1,10) AS 'start' FROM `games`
WHERE  year(`start`) IN(2011,2012)
ORDER BY `start`,`name`
LIMIT 50;

SELECT `user_name`,substring(`email`,locate("@",`email`) + 1) AS 'Email Provider' FROM `users`
ORDER BY `Email Provider`,`user_name`;


SELECT `user_name`,`ip_address` FROM `users` 
WHERE `ip_address` LIKE '___.1%.%.___'
ORDER BY `user_name`;

SELECT `name`,
(
CASE
WHEN hour(`start`) BETWEEN 0 AND 11 THEN 'Morning'
WHEN hour(`start`) BETWEEN 12 AND 17 THEN 'Afternoon'
WHEN hour(`start`) BETWEEN 18 AND 23 THEN 'Evening'
END
) AS 'Part of the Day',
(
CASE
WHEN  `duration` BETWEEN 0 AND 3 THEN 'Extra Short'
WHEN  `duration` BETWEEN 4 AND 6 THEN 'Short'
WHEN  `duration` BETWEEN 7 AND 10 THEN 'Long'
ELSE
'Extra Long'
END
) AS 'Duration'
FROM `games`;


SELECT `product_name`,`order_date`,
date_add(`order_date`,interval 3 DAY) AS 'pay_due',
date_add(`order_date`,interval 1 MONTH) AS 'deliver_due'
FROM `orders`;

