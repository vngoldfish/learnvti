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
SELECT * FROM TypeQuestion WHERE TypeId = @set_typeId;
-- Question 6 : ユーザーが文字列を入力し、その文字列を含む名前のグループを返すか、その文字列を含むユーザーのユーザー名を返すストアを作成してください。



