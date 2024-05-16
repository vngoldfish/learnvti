## SQL - Assignment 1
DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
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
        CONSTRAINT g_fk FOREIGN KEY (CreatorId)	 REFERENCES `Accounts`(AccountId)
    );
    DROP TABLE IF EXISTS GroupAccount;
    CREATE TABLE IF NOT EXISTS GroupAccount(
		GroupId TINYINT,
        AccountId INT,
        JointDate	DATE,
        CONSTRAINT ga_pk PRIMARY KEY (GroupId,AccountId),
        CONSTRAINT ga_fk1 FOREIGN KEY (GroupId) REFERENCES `Group`(GroupId),
        CONSTRAINT ga_fk2 FOREIGN KEY (AccountId) REFERENCES `Accounts`(AccountId)        
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
        CONSTRAINT q_fk3	FOREIGN KEY (CreatorId) REFERENCES `Accounts`(AccountId)
    );
    DROP TABLE IF EXISTS Answer;
    CREATE TABLE IF NOT EXISTS Answer(
		AnswerId TINYINT AUTO_INCREMENT,
        Content		VARCHAR(50),
        QuestionId	TINYINT,
        isCorrect	CHAR(5),
        CONSTRAINT aw_pk PRIMARY KEY(AnswerId),
        CONSTRAINT aw_uq	UNIQUE(CONTENT,isCorrect),
        CONSTRAINT aw_fk	FOREIGN KEY (QuestionId) REFERENCES Question(QuestionId)
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
        CONSTRAINT as_fk2	FOREIGN KEY (CreatorId) REFERENCES `Accounts`(AccountId)
    );
    DROP TABLE IF EXISTS ExamQuestion;
    CREATE TABLE IF NOT EXISTS ExamQuestion(
		ExamId TINYINT,
        QuestionId	TINYINT,
        CONSTRAINT eq_pk PRIMARY KEY(ExamId,QuestionId)
    );