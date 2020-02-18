
DELIMITER $$ 
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN 
SELECT e.`first_name`, e.`last_name` FROM `employees` as e
WHERE e.`salary` > 35000
ORDER BY first_name, last_name , employee_id;
END; $$
------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above(currNumber DECIMAL(19,4))
BEGIN 
SELECT e.`first_name`, e.`last_name` FROM `employees` as e
WHERE e.`salary` >= currNumber
ORDER BY first_name, last_name , employee_id;
END;$$
-----------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE usp_get_towns_starting_with(currValue VARCHAR(40))
BEGIN
SELECT `name` as town_name FROM `towns`
WHERE `name` LIKE concat(currValue,'%')
ORDER BY town_name;
END;$$
--------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(40))
BEGIN
SELECT e.`first_name`,e.`last_name` FROM `employees` as e
JOIN addresses as a
ON e.`address_id` = a.`address_id`
JOIN towns as t
ON a.`town_id` = t.`town_id`
WHERE t.`name` = town_name
ORDER BY e.`first_name`,e.`last_name`,e.`employee_id`;
END;$$
------------------------------------------------------------------------
DELIMITER $$ 
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN 
SELECT e.`first_name`, e.`last_name` FROM `employees` as e
WHERE e.`salary` > 35000
ORDER BY first_name, last_name , employee_id;
END $$
------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ufn_get_salary_level (salary DECIMAL(19,4))
RETURNS VARCHAR(10)
BEGIN
IF(salary < 30000 ) THEN RETURN 'Low';
ELSEIF(salary BETWEEN 30000 AND 50000) THEN RETURN 'Average';
ELSE RETURN 'High';
END IF;
END$$
-----------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(40))
BEGIN
SELECT `first_name`,`last_name` FROM `employees` 
WHERE lower(ufn_get_salary_level(salary)) = salary_level
ORDER BY first_name DESC, last_name DESC;
END;$$
--------------------------------------------------------------------------
DELIMITER $$ 
CREATE FUNCTION ufn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50)) 
RETURNS BIT
RETURN word REGEXP(concat('^[', set_of_letters , ']+$'));
$$
--------------------------------------------------------------------------
DELIMITER $$ 
CREATE PROCEDURE  usp_get_holders_full_name ()
BEGIN 
SELECT concat(`first_name`, ' ',`last_name`) as full_name FROM `account_holders`
ORDER BY full_name,id;
END;$$
--------------------------------------------------------------------------
DELIMITER $$ 
CREATE PROCEDURE usp_get_holders_with_balance_higher_than (currNumber DOUBLE)
BEGIN
SELECT `first_name`,`last_name` FROM `account_holders` as ah
JOIN accounts as a
ON a.`account_holder_id` = ah.`id` 
GROUP BY ah.`id`
HAVING SUM(a.`balance`) > currNumber
ORDER BY ah.id;
END;$$

--------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ufn_calculate_future_value(initialSum DOUBLE, yearlyInterestRate DOUBLE,numbeOfYears INT)
RETURNS DOUBLE
BEGIN 
RETURN initialSUM * pow(1 + yearlyInterestRate,numbeOfYears);
END$$
--------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE usp_calculate_future_value_for_account(account_id INT, interest_rate DECIMAL(19, 4))
BEGIN
SELECT a.`id`,ah.`first_name`,ah.`last_name`,a.`balance` as current_balance,(
format(ufn_calculate_future_value(a.`balance`, interest_rate,5),4) 
)as balance_in_5_years FROM `account_holders` as ah
JOIN accounts as a
ON a.`account_holder_id` = ah.`id` 
WHERE account_id = a.`id`;
END;$$
--------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE usp_deposit_money(account_id INT, money_amount DECIMAL(20,4))
BEGIN 
IF(money_amount > 0) THEN 
START TRANSACTION;
UPDATE `accounts` AS а 
SET 
    `balance` = `balance` + money_amount
WHERE
    а.`id` = account_id;
 
IF(SELECT а.`balance`  FROM `accounts` as а
 WHERE а.`id` = account_id) < 0 
 THEN 
  ROLLBACK;
 ELSE 
  COMMIT;
 END IF;
 
END IF;
END;$$
--------------------------------------------------------------------------

