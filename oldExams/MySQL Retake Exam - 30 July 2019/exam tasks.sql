/*INSERT INTO `likes`(
(IF (SELECT (u.`id` % 2) = 0  FROM `users` as u)  THEN  l.`article_id` = u.`id`
ELSE l.`comment_id` = u.`id`),
l.`
 )FROM `likes` as l
 WHERE l.`id` BETWEEN 16 AND 20;*/
 --------------------------------------------------------
 UPDATE `comments` 
SET 
    `comment` = (CASE
        WHEN `id` % 2 = 0 THEN 'Very good article.'
        WHEN `id` % 3 = 0 THEN 'This is interesting.'
        WHEN `id` % 5 = 0 THEN 'I definitely will read the article again.'
        WHEN `id` % 7 = 0 THEN 'The universe is such an amazing thing.'
        ELSE `comment`
    END)
WHERE `id` BETWEEN 1 AND 15;
 
 --------------------------------------------------------
 DELETE FROM `articles` WHERE
 `category_id` IS NULL;
 --------------------------------------------------------
SELECT `title`,CONCAT(LEFT(`content`,20),'...') as summary  FROM (SELECT `id`,`title`,length(`content`) as size,`content` 
FROM `articles`
ORDER BY size DESC
LIMIT 3
) as a
ORDER BY a.`id`;

--------------------------------------------------------
SELECT a.`id`,a.`title` FROM `articles` as a
JOIN `users_articles` as ua
ON a.`id` = ua.`article_id`
WHERE ua.`user_id` = ua.`article_id`
GROUP BY a.`title`
ORDER BY ua.`article_id`;

--------------------------------------------------------
SELECT category,
 
	(SELECT count(*) FROM articles
	WHERE category_id = c.id) AS articles,
    
		(SELECT count(*) FROM likes AS l
		JOIN articles AS ar
		ON ar.id = l. article_id
		WHERE ar.category_id = c.id) AS likes
        
FROM categories AS c
ORDER BY likes DESC, articles DESC, c.id;
--------------------------------------------------------

