-- SQL - Assignment 2
DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_2;
USE Testing_System_Assignment_2;
	DROP TABLE IF EXISTS Department;
	CREATE TABLE IF NOT EXISTS Department (
			DepartmentId 		TINYINT AUTO_INCREMENT,
            DepartmentName 		VARCHAR(50) NOT NULL,
            -- CONSTRAINT dn_ck CHECK(LENGTH(DepartmentName) >= 4 AND LENGTH(DepartmentName) <=50),
            CONSTRAINT d_pk		PRIMARY KEY (DepartmentID),
            CONSTRAINT dn_uq	UNIQUE(DepartmentName)
    );
    DROP TABLE IF EXISTS `Position`;
    CREATE TABLE IF NOT EXISTS `Position`(
			PositionId TINYINT  AUTO_INCREMENT,
            PositionName VARCHAR(50) NOT NULL,
            CONSTRAINT 	ps_pk 	PRIMARY KEY (PositionId),
            CONSTRAINT 	ps_uq	UNIQUE(PositionName),
            CONSTRAINT 	ps_ck	CHECK(LENGTH(PositionName) >= 5 AND LENGTH(PositionName) <=50)
    );
    DROP TABLE IF EXISTS `Accounts`;
    CREATE TABLE IF NOT EXISTS `Accounts`(
			AccountId INT  AUTO_INCREMENT,
            Email VARCHAR(30),
            UserName VARCHAR(30),
            FullName VARCHAR(30),
            DepartmentId TINYINT,
            PositionId TINYINT,
            CreateDate DATETIME NOT NULL DEFAULT NOW(),
            CONSTRAINT 	ac_pk	PRIMARY KEY(AccountId),
            CONSTRAINT	ac_uq	UNIQUE(Email,UserName),
            CONSTRAINT 	ac_cke	CHECK(LENGTH(Email) >= 10 AND LENGTH(EMAIL) <=30),
            CONSTRAINT ac_chus	CHECK(LENGTH(UserName) >=4 AND LENGTH(UserName) <=30),
            CONSTRAINT ac_ckfn	CHECK(LENGTH(FullName) >= 5 AND LENGTH(FullName) <=30),
			CONSTRAINT ac_frd	FOREIGN KEY(DepartmentId) REFERENCES Department(DepartmentId),
            CONSTRAINT ac_frp	FOREIGN KEY(PositionId) REFERENCES	`Position`(PositionId)
	);
    
    
    -- INSERT DATA DEMO IN TABLE
		INSERT INTO Department(DepartmentName)
        VALUES
			('Marketing'),
			('Sales'),
			('Finance'),
			('Human Resources'),
			('IT'),
			('Customer Service'),
			('Research and Development'),
			('Operations'),
			('Administration'),
			('Production'),
			('Logistics');
            
		INSERT INTO `Position`(PositionName)
        VALUES
			('Manager'),
			('AssiAccountstant Manager'),
			('Sales Representative'),
			('Accountant'),
			('Software Engineer'),
			('Customer Service '),
			('Marketing Specialist'),
			('Human Resources Manager'),
			('Operations Manager'),
			('Production Supervisor'),
			('Logistics Coordinator');
            
		INSERT INTO `Accounts`(Email,UserName,FullName,DepartmentId,PositionId)
        VALUES
			('email1@example.com', 'user1', 'John Doe', 1, 1),
			('email2@example.com', 'user2', 'Jane Smith', 2, 3),
			('email3@example.com', 'user3', 'David Johnson', 1, 2),
			('email4@example.com', 'user4', 'Emily Brown', 3, 4),
			('email5@example.com', 'user5', 'Michael Wilson', 2, 1),
			('email6@example.com', 'user6', 'Sarah Jones', 1, 3),
			('email7@example.com', 'user7', 'Christopher Martinez', 3, 2),
			('email8@example.com', 'user8', 'Amanda Anderson', 2, 4),
			('email9@example.com', 'user9', 'Matthew Taylor', 1, 1),
			('email10@example.com', 'user10', 'Laura Garcia', 3, 3),
			('email11@example.com', 'user11', 'Daniel Rodriguez', 2, 2);
    
    
    -- Question 2 : 全て部署のリストを取得します
     SELECT * FROM Department;
     
	-- Question 3 : SALES部を取得します
     SELECT DepartmentId FROM Department WHERE DepartmentName = "Sales";
	-- Question 4 : 長くにフルネームを持つアカウントの情報を取得します
    SELECT LENGTH(FullName) AS LENGTH_FULLNAME , FullName, AccountId FROM `Accounts`;
     SELECT * FROM `Accounts` WHERE LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM `Accounts`);
     