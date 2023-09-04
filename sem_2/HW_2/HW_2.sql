-- Задание 
--  Написать скрипт, добавляющий в созданную БД vk 2-3 новые таблицы
--  (с перечнем полей, указанием индексов и внешних ключей) (CREATE TABLE)

DROP TABLE IF EXISTS `news_communities`;
CREATE TABLE `news_communities` (
	news_communitues_id BIGINT UNSIGNED NOT NULL,
	media_type_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    zagolovok VARCHAR (50),
  	body TEXT,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    news_type_id BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY (news_communitues_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (media_type_id) REFERENCES media_types(id),
    FOREIGN KEY (news_type_id) REFERENCES news_types(id)
);

DROP TABLE IF EXIST `news_types`;
CREATE TABLE `news_types` (
		id SERIAL, 
		news_types ENUM ('post', 'article', 'audio', 'video', 'photo', 'gallery')
);

