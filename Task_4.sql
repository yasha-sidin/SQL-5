USE vk;

-- * Сколько новостей (записей в таблице media) у каждого пользователя?
-- Вывести поля: news_count (количество новостей), user_id (номер пользователя), user_email (email пользователя). 
-- Попробовать решить с помощью CTE или с помощью обычного JOIN.

CREATE OR REPLACE VIEW statistic AS 
	SELECT COUNT(*) AS news_count, media.user_id, users.email
    FROM media
		JOIN users ON users.id = media.user_id
        JOIN media_types ON media_type_id = media_types.id
	WHERE media_types.name = "post"
    GROUP BY media.user_id
    ORDER BY user_id;
	
SELECT *
FROM statistic;