USE Testing_System_Assignment_3;
-- Question 1 : 従業員のリストと部署情報を取得します
 SELECT ac.*, d.DepartmentName FROM Accounts ac INNER JOIN Department d ON ac.DepartmentId = d.DepartmentId;