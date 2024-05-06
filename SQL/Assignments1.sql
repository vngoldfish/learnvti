## SQL - Assignment 1

CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_1;
	CREATE TABLE IF NOT EXISTS Department (
			DepartmentId INT PRIMARY KEY AUTO_INCREMENT,
            DepartmentName VARCHAR(50)
    );
    CREATE TABLE IF NOT EXISTS `Position`(
			PositionId INT PRIMARY KEY AUTO_INCREMENT,
            PositionName VARCHAR(30)
    );
    CREATE TABLE IF NOT EXISTS `Account`(
			AccountId INT PRIMARY KEY AUTO_INCREMENT,
            Email VARCHAR(30),
            UserName VARCHAR(30),
            FullName VARCHAR(30),
            DepartmentID INT,
            PositionID INT,
            CreateDate DATE,
            FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId),
            FOREIGN KEY (PositionId) REFERENCES `Position`(PositionId)
	)