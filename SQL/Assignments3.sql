-- SQL - Assignment 3
DROP DATABASE IF EXISTS Testing_System_Assignment_3;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_3;
USE Testing_System_Assignment_3;
	DROP TABLE IF EXISTS Department;
	CREATE TABLE IF NOT EXISTS Department (
			DepartmentId INT AUTO_INCREMENT,
            DepartmentName VARCHAR(50),
            CONSTRAINT d_pk PRIMARY KEY(DepartmentId),
            CONSTRAINT d_uq UNIQUE(DepartmentName)
    );
    DROP TABLE IF EXISTS `Position`;
    CREATE TABLE IF NOT EXISTS `Position`(
			PositionId INT  AUTO_INCREMENT,
            PositionName VARCHAR(30),
            CONSTRAINT p_pk PRIMARY KEY (PositionId),
            CONSTRAINT p_uq	UNIQUE(PositionName)
    );
    DROP TABLE IF EXISTS `Accounts`;
    CREATE TABLE IF NOT EXISTS `Accounts`(
			AccountId INT  AUTO_INCREMENT,
            Email VARCHAR(30),
            UserName VARCHAR(30),
            FullName VARCHAR(30),
            DepartmentID INT,
            PositionID INT,
            CreateDate DATE,
            CONSTRAINT a_pk PRIMARY KEY (AccountId),
            CONSTRAINT a_uq UNIQUE (Email,UserName),
            CONSTRAINT a_fk1 FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId),
            CONSTRAINT a_fk2 FOREIGN KEY (PositionId) REFERENCES `Position`(PositionId)
	);
    DROP TABLE IF EXISTS `Group`;
    CREATE TABLE IF NOT EXISTS `Group` (
		GroupId	TINYINT  AUTO_INCREMENT ,
        GroupName VARCHAR(30) NOT NULL,
        CreatorId	INT ,
        CreateDate	DATE,
        CONSTRAINT g_pk PRIMARY KEY (GroupId),
        CONSTRAINT g_uq	UNIQUE (GroupName),
        CONSTRAINT g_fk FOREIGN KEY (CreatorId)	 REFERENCES `Accounts`(AccountId) ON DELETE CASCADE ON UPDATE CASCADE
    );
    DROP TABLE IF EXISTS GroupAccount;
    CREATE TABLE IF NOT EXISTS GroupAccount(
		GroupId TINYINT,
        AccountId INT,
        JointDate	DATE,
        CONSTRAINT ga_pk PRIMARY KEY (GroupId,AccountId),
        CONSTRAINT ga_fk1 FOREIGN KEY (GroupId) REFERENCES `Group`(GroupId) ON DELETE CASCADE ON UPDATE CASCADE   ,
        CONSTRAINT ga_fk2 FOREIGN KEY (AccountId) REFERENCES `Accounts`(AccountId)  ON DELETE CASCADE ON UPDATE CASCADE      
    );
    DROP TABLE IF EXISTS TypeQuestion;
    CREATE TABLE IF NOT EXISTS TypeQuestion (
		TypeId TINYINT AUTO_INCREMENT,
        TypeName	VARCHAR(30) NOT NULL,
        CONSTRAINT tq_pk PRIMARY KEY (TypeId),
        CONSTRAINT tq_up	UNIQUE (TypeName)
    );
    
    DROP TABLE IF EXISTS CategoryQuestion;
    CREATE TABLE IF NOT EXISTS CategoryQuestion(
		CategoryId	TINYINT AUTO_INCREMENT,
        CategoryName	VARCHAR(30) NOT NULL,
        CONSTRAINT cq_pk PRIMARY KEY (CategoryId),
        CONSTRAINT cq_uq	UNIQUE(CategoryName)
    );
    DROP TABLE IF EXISTS Question;
    CREATE TABLE IF NOT EXISTS Question(
		QuestionId	TINYINT AUTO_INCREMENT,
        Content		VARCHAR(100),
        CategoryId	TINYINT,
        TypeId		TINYINT,
        CreatorId	INT,
        CreateDate	DATE,
        CONSTRAINT q_pk PRIMARY KEY(QuestionId),
        CONSTRAINT q_uq	UNIQUE(Content),
        CONSTRAINT q_fk1	FOREIGN KEY (CategoryId) REFERENCES CategoryQuestion(CategoryId),
        CONSTRAINT q_fk2	FOREIGN KEY (TypeId) REFERENCES TypeQuestion(TypeId),
        CONSTRAINT q_fk3	FOREIGN KEY (CreatorId) REFERENCES `Accounts`(AccountId) ON DELETE CASCADE ON UPDATE CASCADE
    );
    DROP TABLE IF EXISTS Answer;
    CREATE TABLE IF NOT EXISTS Answer(
		AnswerId TINYINT AUTO_INCREMENT,
        Content		VARCHAR(100),
        QuestionId	TINYINT,
        isCorrect	CHAR(5),
        CONSTRAINT aw_pk PRIMARY KEY(AnswerId),
        CONSTRAINT aw_fk	FOREIGN KEY (QuestionId) REFERENCES Question(QuestionId) ON DELETE CASCADE ON UPDATE CASCADE   
    );
    DROP TABLE IF EXISTS Exam;
    CREATE TABLE IF NOT EXISTS Exam(
		ExamId		TINYINT AUTO_INCREMENT,
        `Code`		VARCHAR(10),
        Title		VARCHAR(100),
        CategoryId	TINYINT,
        Duration 	TINYINT,
        CreatorId	INT,
        CreateDate	DATE,
        CONSTRAINT as_pk PRIMARY KEY(ExamId),
        CONSTRAINT as_uq	UNIQUE(`Code`,Title),
        CONSTRAINT as_fk1	FOREIGN KEY(CategoryId) REFERENCES CategoryQuestion(CategoryId),
        CONSTRAINT as_fk2	FOREIGN KEY (CreatorId) REFERENCES `Accounts`(AccountId) ON DELETE CASCADE ON UPDATE CASCADE
    );
    DROP TABLE IF EXISTS ExamQuestion;
    CREATE TABLE IF NOT EXISTS ExamQuestion(
		ExamId TINYINT,
        QuestionId	TINYINT,
        CONSTRAINT eq_pk PRIMARY KEY(ExamId,QuestionId)
    );
    
		-- Thêm dữ liệu vào bảng Department
	INSERT INTO Department (DepartmentName) VALUES
	('Human Resources'),
	('Finance'),
	('Marketing'),
	('IT'),
	('Sales'),
	('Operations'),
	('Customer Service'),
	('Research and Development'),
	('Legal'),
	('Administration');

	-- Thêm dữ liệu vào bảng Position
	INSERT INTO `Position` (PositionName) VALUES
	('Manager'),
	('Assistant Manager'),
	('Senior Developer'),
	('Junior Developer'),
	('Accountant'),
	('HR Specialist'),
	('Marketing Specialist'),
	('Sales Representative'),
	('IT Support'),
	('Legal Advisor');

	-- Thêm dữ liệu vào bảng Accounts
	INSERT INTO `Accounts` (Email, UserName, FullName, DepartmentID, PositionID, CreateDate) VALUES
	('john.doe@example.com', 'johndoe', 'John Doe', 1, 1, CURDATE()),
	('jane.smith@example.com', 'janesmith', 'Jane Smith', 2, 2, CURDATE()),
	('robert.johnson@example.com', 'robertj', 'Robert Johnson', 3, 3, CURDATE()),
	('linda.brown@example.com', 'lindab', 'Linda Brown', 4, 4, CURDATE()),
	('michael.davis@example.com', 'michaeld', 'Michael Davis', 5, 5, CURDATE()),
	('susan.wilson@example.com', 'susanw', 'Susan Wilson', 6, 6, CURDATE()),
	('james.moore@example.com', 'jamesm', 'James Moore', 7, 7, CURDATE()),
	('patricia.taylor@example.com', 'patriciat', 'Patricia Taylor', 8, 8, CURDATE()),
	('william.anderson@example.com', 'williama', 'William Anderson', 9, 9, CURDATE()),
	('barbara.thomas@example.com', 'barbarat', 'Barbara Thomas', 10, 10, CURDATE()),
    ('emma.wilson@example.com', 'emmaw', 'Emma Wilson', 2, 2, CURDATE()),
	('david.thompson@example.com', 'davidt', 'David Thompson', 2, 3, CURDATE()),
	('olivia.jackson@example.com', 'oliviaj', 'Olivia Jackson', 2, 4, CURDATE());
    

	-- Thêm dữ liệu vào bảng Group
	INSERT INTO `Group` (GroupName, CreatorId, CreateDate) VALUES
	('Group A', 1, CURDATE()),
	('Group B', 2, CURDATE()),
	('Group C', 3, CURDATE()),
	('Group D', 4, CURDATE()),
	('Group E', 5, CURDATE()),
	('Group F', 6, CURDATE()),
	('Group G', 7, CURDATE()),
	('Group H', 8, CURDATE()),
	('Group I', 9, CURDATE()),
	('Group J', 10, CURDATE());

	-- Thêm dữ liệu vào bảng GroupAccount
	INSERT INTO GroupAccount (GroupId, AccountId, JointDate) VALUES
	(1, 1, CURDATE()),
	(2, 2, CURDATE()),
	(3, 3, CURDATE()),
	(4, 4, CURDATE()),
	(5, 5, CURDATE()),
	(6, 6, CURDATE()),
	(7, 7, CURDATE()),
	(8, 8, CURDATE()),
	(9, 9, CURDATE()),
	(10, 10, CURDATE());

	-- Thêm dữ liệu vào bảng TypeQuestion
	INSERT INTO TypeQuestion (TypeName) VALUES
	('Multiple Choice'),
	('True/False'),
	('Short Answer'),
	('Essay'),
	('Matching'),
	('Fill in the Blanks'),
	('Ordering'),
	('Numeric'),
	('Diagram'),
	('Simulation');

	-- Thêm dữ liệu vào bảng CategoryQuestion
	INSERT INTO CategoryQuestion (CategoryName) VALUES
	('Mathematics'),
	('Science'),
	('History'),
	('Geography'),
	('Literature'),
	('Computer Science'),
	('Physics'),
	('Chemistry'),
	('Biology'),
	('Economics');

	-- Thêm dữ liệu vào bảng Question
	INSERT INTO Question (Content, CategoryId, TypeId, CreatorId, CreateDate) VALUES
	('What is 2 + 2?', 1, 1, 1, CURDATE()),
	('What is the capital of France?', 4, 2, 2, CURDATE()),
	('Who wrote "To Kill a Mockingbird"?', 5, 3, 3, CURDATE()),
	('Explain the theory of relativity.', 7, 4, 4, CURDATE()),
	('Match the countries with their capitals.', 4, 5, 5, CURDATE()),
	('Fill in the blanks: E = mc^__', 7, 6, 6, CURDATE()),
	('Order the planets from the Sun.', 6, 7, 7, CURDATE()),
	('Solve for x in the equation 2x = 10.', 1, 8, 8, CURDATE()),
	('Label the parts of the cell.', 9, 9, 9, CURDATE()),
	('Simulate the process of photosynthesis.', 9, 10, 10, CURDATE());

	-- Thêm dữ liệu vào bảng Answer
	INSERT INTO Answer (Content, QuestionId, isCorrect) VALUES
	('4', 1, 'TRUE'),
	('5', 1, 'FALSE'),
	('3', 1, 'FALSE'),
	('2', 1, 'FALSE'), -- 4 câu trả lời cho QuestionId 1

	('Paris', 2, 'TRUE'),
	('London', 2, 'FALSE'),
	('Rome', 2, 'FALSE'), -- 3 câu trả lời cho QuestionId 2

	('Harper Lee', 3, 'TRUE'),
	('Mark Twain', 3, 'FALSE'),
	('Jane Austen', 3, 'FALSE'),
	('Hemingway', 3, 'FALSE'), -- 4 câu trả lời cho QuestionId 3

	('Albert Einstein', 4, 'TRUE'),
	('Isaac Newton', 4, 'FALSE'),
	('Stephen Hawking', 4, 'FALSE'), -- 3 câu trả lời cho QuestionId 4

	('Germany - Berlin', 5, 'TRUE'),
	('France - Paris', 5, 'TRUE'),
	('UK - London', 5, 'TRUE'),
	('Canada - Ottawa', 5, 'TRUE'), -- 4 câu trả lời cho QuestionId 5

	('E = mc^2', 6, 'TRUE'),
	('E = mc^3', 6, 'FALSE'),
	('E = mc^1', 6, 'FALSE'), -- 3 câu trả lời cho QuestionId 6

	('Mercury', 7, 'TRUE'),
	('Venus', 7, 'TRUE'),
	('Earth', 7, 'TRUE'),
	('Mars', 7, 'TRUE'),
	('Jupiter', 7, 'FALSE'), -- 5 câu trả lời cho QuestionId 7

	('5', 8, 'TRUE'),
	('3', 8, 'FALSE'),
	('6', 8, 'FALSE'), -- 3 câu trả lời cho QuestionId 8

	('Cell Membrane', 9, 'TRUE'),
	('Nucleus', 9, 'FALSE'),
	('Mitochondria', 9, 'FALSE'),
	('Vacuole', 9, 'FALSE'), -- 4 câu trả lời cho QuestionId 9

	('Photosynthesis converts carbon dioxide into oxygen.', 10, 'TRUE'),
	('Photosynthesis converts oxygen into carbon dioxide.', 10, 'FALSE'),
	('Photosynthesis occurs in animal cells.', 10, 'FALSE'),
	('Photosynthesis needs sunlight.', 10, 'TRUE'); -- 4 câu trả lời cho QuestionId 10


	-- Thêm dữ liệu vào bảng Exam
	INSERT INTO Exam (`Code`, Title, CategoryId, Duration, CreatorId, CreateDate) VALUES
	('EX123', 'Math Exam', 1, 60, 1, CURDATE()),
	('EX124', 'Science Exam', 2, 90, 2, CURDATE()),
	('EX125', 'History Exam', 3, 30, 3, CURDATE()),
	('EX126', 'Geography Exam', 4, 75, 4, CURDATE()),
	('EX127', 'Literature Exam', 5, 45, 5, CURDATE()),
	('EX128', 'CS Exam', 6, 60, 6, CURDATE()),
	('EX129', 'Physics Exam', 7, 90, 7, CURDATE()),
	('EX130', 'Chemistry Exam', 8, 60, 8, CURDATE()),
	('EX131', 'Biology Exam', 9, 75, 9, CURDATE()),
	('EX132', 'Economics Exam', 10, 120, 10, CURDATE());

	-- Thêm dữ liệu vào bảng ExamQuestion
	INSERT INTO ExamQuestion (ExamId, QuestionId) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10);

    
    -- Question 2 : 全て部署のリストを取得します
     SELECT * FROM Department;
     
	-- Question 3 : SALES部を取得します
     SELECT DepartmentId FROM Department WHERE DepartmentName = "Sales";
	-- Question 4 : 長くにフルネームを持つアカウントの情報を取得します
    SELECT LENGTH(FullName) AS LENGTH_FULLNAME , FullName, AccountId FROM `Accounts`;
     SELECT * FROM `Accounts` WHERE LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM `Accounts`);
     
    -- Question 5 : (クエスチョン　５)　フルネームが最も長いアカウントの情報を取得し、IDが３の部署に属しているアカウントの情報を取得します。
    
    SELECT *,LENGTH(FullName) AS LENGTH FROM `Accounts` WHERE LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM `Accounts` WHERE DepartmentId = 3);
    
    -- Question 6 (クエスチョン　６)　：2019年12月20日より前に参加したグルーブの名前を取得します
    SELECT * FROM `Group`;
    SELECT * FROM `Group` WHERE CreateDate<= "2019-05-16";
    
    -- Question 7 (クエスチョン　７)：４つの以上の回答がある質問のIDを取得します
	SELECT QuestionId, COUNT(*) AS  COUNT_Q  FROM Answer  GROUP BY QuestionId HAVING COUNT_Q >= 4 ;
  
    -- Question 8 (クエスチョン　８) : 2019年12月20日より前に作成された、６０分からの試験コードを取得します。
    
    SELECT * FROM Exam WHERE Duration >= 60 AND CreateDate <= 2019-12-20;
    -- Question 9 (クエスチョン　９)　：最近作成された５つのグループを取得します
	SELECT * FROM `Group` ORDER BY CreateDate DESC LIMIT 5 ;
    
    -- Question 10 (クエスチョン　１０)　： IDが２の部署に所属する従業員の数を数える
    SELECT * FROM Accounts WHERE DepartmentID = 2;
    SELECT DepartmentID , COUNT(DepartmentID) FROM Accounts WHERE DepartmentID = 2;
    
    -- Question 11 (クエスチョン　１１) : D で始まり、oで終わる従業員の名前を取得します
    SELECT * FROM Accounts WHERE FullName LIKE 'D%o';
    -- Question 12 (クエスチョン　１２)　： 2019/12/20 より前に作成されたすべての試験を削除する
	-- c1
	-- DELETE FROM Accounts WHERE AccountId IN (SELECT AccountId FROM (SELECT * FROM Accounts) AS tempTable1 WHERE CreateDate >= "2019-12-20" );
    -- c2
    /* SET SQL_SAFE_UPDATES = 0;
	DROP TEMPORARY TABLE IF EXISTS temp_ids;
    CREATE TEMPORARY TABLE IF NOT EXISTS  temp_ids(AccountId	INT);
    INSERT INTO temp_ids(AccountId)
		SELECT AccountID
		FROM Accounts
		WHERE CreateDate >= "2019-12-20";
	DELETE FROM Accounts WHERE AccountID IN (SELECT AccountId FROM temp_ids);
    -- c3
    
    DELETE FROM Accounts WHERE AccountId IS NOT NULL AND CreateDate >= "2019-12-20";
    */
    -- Question  13 (クエスチョン　１３)：内容が”Câu hỏi”で始まる問題をすべて削除する
	
    INSERT INTO Question (Content, CategoryId, TypeId, CreatorId, CreateDate) 
	VALUES
		('Câu hỏi demo ', 1, 1, 1, CURDATE());
    /*    
    DELETE FROM Question WHERE QuestionId IN (SELECT QuestionId FROM (SELECT QuestionId FROM Question WHERE Content LIKE "Câu hỏi %") AS Temp_q);
    DELETE FROM Question WHERE QuestionId IS NOT NULL AND Content LIKE "Câu hỏi %";
    
    
    DROP TEMPORARY TABLE IF EXISTS Temp_q;
    CREATE TEMPORARY TABLE IF NOT EXISTS Temp_q(QuestionId TINYINT);
    INSERT INTO Temp_q(QuestionId)
		SELECT QuestionId FROM Question
		WHERE	Content LIKE "Câu hỏi%";
	SELECT * FROM Temp_q;
    DELETE FROM Question WHERE QuestionId IN (SELECT QuestionId FROM Temp_q);
    */
    
     -- Question 14 (クエスチョン　１４)　：   IDの５アカウントの情報を更新して、名前を「Nguyen Ba Loc」に、メールアドレスを「loc.nguyenba@vti.com.vn」にする
     UPDATE Accounts 
     SET 	FullName = "Nguyen Ba Loc",
			Email	= "loc.nguyenba@vti.com.vn"
	WHERE
			AccountId = 5;
	Select * From Accounts WHERE AccountId = 5;
    
    -- Question 14 (クエスチョン　１５)：IDの５アカウントの情報を更新してグルーブを「４」にする
    UPDATE GroupAccount
    SET GroupId = 4
    WHERE AccountId = 5;
    
    
		
        
    
    
    
    
    
     