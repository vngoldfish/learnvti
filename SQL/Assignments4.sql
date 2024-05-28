USE Testing_System_Assignment_3;
-- Question 1 : 従業員のリストと部署情報を取得します
 SELECT ac.*, d.DepartmentName FROM Accounts ac INNER JOIN Department d ON ac.DepartmentId = d.DepartmentId;
 -- Question 2 : 2010/12/20 以降に作成させたアカウントの情報を取得します
 SELECT * FROM Accounts WHERE CreateDate >= "2010-12-20";
 -- Question 3 :デベロッパーの情報を取得します
 SELECT  * FROM Department;
 -- Quesstion 4 : ３人以上の従業員がいる部署を取得します
 SELECT d.DepartmentName,COUNT(1) as COUNT_Department FROM Accounts ac 
			JOIN Department d ON ac.DepartmentId = d.DepartmentId GROUP BY ac.DepartmentID HAVING COUNT_Department > 3;
 -- Quesstion 5 : 試験で、最も多く使用されている問題のリストを取得します
 INSERT INTO ExamQuestion (ExamId,QuestionId)
 VALUES 
	(2,1),
    (3,1);
 SELECT q.Content,COUNT(q.QuestionId) AS COUNT_Q FROM Question q JOIN ExamQuestion eq ON q.QuestionId = eq.QuestionId GROUP BY q.QuestionId ORDER BY COUNT_Q DESC LIMIT 1;
 SELECT MAX(COUNT_Q) AS COUNT_Q FROM (SELECT COUNT(q.QuestionId) as COUNT_Q FROM Question q 
			JOIN ExamQuestion eq ON q.QuestionId = eq.QuestionId Group By q.QuestionId) AS TEMP_Q ;
 -- Question 6 : 各カテゴルの質問がいくつの質問に使用されたかを統計する
 SELECT * FROM Question;
 SELECT * FROM CategoryQuestion;
 SELECT cq.CategoryName,COUNT(cq.CategoryId) AS COUNT_CATEGORY FROM Question q 
			JOIN CategoryQuestion cq ON q.CategoryId = cq.CategoryId GROUP BY cq.CategoryId;
 -- Question 7 : 各質問が幾つの試験に使用されたがを統計する
 SELECT * FROM ExamQuestion;
 SELECT * FROM Question;
 SELECT eq.QuestionId,q.Content, COUNT(eq.QuestionId) FROM ExamQuestion eq 
			JOIN Question q ON eq.QuestionId = q.QuestionId GROUP BY eq.QuestionId ;
 -- Question 8 : 最も多くの回答がある問題を取得する
 SELECT COUNT(QuestionId) AS COUNT_Q FROM Answer GROUP BY QuestionId;
 SELECT MAX(COUNT_Q) FROM (SELECT COUNT(QuestionId) AS COUNT_Q FROM Answer GROUP BY QuestionId) as temp_tbmax;
 SELECT q.Content,COUNT(q.QuestionId) AS COUNT_Q FROM Question q 
			JOIN Answer aw ON q.QuestionId = aw.QuestionId GROUP BY aw.QuestionId HAVING COUNT_Q =  (SELECT MAX(COUNT_Q) FROM (SELECT COUNT(QuestionId) AS COUNT_Q FROM Answer GROUP BY QuestionId) as temp_tbmax); 
 -- Question 9 : 各グループのアカウント数を統計する
 SELECT  * FROM Accounts;
 SELECT * FROM `Group`;
 SELECT GroupId,COUNT(GroupId) FROM GroupAccount GROUP BY GroupId;
 SELECT g.GroupId,g.GroupName,COUNT(ga.GroupId) AS COUNT_AC FROM `Group` g 
			JOIN GroupAccount ga ON g.GroupId = ga.GroupId GROUP BY ga.GroupId;
 
 -- Question 10 : 最もう数が少ないポジションを見つける
