DROP DATABASE IF EXISTS Fresher_Training_Management;
CREATE DATABASE IF NOT EXISTS Fresher_Trining_Management;
USE Fresher_Trining_Management;
	DROP TABLE IF EXISTS Trainee;
    CREATE TABLE IF NOT EXISTS Trainee(
		TraineeID	TINYINT AUTO_INCREMENT,
        Full_Name	VARCHAR(50) NOT NULL,
        Birth_Date	DATE,
        Gender		ENUM("MAELE","FEMALE","UNKNOWN"),
        ET_IQ		TINYINT	UNSIGNED,
        ET_Gmath	TINYINT	UNSIGNED,
        ET_English	TINYINT	UNSIGNED,
        Training_Class	VARCHAR(10),
        Evaluation_Notes	VARCHAR(100),
        CONSTRAINT	tr_pk PRIMARY KEY(TraineeID),
        CONSTRAINT	e_iq	CHECK(ET_IQ >=0 AND ET_IQ <=20),
        CONSTRAINT	e_gmath	CHECK(ET_Gmath >=0 AND ET_Gmath <=20),
        CONSTRAINT	e_en	CHECK(ET_English >=0 AND ET_English <=50),
        CONSTRAINT ck_uq UNIQUE(Full_Name)
        );
        


-- Quesstion 2 : Change the table TRAINEE to add one more field named VTI_Account wich is a not-null & unique field
        
ALTER TABLE Trainee
ADD VIT_Account VARCHAR(30) UNIQUE NOT NULL;

