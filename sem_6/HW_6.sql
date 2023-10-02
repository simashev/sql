/*
1. Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. 
Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, 
профиль и запись из таблицы users. Функция должна возвращать номер пользователя.
*/

USE vk;

DROP FUNCTION IF EXISTS delete_user;

DELIMITER $$ 
CREATE FUNCTION delete_user(check_user_id BIGINT UNSIGNED)
RETURNS BIGINT UNSIGNED READS SQL DATA
BEGIN
	DELETE FROM profiles
	WHERE user_id = check_user_id OR photo_id IN (
		SELECT id
		FROM media
		WHERE user_id = check_user_id);
	DELETE FROM likes
	WHERE user_id = check_user_id OR media_id IN (
		SELECT id
		FROM media
		WHERE user_id = check_user_id);
	DELETE FROM media
	WHERE user_id = check_user_id;
	DELETE FROM messages
	WHERE from_user_id = check_user_id
	OR to_user_id = check_user_id;
	DELETE FROM users_communities
	WHERE user_id = check_user_id;
	DELETE FROM friend_requests
	WHERE initiator_user_id = check_user_id
	OR target_user_id = check_user_id;
	DELETE FROM users
	WHERE id = check_user_id;
	RETURN check_user_id;
END$$
DELIMITER ;

SELECT delete_user(7);

/*
 * 2. Предыдущую задачу решить с помощью процедуры и обернуть используемые команды в 
 * транзакцию внутри процедуры.
 */
USE vk;
DROP PROCEDURE IF EXISTS `delete_user_by_user_id`;

DELIMITER $$

CREATE PROCEDURE delete_user_by_user_id(check_user_id BIGINT UNSIGNED)

BEGIN
    DECLARE `_rollback` BOOL DEFAULT 0;
   	DECLARE code varchar(100);
   	DECLARE error_string varchar(100);
   	DECLARE last_user_id int;
   	DECLARE tran_result varchar(200);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
    	SET `_rollback` = 1;
	GET stacked DIAGNOSTICS CONDITION 1
        code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
    	set tran_result := concat('Error occured. Code: ', code, '. Text: ', error_string);
    END;
    START TRANSACTION;
		DELETE FROM profiles
		WHERE user_id = check_user_id OR photo_id IN (
			SELECT id
			FROM media
			WHERE user_id = check_user_id);
		DELETE FROM likes
		WHERE user_id = check_user_id OR media_id IN (
			SELECT id
			FROM media
			WHERE user_id = check_user_id);
		DELETE FROM media
		WHERE user_id = check_user_id;
		DELETE FROM messages
		WHERE from_user_id = check_user_id
		OR to_user_id = check_user_id;
		DELETE FROM users_communities
		WHERE user_id = check_user_id;
		DELETE FROM friend_requests
		WHERE initiator_user_id = check_user_id
		OR target_user_id = check_user_id;
		DELETE FROM users
		WHERE id = check_user_id;

	    IF `_rollback` THEN
	    	SELECT tran_result;
	       ROLLBACK;
	    ELSE
	       set tran_result := 'ok';
		  SELECT * FROM users;
	      COMMIT;
	    END IF;
END$$

DELIMITER ;
CALL delete_user_by_user_id(1);

/* 
 * 3. Написать триггер, который проверяет новое появляющееся сообщество.
 * Длина названия сообщества (поле name) должна быть не менее 5 символов.
 * Если требование не выполнено, то выбрасывать исключение с пояснением.
 */
USE vk;
DROP TRIGGER IF EXISTS check_new_community_name;
DELIMITER $$

CREATE TRIGGER check_new_community_name BEFORE INSERT ON communities
FOR EACH ROW
BEGIN
	IF CHAR_LENGTH(NEW.name) < 5 THEN
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'Обновление отменено. Длина имени сообщества должна быть не менее 5 символов.';
    END IF;
END$$

DELIMITER ;

INSERT INTO communities (name)
VALUES ('new');
