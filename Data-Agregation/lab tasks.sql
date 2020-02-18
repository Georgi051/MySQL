SELECT `department_id` AS 'department_id',COUNT(`first_name`) AS 'Number of employees' FROM `employees`
GROUP BY `department_id`;

SELECT `department_id` AS 'department_id',round(avg(`salary`),2) AS 'Average Salary' FROM `employees`
GROUP BY `department_id`;

SELECT `department_id` AS 'department_id',round(min(`salary`),2) AS `Min Salary` FROM `employees`
GROUP BY `department_id`
LIMIT 1;

SELECT COUNT(`id`) FROM `products`
WHERE `category_id` = 2 AND price > 8;

SELECT `category_id`,round(avg(`price`),2) AS 'Average price',
min(round(`price`,2)) AS 'Cheapest Product',
max(round(`price`,2)) AS 'Most Expensive Product'
FROM `products`
GROUP BY `category_id`;
