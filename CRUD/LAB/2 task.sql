SELECT 
`id`,
concat(`first_name`,' ',`last_name`) AS
'full_name',
`job_title` AS 'job_title',
`salary` AS 'salary'
FROM `employees` WHERE salary > 1000;