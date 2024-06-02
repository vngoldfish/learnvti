USE Testing_System_Assignment_3;
-- Question 1 : SALE部門に所属する従業員にリストを含むビューを作成する
DROP VIEW IF EXISTS DepartmentView;
CREATE VIEW  DepartmentView AS 
		SELECT a.AccountId,a.Email,a.UserName,a.FullName,d.DepartmentName FROM Accounts a 
        JOIN Department d  ON a.DepartmentId = d.DepartmentId 
        WHERE d.DepartmentName = "Sales";
SELECT * FROM DepartmentView;
-- Question 2 : 最も多くグループに参加しているアカウントの情報を含むビューを作成する

DROP VIEW IF EXISTS AccountView;
CREATE VIEW AccountView AS
	SELECT a.AccountId,a.Email,a.UserName,a.FullName,COUNT(ga.AccountId) AS COUNT_AC FROM Accounts a 
			JOIN GroupAccount ga ON a.AccountID = ga.AccountId
			GROUP BY ga.AccountId 
			HAVING COUNT_AC = (SELECT MAX(COUNT_ID) FROM (SELECT COUNT(AccountId) AS COUNT_ID FROM GroupAccount GROUP BY AccountId) AS temp_Count_GroupAccount);
SELECT * FROM AccountView;
-- Question 3 : 長すぎるコンテンツを含む問題のビューを作成し、それを削除してください(30字を超えるコンテンツは長すぎるとみなされます)。
SELECT LG_C FROM (SELECT LENGTH(Content) AS LG_C FROM Question) AS temp_leng_content WHERE LG_C >= 30;

DROP VIEW IF EXISTS Nagai_content_temp ;
CREATE VIEW Nagai_content_temp AS
	SELECT * 
	FROM Question
	WHERE LENGTH(Content) IN (
		SELECT LG_C
		FROM (
			SELECT LENGTH(Content) AS LG_C
			FROM Question 
			WHERE LENGTH(Content) >= 30
			) AS temp_length_table
		);
DROP TEMPORARY TABLE IF EXISTS temp_delete_ids;
CREATE TEMPORARY TABLE temp_delete_ids AS SELECT * FROM Nagai_content_temp;
DELETE FROM Question WHERE QuestionId IN (SELECT QuestionID FROM temp_delete_ids);
DROP TEMPORARY TABLE IF EXISTS temp_delete_ids;
-- Question 4 : 最も多くの従業員が所属する部署を含むビューを作成してください。
SELECT MAX(COUNT_DEID) FROM (SELECT COUNT(DepartmentId) AS COUNT_DEID FROM Accounts GROUP BY DepartmentID) AS COUNT_De;
DROP VIEW IF EXISTS department_ooku;
CREATE VIEW department_ooku as
	SELECT d.DepartmentName  FROM Department d JOIN Accounts ac ON d.DepartmentId = ac.DepartmentId
	GROUP BY d.DepartmentName HAVING COUNT(d.DepartmentName) = (SELECT MAX(COUNT_DEID) FROM (SELECT COUNT(DepartmentId) AS COUNT_DEID FROM Accounts GROUP BY DepartmentID) AS COUNT_De)
    ;
SELECT * FROM department_ooku;    
-- Question 5 : ユーザーJohnによって作成されたすべての問題を含むビューを作成します
DROP VIEW IF EXISTS us_qs_temp;
CREATE VIEW us_qs_temp AS
	SELECT q.Content,ac.FullName FROM Question q JOIN Accounts ac ON q.CreatorId = ac.AccountId WHERE ac.FullName LIKE "John%";
SELECT * FROM us_qs_temp;