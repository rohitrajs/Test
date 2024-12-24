-------------------Create Tables----------------------

CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Image NVARCHAR(MAX),
    Class NVARCHAR(50),
    RollNumber NVARCHAR(50) NOT NULL
);

CREATE TABLE Teachers (
    TeacherID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Image NVARCHAR(MAX),
    Sex NVARCHAR(10) NOT NULL
);

CREATE TABLE Subjects (
    SubjectID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Class NVARCHAR(50) NOT NULL,
    Language NVARCHAR(50)
);

CREATE TABLE TeacherSubjectMapping (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    TeacherID INT NOT NULL,
    SubjectID INT NOT NULL,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);
	
--------------Procedures-------------------------

-- =============================================  
-- Author:  <Author,,Rohit Raj>  
-- Create date: <Create Date,,2024-12-23>  
-- Description: <Description,,Insert Studentdata>  
-- =============================================  
CREATE PROCEDURE pInsertStudentInfo  
(  
 @Name varchar(20),  
 @Age INT,  
 @Image varchar(max),   
 @Class varchar(10),   
 @RollNumber varchar(20)  
)  
AS  
BEGIN  
 INSERT INTO Students (Name, Age, Image, Class, RollNumber) VALUES (@Name, @Age, @Image, @Class, @RollNumber)  
END  
  


-- =============================================  
-- Author:  <Author,,Rohit Raj>  
-- Create date: <Create Date,,2024-12-23>  
-- Description: <Description,,Insert Teacherdata>  
-- =============================================  
Create PROCEDURE pInsertTacherInfo  
(  
 @TechName varchar(10),  
 @Age INT,
 @Image varchar(max),   
 @Sex varchar(10)  
)  
AS  
BEGIN  
 INSERT INTO Teachers (Name,Age,Image, Sex) VALUES (@TechName,@Age, @Image, @Sex)  
END 

-- =============================================  
-- Author:  <Author,,Rohit Raj>  
-- Create date: <Create Date,,2024-12-23>  
-- Description: <Description,,Insert Teacherdata>  
-- =============================================  
CREATE PROCEDURE pInsertSubjectInfo  
(  
 @Name varchar(20),  
 @Language varchar(10),   
 @Class varchar(10)  
)  
AS  
BEGIN  
 INSERT INTO Subjects (Name, Language, Class) VALUES (@Name, @Language, @Class)  
END  
  

-- =============================================  
-- Author:  <Author,,Rohit Raj>  
-- Create date: <Create Date,,2024-12-23>  
-- Description: <Description,,get Subject With Teacher>  
-- =============================================  
CREATE PROCEDURE pSubjectWithTeacher  
AS  
BEGIN  
 SELECT s.Name AS Subject, s.Class, s.Language, t.Name AS Teacher 
 FROM TeacherSubjectMapping ts 
 INNER JOIN Subjects s ON ts.SubjectID = s.SubjectID
 INNER JOIN Teachers t ON ts.TeacherID = t.TeacherID  
END


GO
-- =============================================  
-- Author:  <Author,,Rohit Raj>  
-- Create date: <Create Date,,2024-12-23>  
-- Description: <Description,,get Student Details>  
-- =============================================  
Create PROCEDURE pSearchStudentName  
(
@Name varchar(20) 
)  
AS  
BEGIN  
 SELECT Name, Age, Class, RollNumber, Image FROM Students WHERE Name LIKE '%' + @Name + '%'  
END

