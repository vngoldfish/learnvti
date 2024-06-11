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
 
SELECT * FROM Question ;