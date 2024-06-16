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
-- Question 7 : 1つの試験で、ユーザーは各質問に対して最大4つの回答を作成でき、そのうち最大2つの正解が許可されるように設定する。
DROP TRIGGER IF EXISTS BeforeInsertAnswer;
DELIMITER $$
	CREATE TRIGGER BeforeInsertAnswer
    BEFORE INSERT ON Answer
    FOR EACH ROW
    BEGIN
		DECLARE answer_count TINYINT;
        DECLARE correct_asswer_count TINYINT;
        -- 現在の質問に対する回答の数を数える
        SELECT COUNT(*) INTO answer_count FROM Answer WHERE QuestionId = NEW.QuestionId;
        -- 回答の質問の数を数える
        SELECT COUNT(*) INTO correct_asswer_count FROM Answer WHERE QuestionId = NEW.QuestionId AND isCorrect = "TRUE";
        -- 回答の数が４を超えるかどうかを確認する
		IF answer_count >= 4 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot add more than 4 answers for a question';
        -- 正解の数が２を超えるかどうかを確認する
		END IF;
        IF correct_answer_count >= 2 AND NEW.isCorrect = 'true' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot have more than 2 correct answers for a question';
		END IF;
    END $$
DELIMITER ;
-- Quesstion 8 : データを正しく修正するトリガーを作成する．ユーザーがアカウントのGENDERに「男」「女」「未定義」と入力した場合、それをデータベースの構成に合わせて「M」「F」「U」に変更する
DROP TRIGGER IF EXISTS BeforeUpdateAccountGender;
DELIMITER $$
	CREATE TRIGGER  BeforeUpdateAccountGender
    BEFORE INSERT ON Accounts 
    FOR EACH ROW
    BEGIN
		IF NEW.gender = 'nam' THEN
			SET NEW.gender = 'M';
		ELSEIF NEW.gender = 'nữ' THEN
			SET NEW.gender = 'F';
		ELSEIF NEW.gender = 'chưa xác định' THEN
			SET NEW.gender = 'U';
		END IF;
    END
DELIMITER ;
-- Quesstion 9 : 作成から二日以内の試験をユーザーが削除できないようにドリガーを作成する
DROP TRIGGER IF EXISTS PrevenDeleteRecenExam;
DELIMITER $$
	CREATE TRIGGER PrevenDeleteRecenExam
    BEFORE DELETE ON Exam
    FOR EACH ROW
    BEGIN
		DECLARE currenDate DATE;
		DECLARE createDate DATE;
        SET currenDate = CURDATE();
        SET createDate = OLD.CreateDate;
        IF DATEDIFF(currenDate,createDate) <=2 THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'You cannot delete an exam created within the last 2 days.';
        END IF ;
    END $$
DELIMITER ;

-- Question 10 : ユーザーが質問を更新または削除できるのはこの質問がまだ試験に含まれていない場合のみとするトリガーを作成する
DROP TRIGGER IF EXISTS PrevenUpdateQuestionExam;
DELIMITER $$
	CREATE TRIGGER PrevenUpdateQuestionExam
    BEFORE UPDATE ON Question
    FOR EACH ROW
	BEGIN
		DECLARE QuestionCount TINYINT;
        -- 試験に質問が含まれているかどうかを確認する
        SELECT COUNT(*) INTO QuestionCount FROM Examquestion WHERE QuestionId = OLD.QuestionId;
        -- 試験に質問がある場合更新を禁止する
        IF questionCount > 0 THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'You cannot update a question that is part of an exam.';
		END IF;
    END $$
DELIMITER ;
DROP TRIGGER IF EXISTS PrevenDeleteQuestionExam;
DELIMITER $$
	CREATE TRIGGER PrevenDeleteQuestionExam
    BEFORE DELETE ON Question
    FOR EACH ROW
	BEGIN
		DECLARE QuestionCount TINYINT;
        -- 試験に質問が含まれているかどうかを確認する
        SELECT COUNT(*) INTO QuestionCount FROM Examquestion WHERE QuestionId = OLD.QuestionId;
        -- 試験で質問がある場合削除を禁止する
        IF questionCount > 0 THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'ou cannot delete a question that is part of an exam';
		END IF;
    END $$
DELIMITER ;
-- Quesstion 12 : 試験情報を習得する際に以下のようにDurationの値を変更する：Duration <= 30 は”Sort Time”　30 < Duration <= 60 は　Medium time”　Duration > 60 は "Long time"
SELECT 
    ExamId,
    Title,
    CASE
        WHEN Duration <= 30 THEN 'Short time'
        WHEN Duration > 30 AND Duration <= 60 THEN 'Medium time'
        ELSE 'Long time'
    END AS DurationCategory
FROM Exam;
/* Question 13 
	各グループのアカウント数を集計し、the_number_user_amountという名前の列を追加して以下のように値を設定する：
		グループ内のユーザー数が5以下の場合、「few」
		グループ内のユーザー数が5より多く20以下の場合、「normal」
		グループ内のユーザー数が20より多い場合、「higher」
*/
SELECT 	GroupId,
		COUNT(GroupId) AS CountAccount,
        CASE
			WHEN COUNT(GroupId) <= 5 THEN 'few'
            WHEN COUNT(GroupId) <= 20 AND COUNT(GroupId) >5 THEN 'normal'
            WHEN COUNT(GroupId) > 20 THEN 'higher'
         END AS  the_number_user_amount  
FROM GroupAccount GROUP BY GroupId;
 -- Question 14 : 名部門のユーザー数を集計し、部門にユーザーがいない場合値が代わりにユーザーはいませんと表示します
 SELECT * FROM Department;
 -- INSERT INTO Department(DepartmentName) VALUES ("Demo");
SELECT d.DepartmentName,d.DepartmentId,CASE
			WHEN COUNT(a.AccountId) = 0 THEN 'ユーザーがいない'
            ELSE COUNT(a.AccountId)
		END AS UserCount
 FROM Accounts a  RIGHT JOIN Department d ON a.DepartmentId = d.DepartmentId GROUP BY d.DepartmentId,d.DepartmentName;