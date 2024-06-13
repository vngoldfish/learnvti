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
-- INSERT INTO `Group` (GroupName,CreateDate) VALUES ("Text 1","2022-05-07");
-- Question 2 : ユーザーを部門「Sale」に追加できないようにするトリガーを作成し、追加しようとした場合に「Department 'Sales' cannot add more user」というメッセージを表示する
DROP TRIGGER IF EXISTS PreventSaleDepartmentInsert;
DELIMITER $$ 
	CREATE TRIGGER PreventSaleDepartmentInsert
    BEFORE INSERT ON Accounts
    FOR EACH ROW
		BEGIN
			DECLARE depName VARCHAR(30);
            SELECT DepartmentName INTO depName FROM Department WHERE DepartmentId = NEW.DepartmentId;
            IF depName = 'Sales' THEN
				SIGNAL SQLSTATE '45000' 
				SET MESSAGE_TEXT = 'Department "Sale" cannot add more user';
			END IF ;
        END $$
DELIMITER ;
 -- INSERT INTO Accounts (Email,UserName,FullName,DepartmentId,PositionId) VALUES	("Demo@gmail.com","demo","demo full", 5,1);
-- Quesstion 3 : 1つのグループに最大5人のユーザーが含まれるように設定する
DROP TRIGGER IF EXISTS PreventExceedingMaxUsersInGroup;
DELIMITER $$
	CREATE TRIGGER PreventExceedingMaxUsersInGroup
    BEFORE INSERT ON GroupAccount
    FOR EACH ROW
		BEGIN 
			DECLARE userCount TINYINT;
            SELECT COUNT(*) INTO userCount FROM GroupAccount WHERE GroupId = NEW.GroupId;
            IF userCount > 5 THEN
				SIGNAL SQLSTATE '45000' 
				SET MESSAGE_TEXT = 'Group cannot have more than 5 users';
            END IF ;
        END $$
DELIMITER ;
-- INSERT INTO GroupAccount (GroupId,AccountId) VALUES (1,2),(1,3),(1,4),(1,5);
-- SELECT * FROM GroupAccount;
--  INSERT INTO GroupAccount (GroupId,AccountId) VALUES (1,8);
-- Question 4  : 一つの試験に最大１０の問題が含まれるよに設定する
DROP TRIGGER IF EXISTS PreventExceedingMaxQuestionsInExam;
DELIMITER $$
	CREATE TRIGGER PreventExceedingMaxQuestionsInExam
    BEFORE INSERT ON ExamQuestion
    FOR EACH ROW
		BEGIN 
			DECLARE questionCount TINYINT;
			SELECT COUNT(*) INTO questionCount FROM ExamQuestion WHERE ExamId = NEW.ExamId;
			IF questionCount >= 10 THEN
				SIGNAL SQLSTATE '45000' 
				SET MESSAGE_TEXT = 'Exam cannot have more than 10 questions';
			END IF;
		END $$
DELIMITER ;
SELECT * FROM ExamQuestion;
-- INSERT INTO ExamQuestion (ExamId,QuestionId) VALUES (2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10);
-- DELETE FROM ExamQuestion WHERE ExamId = 2 AND QuestionId = 1;
-- INSERT INTO ExamQuestion (ExamId,QuestionId) VALUES (2,1);
-- Question 5 : ユーザーがemailがadmin@gmail.comのアカウントを削除できないようにするトリガーを作成する（これは管理者アカウントのため、ユーザーによる削除を許可しない）。それ以外のアカウントについては削除を許可し、そのユーザーに関連するすべての情報を削除する。
DROP TRIGGER IF EXISTS PreventAdminDeletion;
DELIMITER $$
	CREATE TRIGGER PreventAdminDeletion
    BEFORE DELETE ON Accounts
    FOR EACH ROW
		BEGIN
			IF OLD.Email = "admin@gmail.com" THEN
				 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete admin account';
            ELSE 
				DELETE FROM Accounts WHERE AccountId = OLD.AccountId; 
            END IF;
        END $
DELIMITER ;
-- Question 6 : 使用デフォルト構成を避けて、AccountテーブルのDepartmentIDフィールドに対してはデフォルト設定を使用しないでください。アカウントを作成する際にDepartmentIDを指定しなかった場合、'waiting Department'に割り当てられるようにするトリガーを作成してください。
DROP TRIGGER IF EXISTS SetDefaultDepartment;
DELIMITER $$
	CREATE TRIGGER SetDefaultDepartment
    BEFORE INSERT ON Accounts
    FOR EACH ROW
		BEGIN 
			DECLARE dept_id INT;
			IF NEW.DepartmentId IS NULL OR NEW.DepartmentId = 0 THEN
				SELECT DepartmentId INTO dept_id FROM Department WHERE DepartmentName = "waiting Department";
                SET NEW.DepartmentId = dept_id;
            END IF ;
        END $$
DELIMITER ;

