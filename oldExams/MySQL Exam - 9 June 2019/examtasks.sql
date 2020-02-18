INSERT INTO `cards` (card_number,card_status,bank_account_id) 
SELECT
(SELECT REVERSE(c.full_name)) AS `card_number`,
'Active' AS `card_status`,
(SELECT c.id) AS `bank_account_id`  
 FROM `clients` AS c
WHERE c.`id` BETWEEN 191 AND 200;
 
---------------------------------------------------------------------------------------
UPDATE `employees_clients`  AS ec
SET ec.`employee_id` =(SELECT employee_id FROM 
(SELECT employee_id,count(`client_id`) as client_count
FROM employees_clients
GROUP BY employee_id
ORDER BY client_count,employee_id 
LIMIT 1 ) AS `employee`)
WHERE ec.`client_id` = ec.`employee_id` AND ec.`client_id` > 0;
 
----------------------------------------------------------------------------------------
 DELETE FROM `employees`
 WHERE `id` > 0 AND `id` NOT IN (SELECT `employee_id` FROM `employees_clients`);
 ----------------------------------------------------------------------------------------
SELECT `id`,`full_name` FROM `clients` 
ORDER BY `id`;
----------------------------------------------------------------------------------------
SELECT `id`, concat(`first_name`, ' ',`last_name`) as full_name,concat('$',`salary`) as salary,`started_on` FROM `employees`
WHERE salary > 100000 AND DATE(started_on) > '2018-01-01'
ORDER BY salary DESC,id; 

----------------------------------------------------------------------------------------

SELECT cs.`id`, concat(cs.`card_number`,' : ',c.`full_name`) as card_token FROM `clients` as c
JOIN bank_accounts as ba
ON c.`id` = ba.`client_id`
JOIN cards as cs
ON ba.`id` = cs.`bank_account_id`
ORDER BY cs.`id` DESC;

 ----------------------------------------------------------------------------------------
 
 SELECT concat(e.`first_name`, ' ',e.`last_name`) as 'name',e.`started_on`, count(ec.`client_id`) as count_of_clients  FROM `employees` as e
 JOIN `employees_clients` as ec
 ON e.`id` = ec.`employee_id`
 GROUP BY `employee_id`
 ORDER BY count_of_clients DESC,ec.`employee_id` ASC
 LIMIT 5;
 
 ----------------------------------------------------------------------------------------

SELECT b.`name`,count(c.`id`) as count_of_cards FROM `branches` as b
LEFT JOIN employees as em
ON b.`id` = em.`branch_id`
LEFT JOIN employees_clients as ec
ON em.`id` = ec.`employee_id`
LEFT JOIN clients as cs
ON ec.`client_id` = cs.`id`
LEFT JOIN bank_accounts as ba
ON cs.`id` = ba.`client_id`
LEFT JOIN cards as c
ON ba.`id` = c.`bank_account_id`
GROUP BY b.`name`
ORDER BY count_of_cards DESC ,b.`name`;



