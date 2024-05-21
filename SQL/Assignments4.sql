USE Testing_System_Assignment_3;
-- Question 1 : 従業員のリストと部署情報を取得します
 SELECT ac.*, d.DepartmentName FROM Accounts ac INNER JOIN Department d ON ac.DepartmentId = d.DepartmentId;
 -- Question 2 : 2010/12/20 以降に作成させたアカウントの情報を取得します
 SELECT * FROM Accounts WHERE CreateDate >= "2010-12-20";
 -- Question 3 :デベロッパーの情報を取得します
 SELECT  * FROM Department;
 -- Quesstion 4 : ３人以上の従業員がいる部署を取得します
 SELECT d.DepartmentName,COUNT(1) as COUNT_Department FROM Accounts ac JOIN Department d ON ac.DepartmentId = d.DepartmentId GROUP BY ac.DepartmentID HAVING COUNT_Department > 3;
 -- Quesstion 5 : 試験で、最も多く使用されている問題のリストを取得します
 INSERT INTO ExamQuestion (ExamId,QuestionId)
 VALUES 
	(2,1),
    (3,1);
 SELECT q.Content,COUNT(q.QuestionId) AS COUNT_Q FROM Question q JOIN ExamQuestion eq ON q.QuestionId = eq.QuestionId GROUP BY q.QuestionId ORDER BY COUNT_Q DESC LIMIT 1;
 SELECT MAX(COUNT_Q) AS COUNT_Q FROM (SELECT COUNT(q.QuestionId) as COUNT_Q FROM Question q JOIN ExamQuestion eq ON q.QuestionId = eq.QuestionId Group By q.QuestionId) AS TEMP_Q ;
 