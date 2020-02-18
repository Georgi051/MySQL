/*2. Insert
 You will have to insert records of data into the coaches table, based on the players table. 
For players with age over 45 (inclusive), insert data in the coaches table with the following values:
•	first_name – set it to first name of the player
•	last_name – set it to last name of the player.
•	salary – set it to double as player’s salary. 
•	coach_level – set it to be equals to count of the characters in player’s first_name.*/

INSERT INTO `coaches` (first_name,last_name,salary,coach_level)
SELECT
(SELECT `first_name`),
(SELECT `last_name`),
(SELECT `salary` * 2) , 
(SELECT char_length(`first_name`)) FROM `players` 
WHERE  `age` >= 45;

---------------------------------------------------------------

/*3. Update
Update all coaches, who train one or more players and their first_name starts with ‘A’. Increase their level with 1. */

UPDATE `coaches`
SET `coach_level` = `coach_level` + 1
WHERE `id`  IN (SELECT DISTINCT (`coach_id`) FROM `players_coaches`)
AND  left(`first_name`,1)  = 'A';

---------------------------------------------------------------
/*4.Delete
As you remember at the beginning of our work, we promoted several football players to coaches. Now you need to remove all of them from the table of players in order for our database to be updated accordingly.	
Delete all players from table players, which are already added in table coaches. 
*/
DELETE FROM `players` 
WHERE `age` >= 45;

---------------------------------------------------------------
/*5.Select
Extract from the Football Scout Database (fsd) database, info about all of the players. 
Order the results by players - salary descending.
Required Columns
•	first_name
•	age
•	salary */

SELECT `first_name`,`age`,`salary` FROM `players`
ORDER BY `salary` DESC;

---------------------------------------------------------------

/*6.Select with join
One of the coaches wants to know more about all the young players (under age of 20) who can strengthen his team in the offensive (played on position ‘A’). 
As he is not paying a transfer amount, he is looking only for those who have not signed a contract so far (haven’t hire_date) and have strength of more than 50.
 Order the results ascending by salary, then by age.

Required Columns
•	id (player)
•	full_name 
•	age
•	position
•	hire_date */

SELECT p.`id`, concat(p.`first_name`,' ',p.`last_name`) as full_name,p.`age`,p.`position` as position,p.`hire_date` FROM `players` as p
JOIN `skills_data` as sd
ON  p.`skills_data_id` = sd.`id`
WHERE p.`age` < 23 AND p.`position` = 'A' AND `hire_date` IS NULL AND  sd.`strength` > 50
ORDER BY p.`salary`,p.`age`;

---------------------------------------------------------------
/*7.Select with join
Extract from the database all of the teams and the count of the players that they have.
Order the results descending by count of players, then by fan_base descending. 
Required Columns
•	team_name
•	established
•	fan_base
•	count_of_players */

SELECT t.`name` as team_name, t.`established`,t.`fan_base`,count(p.`id`) as players_count FROM `teams` as t
LEFT JOIN `players` as p
ON p.`team_id` = t.`id`
GROUP BY t.`fan_base`
ORDER BY players_count DESC , t.`fan_base` DESC;
---------------------------------------------------------------
/*8.Select with join
Extract from the database, the fastest player (having max speed), in terms of towns where their team played.
Order players by speed descending, then by town name.
Skip players that played in team ‘Devify’

Required Columns
•	max_speed
•	town_name */

SELECT MAX(sd.`speed`) as max_speed, t.`name` FROM `towns` as t
LEFT JOIN `stadiums` as s
ON s.`town_id` = t.`id`
LEFT JOIN `teams` as te
ON s.`id` = te.`stadium_id`
LEFT JOIN `players` as p
ON p.`team_id` = te.`id`
LEFT JOIN `skills_data` as sd
ON sd.`id` = p.`skills_data_id`
WHERE te.`name` != 'Devify'
GROUP BY t.`name`
ORDER BY max_speed DESC , t.`name`;
---------------------------------------------------------------
/*9.Select with join
 And like everything else in this world, everything is ultimately about finances. Now you need to extract detailed information on the amount of all salaries given to football players by the criteria of the country in which they played.
If there are no players in a country, display NULL.  Order the results by total count of players in descending order, then by country name alphabetically.

Required Columns
•	name (country)
•	total_sum_of_salaries
•	total_count_of_players */

SELECT c.`name`,count(p.`id`)as total_count_of_players,sum(p.`salary`) FROM `countries` as c
LEFT JOIN `towns` as t
ON t.`country_id` = c.`id`
LEFT JOIN `stadiums` as s
ON s.`town_id` = t.`id`
LEFT JOIN `teams` as ts
ON ts.`stadium_id` = s.`id`
LEFT JOIN `players` as p
ON p.`team_id` = ts.`id`
GROUP BY c.`name`
ORDER BY total_count_of_players DESC,c.`name`;
---------------------------------------------------------------
/*10.Create a user defined function with the name udf_stadium_players_count (stadium_name VARCHAR(30))
that receives a stadium’s name and returns the number of players that play home matches there. */

DELIMITER  $$
CREATE FUNCTION udf_stadium_players_count  (stadium_name VARCHAR(30)) 
RETURNS INT
BEGIN
DECLARE result INT;
SET result := (SELECT count(p.`id`) FROM `players` as p
LEFT JOIN `teams` as t
ON t.`id` = p.`team_id` 
LEFT JOIN `stadiums` as s
ON t.`stadium_id` = s.`id`
WHERE s.`name` = stadium_name);
RETURN result;
END 
DELIMITER $$;

---------------------------------------------------------------
/*11  Create a stored procedure udp_find_playmaker which accepts the following parameters:
•	min_dribble_points 
•	team_name (with max length 45)
And extracts data about the players with the given skill stats (more than min_dribble_points), played for given team (team_name)
and have more than average speed for all players.
Order players by speed descending. Select only the best one.*/

DELIMITER  $$
CREATE PROCEDURE udp_find_playmaker(min_dribble_points INT,team_name VARCHAR(45))
BEGIN 
SELECT concat(p.`first_name`,' ',p.`last_name`) as full_name,p.`age`,p.`salary`,sd.`dribbling`,sd.`speed` as speed,te.`name`as team_name FROM `players` as p
JOIN `skills_data` as sd
ON p.`skills_data_id` = sd.`id`
JOIN `teams` as te
ON p.`team_id` = te.`id`
WHERE sd.`dribbling` > min_dribble_points
AND te.`name` = team_name
AND sd.`speed` > (SELECT avg(ski.`speed`) FROM `skills_data` as ski)
ORDER BY speed DESC
LIMIT 1
END
DELIMITER $$;


