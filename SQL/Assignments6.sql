USE Testing_System_Assignment_3;
 -- Question 1 :  ユーザーが部門名を入力して、その部門に属するすべてのアカウントを出力するストアを作成する
 DROP PROCEDURE IF EXISTS seach_de;
 DELIMITER $$
	CREATE PROCEDURE  seach_de(IN in_department_name VARCHAR(30))
		BEGIN
			 SELECT ac.Email,ac.UserName,ac.FullName,d.DepartmentName FROM Accounts ac JOIN Department d
			ON ac.DepartmentId = d.DepartmentId 
			WHERE d.DepartmentName = in_department_name;
        END$$
 DELIMITER ;
 -- Question 2 : 各グループのアカウント数を出力するストアを作成する
 
 DROP PROCEDURE IF EXISTS show_count_account_on_group;
 DELIMITER $$
	CREATE PROCEDURE  show_count_account_on_group()
		BEGIN
			SELECT g.GroupName, COUNT(g.GroupId) FROM GroupAccount ga 
				JOIN `Group` g ON ga.GroupId = g.GroupId 
                GROUP BY g.GroupId;
        END$$
 DELIMITER ;
 -- Question 3 : 現在の月に作成された各質問タイプの質問数を集計するストアを作成する
 DROP PROCEDURE IF EXISTS GetQuestionCountByTypeForCurrentMonth;
 DELIMITER $$
	CREATE PROCEDURE GetQuestionCountByTypeForCurrentMonth()
		BEGIN 
			SELECT tq.TypeName,q.Content,q.CreateDate FROM Question q JOIN TypeQuestion tq ON q.TypeId = tq.TypeId 
				WHERE q.CreateDate >= DATE_FORMAT(CURDATE(), '%Y-%m-01') 
				AND q.CreateDate < DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01');
        END $$
 DELIMITER ;
 -- Question 4 : 最も多くの質問がある質問タイプのIDを返すストアを作成する
	DROP PROCEDURE IF EXISTS GetMostFrequentQuestionType;
	DELIMITER $$
		CREATE PROCEDURE GetMostFrequentQuestionType(OUT out_TypeId TINYINT)
		BEGIN 
			SELECT TypeId INTO out_TypeId  FROM Question
			GROUP BY TypeId  
			ORDER BY COUNT(TypeId) DESC
			LIMIT 1
			;
		END $$
	DELIMITER ;
-- Question 5 : 質問4のストアを使用して質問タイプの名前を見つける
	SET @set_typeId = '';
	CALL GetMostFrequentQuestionType(@set_typeId);
	SELECT 
		*
	FROM
		TypeQuestion
	WHERE
		TypeId = @set_typeId;
	-- Question 6 : ユーザーが文字列を入力し、その文字列を含む名前のグループを返すか、その文字列を含むユーザーのユーザー名を返すストアを作成してください。
	DROP PROCEDURE IF EXISTS SearchGroupOrUser;
	DELIMITER $$
		CREATE PROCEDURE SearchGroupOrUser(IN in_searchString NVARCHAR(100))
		BEGIN 
			SELECT * FROM `Group` WHERE GroupName LIKE  CONCAT("%",@in_searchString,"%");
			SELECT * FROM Accounts WHERE UserName LIKE CONCAT("%",@in_searchString,"%");
		END $$
	DELIMITER ;
	SET @in_searchString = "A";
	CALL SearchGroupOrUser(@in_searchString);
/*Question 7 :
	ユーザーがfullNameとemailを入力できるストアを作成し、そのストアでは以下のように自動的に情報が割り当てられます：
		username: emailと同じですが、@..mailの部分を除きます
		positionID: デフォルトはdeveloperになります
		departmentID: 待機部門に割り当てられます
		その後、作成成功の結果を出力します。
*/
-- INSERT INTO Department (DepartmentName) VALUES ("待機部門");
-- INSERT INTO Position (PositionName) VALUES ("developer");
	DROP PROCEDURE IF EXISTS CreateUser;
	DELIMITER $$
		CREATE PROCEDURE CreateUser(IN in_fullName VARCHAR(100),IN in_email VARCHAR(100))
		BEGIN 
			DECLARE in_userName VARCHAR(100);
			DECLARE default_positionID INT;
			DECLARE default_departmentID INT;
			-- username の生成: email から @ 以降を除去
			SET in_userName = SUBSTRING_INDEX(in_email, '@', 1);
			 -- デフォルトの positionID と departmentID を設定
			SELECT PositionID INTO default_positionID FROM `Position` WHERE PositionName = 'developer' LIMIT 1;
			SELECT DepartmentID INTO default_departmentID FROM Department WHERE DepartmentName = '待機部門' LIMIT 1;
			 -- Accounts テーブルに新しいユーザーを挿入
			INSERT INTO Accounts (FullName, Email, UserName, PositionID, DepartmentID, CreateDate)
			VALUES (in_fullName, in_email, in_userName, default_positionID, default_departmentID, CURDATE());
			-- 作成成功のメッセージを出力
			SELECT 'User created successfully' AS result_message;
		END $$
	DELIMITER ;
	-- CALL CreateUser('山田 太郎', 'taro.yamada@example.com');
