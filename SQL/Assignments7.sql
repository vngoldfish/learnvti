USE Testing_System_Assignment_3;
-- Question 1 : 作成日が1年以上前のグループを追加できないようにするトリガーを作成する
DROP TRIGGER IF EXISTS CheckCreateDateBeforeInsert;
DELIMITER $$
CREATE TRIGGER CheckCreateDateBeforeInsert
BEFORE INSERT ON `Group`
FOR EACH ROW
	BEGIN
	DECLARE onYearAgo DATE;
    SET onYearAgo = DATE_SUB(CURDATE(),INTERVAL 1 YEAR);
		IF NEW.CreateDate < onYearAgo THEN
			SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = 'Lỗi ngày tạo không hợp lệ';
		END IF;
    END $$
DELIMITER ;
INSERT INTO `Group` (GroupName,CreateDate) VALUES ("Text 1","2022-05-07");
-- Question 2 : ユーザーを部門「Sale」に追加できないようにするトリガーを作成し、追加しようとした場合に「Department 'Sale' cannot add more user」というメッセージを表示する