SELECT * FROM Position;
SELECT * FROM Accounts;
SELECT COUNT(PositionId) FROM Accounts GROUP BY PositionId;
SELECT MIN(COUNT_P) FROM (SELECT COUNT(PositionId) AS COUNT_P FROM Accounts GROUP BY PositionId) AS TEMP_P;
SELECT p.PositionId,p.PositionName,COUNT(ac.PositionId) AS COUNT_P FROM Accounts ac 
			JOIN Position p ON ac.PositionId = p.PositionId 
            GROUP BY ac.PositionId HAVING COUNT_P =(SELECT MIN(COUNT_P) FROM (SELECT COUNT(PositionId) AS COUNT_P FROM Accounts GROUP BY PositionId) AS TEMP_P);
-- Quesstion 11 : 各部署に何人がいるかを統計する
SELECT * FROM Department;
SELECT * FROM Accounts;
SELECT d.DepartmentName,COUNT(ac.DepartmentId) AS COUNT_ACCOUNT FROM Accounts ac 
			JOIN Department d ON ac.DepartmentId = d.DepartmentId GROUP BY ac.DepartmentId;
-- Question 12 : 質問の詳細情報を取得する；質問の基本情報、質問の種類、質問を作成した人、回答内容など
SELECT * FROM Question;
SELECT q.Content,ac.FullName,cq.CategoryName,aw.Content FROM Question q 
			JOIN Accounts ac ON q.CreatorId = ac.AccountId
            JOIN CategoryQuestion cq ON q.CategoryId = cq.CategoryID
            JOIN Answer aw ON q.QuestionId = aw.QuestionId
            WHERE aw.isCorrect = "TRUE";
-- Question13 : 各種類の質問の数を取得する
-- Question 14 : アカウントがないグルーブを取得する
SELECT  * FROM `Group` g  LEFT JOIN GroupAccount ga ON g.GroupId = ga.GroupId WHERE ga.GroupId IS NULL;
-- Question 16 : Answerがない質問を取得します
SELECT * FROM Question;
SELECT * FROM Answer;
SELECT * FROM Question q LEFT JOIN Answer aw ON q.QuestionId = aw.QuestionId WHERE aw.QuestionId IS NULL; 

/*
	UNION
*/
/*
	Question 17 
		a.グルーブ１に属するアカウントを取得する
        b.グルーブ２に属するアカウントを取得する
*/
SELECT * FROM GroupAccount;
SELECT a.UserName FROM Accounts a JOIN GroupAccount ga ON a.AccountID = ga.AccountId WHERE ga.GroupId = 1;
SELECT a.UserName FROM Accounts a JOIN GroupAccount ga ON a.AccountID = ga.AccountId WHERE ga.GroupId = 2;
SELECT a.UserName FROM Accounts a JOIN GroupAccount ga ON a.AccountID = ga.AccountId WHERE ga.GroupId = 1
UNION
SELECT a.UserName FROM Accounts a JOIN GroupAccount ga ON a.AccountID = ga.AccountId WHERE ga.GroupId = 2;
/*
	Question 18:
    a.５人以上のメンバーがいるグルーブを取得します
    b.７人未満のメンバーがいるグルーブを取得します
*/
INSERT INTO GroupAccount(GroupId,AccountId)
VALUES
	(1,2),
    (1,3),
    (1,4),
    (1,5),
    (1,6),
    (1,7),
    (1,8),
    (1,9),
    (1,10),
    (2,3),
    (2,4),
    (2,5),
    (3,6),
    (3,7),
    (3,8),
    (3,9),
    (3,1),
    (3,10);
SELECT * FROM GroupAccount;
SELECT g.GroupName,COUNT(g.GroupId) FROM `Group` g JOIN GroupAccount ga ON g.GroupId = ga.GroupId GROUP BY g.GroupId;
SELECT g.GroupName FROM `Group` g JOIN GroupAccount ga ON g.GroupId = ga.GroupId GROUP BY g.GroupId HAVING COUNT(g.GroupId) > 5
UNION ALL
SELECT g.GroupName FROM `Group` g JOIN GroupAccount ga ON g.GroupId = ga.GroupId GROUP BY g.GroupId HAVING COUNT(g.GroupId) < 7;

 
 
 