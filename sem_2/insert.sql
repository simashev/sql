		
-- Заполнить 2 таблицы БД vk данными (по 10 записей в каждой таблице) (INSERT)					
		
USE vk;					
INSERT INTO `users` (firstname, lastname, email, phone) 					
     VALUES					
     	('Константин', 'Власов', '1@mail.ru', '7495076964'),				
     	('Элина', 'Мешкова', '2@mail.ru', '7495251476'),				
     	('Вероника', 'Калугина', '3@mail.ru', '7495641204'),				
     	('Екатерина', 'Иванова', '4@mail.ru', '7495549232'),				
     	('Тимофей', 'Голубев', '5@mail.ru', '7495352438'),				
     	('Агата', 'Иванова', '6@mail.ru', '7495929181'),				
     	('Евгения', 'Киселева', '7@mail.ru', '7495673224'),				
     	('Зоя', 'Морозова', '8@mail.ru', '7495293832'),				
     	('Диана', 'Муравьева', '9@mail.ru', '7495744096'),				
     	('Сергей', 'Королев', '10@mail.ru', '7495358288');				
     					
 INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `hometown`)					
 	  VALUES				
 	  	(1, 'm', '2001-12-13', 'Тула'),			
 	  	(2, 'f', '2002-06-06', 'Москва'),			
 	  	(3, 'f', '1988-09-01', 'Питер'),			
 	  	(4, 'f', '2010-01-01', 'Москва'),			
 	  	(5, 'm', '2005-03-08', 'Екатеринбург'),			
 	  	(6, 'f', '1967-12-06', 'Мышкин'),			
 	  	(7, 'f', '2008-04-20', 'Самара'),			
 	  	(8, 'f', '2010-10-10', 'Питер'),			
 	  	(9, 'f', '1997-05-12', 'Сочи'),			
 	  	(10, 'm', '2002-11-11', 'Краснодар');		