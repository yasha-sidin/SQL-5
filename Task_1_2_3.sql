USE vk;

-- Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]
-- Выведите данные, используя написанное представление [SELECT]
-- Удалите представление [DROP VIEW]

CREATE OR REPLACE VIEW users_2 AS
	SELECT id, CONCAT(users.firstname, " ", users.lastname) AS to_user
    FROM users;

CREATE OR REPLACE VIEW view AS
	SELECT 
		messages.id,
		CONCAT(users.firstname, " ", users.lastname) AS from_user, 
		users_2.to_user, 
		body
	FROM messages
		JOIN users ON users.id = from_user_id
        JOIN users_2 ON users_2.id = to_user_id;
    
SELECT * 
FROM view;

DROP VIEW view;

