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