SELECT e.`employee_id`, concat(`first_name`, ' ',`last_name`) as full_name, d.`department_id`,d.`name` as department_name FROM `employees` AS e
RIGHT JOIN `departments` as d 
ON d.`manager_id` = e.`employee_id`
ORDER BY e.`employee_id` 
LIMIT 5;

--------------------------------------------------------------------------------
SELECT a.`town_id`,t.`name` AS town_name, a.`address_text` FROM  `addresses` as a
JOIN `towns` as t 
ON a.`town_id` = t.`town_id`
WHERE `name` = 'Sofia' OR `name` LIKE'%San%' OR `name` LIKE'%Car%'
ORDER BY `town_id`,`address_id`;

-----------------------------------------------------------------------

SELECT `employee_id`,`first_name`,`last_name`,`department_id`,`salary` FROM `employees`
WHERE `manager_id` IS NULL;

-----------------------------------------------------------------------

SELECT count(`salary`) FROM `employees` 
WHERE `salary` > (SELECT AVG(`salary`) FROM `employees`);