SELECT `title` FROM `books` 
WHERE substring(`title`,1,3) = "The"
ORDER BY `id`;
--------------------------------------------------------------------------
SELECT replace(`title`,"The","***") FROM `books`
WHERE substring(`title`,1,3) = "The"
ORDER BY `id`;
--------------------------------------------------------------------------
SELECT format(sum(`cost`),2) FROM `books`;

--------------------------------------------------------------------------
SELECT concat(`first_name`,' ',`last_name`)  AS 'Full Name',
timestampdiff(DAY,`born`,`died`) AS 'Days Lived' 
FROM `authors`;

--------------------------------------------------------------------------

SELECT `title` FROM `books` 
WHERE `title` LIKE '%Harry%'
ORDER BY `id`;
