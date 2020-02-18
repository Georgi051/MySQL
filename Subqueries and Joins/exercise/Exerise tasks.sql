SELECT e.`employee_id`,e.`job_title`,e.`address_id`,a.`address_text` FROM `employees` as e
JOIN `addresses` as a
ON e.`address_id` = a.`address_id`
ORDER BY address_id ASC
LIMIT 5;
------------------------------------------------------------------------------------------------

SELECT e.`first_name`,e.`last_name`,t.`name`,a.`address_text` FROM `employees` as e
JOIN `addresses` as a 
ON e.`address_id` = a.`address_id`
JOIN `towns` as t
ON t.`town_id` = a.`town_id`
ORDER BY `first_name`,`last_name`
LIMIT 5;

------------------------------------------------------------------------------------------------

SELECT e.`employee_id`, e.`first_name`,e.`last_name`,d.`name`
FROM `employees` as e
JOIN `departments` as d
ON e.`department_id` = d.`department_id`
WHERE d.`name` = 'Sales'
ORDER BY `employee_id` DESC;

------------------------------------------------------------------------------------------------

SELECT e.`employee_id`, e.`first_name`,e.`salary`,d.`name` FROM `employees` as e
JOIN `departments` as d 
ON e.`department_id` = d.`department_id`
WHERE `salary` > 15000
ORDER BY d.`department_id` DESC
LIMIT 5;

------------------------------------------------------------------------------------------------

SELECT e.`employee_id`,e.`first_name` FROM `employees` as e
LEFT JOIN `employees_projects` as ep
ON ep.`employee_id` = e.`employee_id`
WHERE `project_id` IS NULL
ORDER BY e.`employee_id` DESC 
LIMIT 3;

------------------------------------------------------------------------------------------------

SELECT e.`first_name`,e.`last_name`,e.`hire_date`,d.`name` as dept_name FROM `employees` as e
JOIN `departments` as d
ON e.`department_id` = d.`department_id`
WHERE DATE(e.`hire_date`) > '1999-01-01' AND `name` IN ('Sales','Finance')
ORDER BY e.`hire_date` ASC;

------------------------------------------------------------------------------------------------

SELECT e.`employee_id`,e.`first_name`,p.`name` as project_name FROM `employees` as e
JOIN `employees_projects` as ep
ON ep.`employee_id` = e.`employee_id`
JOIN `projects` as p
ON  ep.`project_id` = p.`project_id`
WHERE DATE(p.`start_date`) > '2002-08-13' AND DATE(p.`end_date`) IS NULL
ORDER BY `first_name`, project_name
LIMIT 5;

------------------------------------------------------------------------------------------------

SELECT e.`employee_id`,e.`first_name`,(
CASE 
WHEN year(p.`start_date`) > '2004' THEN NULL
ELSE p.`name`
END
 )as project_name 
FROM `employees` as e
JOIN `employees_projects` as ep
ON ep.`employee_id` = e.`employee_id`
JOIN `projects` as p
ON  ep.`project_id` = p.`project_id`
WHERE e.`employee_id` = 24 
ORDER BY project_name;

------------------------------------------------------------------------------------------------
SELECT e.`employee_id`,e.`first_name`,e.`manager_id`,m.`first_name` as manager_name FROM `employees` as e
JOIN `employees` as m
ON e.`manager_id` = m.`employee_id`
WHERE e.`manager_id` IN(3,7)
ORDER BY e.`first_name`;

------------------------------------------------------------------------------------------------

SELECT e.`employee_id`,
concat(e.`first_name`, ' ',e.`last_name`) as employee_name,
concat(m.`first_name`, ' ',m.`last_name`) as manager_name,
d.`name` as dept_name
FROM `employees` as e
JOIN `employees` as m
ON e.`manager_id` = m.`employee_id`
JOIN `departments` as d
ON e.`department_id` = d.`department_id`
WHERE e.`manager_id` IS NOT NULL
ORDER BY e.`employee_id`
LIMIT 5;

------------------------------------------------------------------------------------------------

SELECT avg(`salary`)as min_average_salary FROM `employees`
GROUP BY department_id
ORDER BY min_average_salary 
LIMIT 1;
------------------------------------------------------------------------------------------------

SELECT c.`country_code`, m.`mountain_range`, p.`peak_name`, p.`elevation` FROM `countries` as c
JOIN `mountains_countries` as mc
ON c.`country_code` = mc.`country_code`
JOIN `mountains` as m
ON mc.`mountain_id` = m.`id`
JOIN `peaks` as p
ON m.`id` = p.`mountain_id`
WHERE c.`country_code` = 'BG' AND p.`elevation` > 2835
ORDER BY elevation DESC;

------------------------------------------------------------------------------------------------

SELECT c.`country_code`,count(m.`mountain_range`) as mountain_range FROM `countries` as c
JOIN `mountains_countries` as mc
ON c.`country_code` = mc.`country_code`
JOIN `mountains` as m
ON mc.`mountain_id` = m.`id`
GROUP BY c.`country_code`
HAVING c.`country_code` IN ('US','BG','RU')
ORDER BY mountain_range DESC;

------------------------------------------------------------------------------------------------

SELECT c.`country_name`,r.`river_name` FROM `countries` as c
LEFT JOIN `countries_rivers` as cr
ON c.`country_code` = cr.`country_code`
LEFT JOIN `rivers` as r
ON cr.`river_id` = r.`id`
WHERE c.`continent_code` = 'AF'
ORDER BY c.`country_name`
LIMIT 5;

------------------------------------------------------------------------------------------------
#????
SELECT c.`continent_code`, c.`currency_code`, count(c.`currency_code`) as currency_usage FROM `countries` as c
GROUP BY c.`currency_code`;

SELECT COUNT(country_code) AS pc, currency_code
FROM countries
WHERE continent_code = 'EU' 
GROUP BY currency_code
HAVING pc > 1
ORDER BY pc DESC
LIMIT 1;

------------------------------------------------------------------------------------------------
SELECT count(c.`country_code`) as country_count FROM `countries` as c
LEFT JOIN `mountains_countries` as mc
ON c.`country_code` = mc.`country_code`
WHERE mc.`mountain_id` IS NULL;

------------------------------------------------------------------------------------------------
 
SELECT c.`country_name`, p.`elevation` as highest_peak_elevation, r.`length` as longest_river_length FROM `countries` as c 
JOIN `countries_rivers` as cr
ON c.`country_code` = cr.`country_code` 
JOIN `rivers` as r 
ON cr.`river_id` = r.`id`
JOIN `mountains_countries` as mc
ON c.`country_code` = mc.`country_code` 
JOIN `mountains` as m
ON mc.`mountain_id` = m.`id`
JOIN `peaks` as p
ON m.`id` = p.`mountain_id`
GROUP BY c.`country_name`
ORDER BY highest_peak_elevation DESC , longest_river_length DESC
LIMIT 5;