-- DELETE FROM Accounts WHERE Email = "taro.yamada@example.com";
-- Question 8  :ユーザーがEssayまたはMultiple-Choiceを入力できるストアを作成し、そのストアでは最も長い内容を持つEssayまたはMultiple-Choiceの質問を集計します。
	-- 既存のプロシージャがあれば削除
	DROP PROCEDURE IF EXISTS GetLongestQuestionByType;
	DELIMITER $$
	-- プロシージャの作成
	CREATE PROCEDURE GetLongestQuestionByType(IN in_questionType VARCHAR(30))
	BEGIN
		DECLARE questionTypeId TINYINT;
		-- 入力された質問タイプのIDを取得
		SELECT TypeId INTO questionTypeId FROM TypeQuestion WHERE TypeName = in_questionType LIMIT 1;
			-- 最も長い内容を持つ質問を集計
			SELECT q.QuestionId, q.Content, LENGTH(q.Content) AS ContentLength
			FROM Question q
			WHERE q.TypeId = questionTypeId
			ORDER BY LENGTH(q.Content) DESC
			LIMIT 1;
	END $$
	DELIMITER ;
	-- プロシージャの呼び出し例
	CALL GetLongestQuestionByType('Essay');
	CALL GetLongestQuestionByType('Multiple-Choice');
-- Question 9 : ユーザーがIDを入力して試験を削除できるストアを作成する
	-- 既存のプロシージャがあれば削除
	DROP PROCEDURE IF EXISTS DeleteExamById;
	DELIMITER $$
	-- プロシージャの作成
	CREATE PROCEDURE DeleteExamById(IN in_ExamId TINYINT)
		BEGIN
			-- 試験が存在するか確認
			IF EXISTS (SELECT 1 FROM Exam WHERE ExamId = in_ExamId) THEN
				-- 関連する ExamQuestion のレコードを削除
				DELETE FROM ExamQuestion WHERE ExamId = in_ExamId;
				-- Exam テーブルから該当するレコードを削除
				DELETE FROM Exam WHERE ExamId = in_ExamId;
				-- 削除成功メッセージを出力
				SELECT CONCAT('Exam with ID ', in_ExamId, ' has been successfully deleted.') AS result_message;
			ELSE
				-- 試験が存在しない場合のエラーメッセージを出力
				SELECT CONCAT('Exam with ID ', in_ExamId, ' does not exist.') AS result_message;
			END IF;
		END $$
	DELIMITER ;
	-- プロシージャの呼び出し例
	CALL DeleteExamById(1);
-- Question 10 : 3年前に作成された試験を見つけて、それらの試験を削除する（質問9のストアを使用して削除する）。その後、削除中に関連するテーブルから削除されたレコードの数を出力する。
	DROP PROCEDURE IF EXISTS DeleteOldExams;
	DELIMITER $$
	CREATE PROCEDURE DeleteOldExams()
		BEGIN
			DECLARE examIdToDelete TINYINT;
            DECLARE deletedExamQuestions INT DEFAULT 0;
			DECLARE done INT DEFAULT 0;
			DECLARE cur CURSOR FOR SELECT ExamId FROM Exam WHERE CreateDate >= DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 3 YEAR),'%Y-%m-01');
			CREATE TEMPORARY TABLE IF NOT EXISTS DeletedRecordsCount (
				ExamId TINYINT,
				DeletedExamQuestions INT
			);
            OPEN cur;
            read_loop:LOOP
				FETCH cur INTO examIdToDelete;
                IF done THEN
					LEAVE read_loop;
				END IF;
				DELETE FROM ExamQuestion WHERE ExamId = examIdToDelete;
				SET deletedExamQuestions = ROW_COUNT();
				DELETE FROM Exam WHERE ExamId = examIdToDelete;
				INSERT INTO DeletedRecordsCount (ExamId, DeletedExamQuestions) VALUES (examIdToDelete, deletedExamQuestions);
            END LOOP;
            CLOSE cur;
            SELECT * FROM DeletedRecordsCount;
			DROP TEMPORARY TABLE IF  EXISTS DeletedRecordsCount;
		END $$
	DELIMITER ;
	-- CALL DeleteOldExams;
-- Question 11 : ユーザーが部門名を入力して部門を削除できるストアを作成し、その部門に属するアカウントはすべてデフォルトの待機部門に移されるようにする。
	DROP PROCEDURE IF EXISTS DeleteDepartmentAndMoveAccounts;
	DELIMITER $$
	CREATE PROCEDURE DeleteDepartmentAndMoveAccounts(IN in_DepartmentName VARCHAR(50))
	BEGIN
		DECLARE department_id TINYINT DEFAULT 0;
        DECLARE default_department_id TINYINT;
        SELECT DepartmentID INTO default_department_id FROM Department WHERE DepartmentName = "待機部門";
        SELECT DepartmentID INTO department_id FROM Department WHERE DepartmentName LIKE CONCAT("%",in_DepartmentName,"%");
		
        UPDATE Accounts
			SET DepartmentID = default_department_id
            WHERE DepartmentID = department_id;
		DELETE FROM Department WHERE DepartmentID = department_id;
        
	END $$
	DELIMITER ;
	CALL DeleteDepartmentAndMoveAccounts('IT');
