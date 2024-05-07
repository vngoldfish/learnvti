

USE Testing_System_Assignment_1;
-- Question 1 : Create the table (with the most appropriate / economic field / colum constraints & type)
DROP TABLE IF EXISTS Trainee;
CREATE TABLE IF NOT EXISTS Trainee(
	TraineeID	INT PRIMARY KEY AUTO_INCREMENT,
    Full_Name	VARCHAR(50) NOT NULL,
    Birth_date	DATE,
    Gender		ENUM('Male','Famale','Unknown'),
    ET_IQ		INT CHECK(ET_IQ >=0 AND ET_IQ<=20),
    ET_Gmath	INT CHECK(ET_Gmath >=0 AND ET_Gmath <=20),
    ET_English	INT CHECK (ET_English >=0 AND ET_English <=50),
    Training_Class	VARCHAR(20),
    Evaluation_Notes	VARCHAR(50)
);

/*
	Question 2 : Change the table TRAINEE to add more field named VTI_Account which is a not_null & unique field
*/
ALTER TABLE Trainee
ADD VTI_Account	VARCHAR(20) NOT NULL UNIQUE;
