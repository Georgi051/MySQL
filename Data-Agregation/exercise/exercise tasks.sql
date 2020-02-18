SELECT COUNT(*) FROM `wizzard_deposits`;

SELECT MAX(`magic_wand_size`) FROM `wizzard_deposits`;

SELECT `deposit_group`,MAX(`magic_wand_size`) AS longest_magic_wand FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY longest_magic_wand , `deposit_group`;

SELECT `deposit_group` FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY avg(`magic_wand_size`) ASC
LIMIT 1;

SELECT `deposit_group` ,sum(`deposit_amount`) AS total_sum FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY total_sum;

SELECT `deposit_group` ,sum(`deposit_amount`) AS total_sum FROM `wizzard_deposits`
WHERE `magic_wand_creator` = "Ollivander family"
GROUP BY `deposit_group`
ORDER BY `deposit_group`;

SELECT `deposit_group` ,sum(`deposit_amount`) AS total_sum FROM `wizzard_deposits`
WHERE `magic_wand_creator` = "Ollivander family"
GROUP BY `deposit_group`
HAVING total_sum < 150000
ORDER BY total_sum DESC;

SELECT `deposit_group`,`magic_wand_creator`, min(`deposit_charge`) AS min_deposit_charge FROM `wizzard_deposits` 
GROUP BY `deposit_group`,`magic_wand_creator`
ORDER BY `magic_wand_creator`,`deposit_group`;

SELECT (
CASE
WHEN `age` BETWEEN 0 AND 10 THEN '[0-10]'
WHEN `age` BETWEEN 11 AND 20 THEN '[11-20]'
WHEN `age` BETWEEN 21 AND 30 THEN '[21-30]'
WHEN `age` BETWEEN 31 AND 40 THEN '[31-40]'
WHEN `age` BETWEEN 41 AND 50 THEN '[41-50]'
WHEN `age` BETWEEN 51 AND 60 THEN '[51-60]'
ELSE '[61+]'
END
)AS age_group,
COUNT(`id`) AS wizzard_count FROM `wizzard_deposits`
GROUP BY `age_group`
ORDER BY wizzard_count;

SELECT DISTINCT left(`first_name`,1) AS first_letter FROM `wizzard_deposits`
WHERE `deposit_group` = "Troll Chest"
ORDER BY  first_letter;

SELECT `deposit_group`, `is_deposit_expired`,AVG(`deposit_interest`) AS average_interest FROM `wizzard_deposits`
WHERE `deposit_start_date` > '1985-01-01'
GROUP BY `deposit_group`,`is_deposit_expired`
ORDER BY `deposit_group` DESC, `is_deposit_expired`;


SELECT SUM(XX.DIFF) 
FROM (SELECT deposit_amount - (SELECT deposit_amount FROM wizzard_deposits WHERE Id = g.Id + 1) 
AS DIFF FROM wizzard_deposits AS g) AS XX;


SELECT `department_id`,min(`salary`) AS minimum_salary FROM `employees`
WHERE `department_id` IN(2,5,7) AND DATE(`hire_date`) > '2000-01-01'
GROUP BY `department_id`;

--------------------------------------------------------
CREATE TABLE `copy_table` SELECT * FROM `employees`
WHERE `salary` > 30000;

DELETE FROM `copy_table` 
WHERE `manager_id` = 42;

UPDATE `copy_table` SET `salary` = `salary` + 5000 
WHERE `department_id` = 1;

SELECT `department_id`, avg(`salary`)  FROM `copy_table`
GROUP BY `department_id`
ORDER BY `department_id`;

------------------------------------------------



