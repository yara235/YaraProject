CREATE DATABASE school_management;
SHOW DATABASES;
USE school_management;

CREATE TABLE Classes (ClassID INT PRIMARY KEY AUTO_INCREMENT,Name VARCHAR(50) NOT NULL);

CREATE TABLE Subjects (SubjectID INT PRIMARY KEY AUTO_INCREMENT,Name VARCHAR(100) NOT NULL);

CREATE TABLE Students (StudentID INT PRIMARY KEY AUTO_INCREMENT,FirstName VARCHAR(50),LastName VARCHAR(50),Gender ENUM('Male', 'Female'),BirthDate DATE,ClassID INT,FOREIGN KEY (ClassID) REFERENCES Classes(ClassID));

CREATE TABLE Teachers (TeacherID INT PRIMARY KEY AUTO_INCREMENT,FirstName VARCHAR(50),LastName VARCHAR(50),SubjectID INT,FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID));

CREATE TABLE Grades (GradeID INT PRIMARY KEY AUTO_INCREMENT,StudentID INT,SubjectID INT,Grade DECIMAL(5,2),FOREIGN KEY (StudentID) REFERENCES Students(StudentID),FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID));


INSERT INTO Classes (Name) VALUES('Grade 1'), ('Grade 2'), ('Grade 3'), ('Grade 4'), ('Grade 5'),('Grade 6'), ('Grade 7'), ('Grade 8'), ('Grade 9'), ('Grade 10');
SELECT *FROM Classes;

INSERT INTO Subjects (Name) VALUES('Math'), ('Science'), ('English'), ('Arabic'), ('History'),('Geography'), ('Computer Science'), ('Biology'), ('Chemistry'), ('Physics');
SELECT *FROM Subjects;

INSERT INTO Students (FirstName, LastName, Gender, BirthDate, ClassID) VALUES('Ahmed', 'Ali', 'Male', '2010-05-14', 1),('Sara', 'Hassan', 'Female', '2009-08-23', 2),('Omar', 'Youssef', 'Male', '2010-02-11', 1),('Mona', 'Ibrahim', 'Female', '2008-11-30', 3),('Yousef', 'Tariq', 'Male', '2011-01-25', 1),('Nour', 'Khaled', 'Female', '2009-07-16', 2),('Hana', 'Sami', 'Female', '2008-04-03', 3),('Ali', 'Mostafa', 'Male', '2009-12-12', 2),('Laila', 'Amr', 'Female', '2010-09-19', 1),('Ziad', 'Mahmoud', 'Male', '2008-10-05', 3);
SELECT *FROM Students;

INSERT INTO Teachers (FirstName, LastName, SubjectID) VALUES('Mohamed', 'Fathy', 1),('Hanan', 'Saeed', 2),('Khaled', 'Nabil', 3),('Fatma', 'Ali', 4),('Ibrahim', 'Kamal', 5),('Rania', 'Samir', 6),('Tamer', 'Reda', 7),('Marwa', 'Adel', 8),('Samy', 'Hassan', 9),('Dina', 'Salah', 10);
SELECT *FROM Teachers;

INSERT INTO Grades (StudentID, SubjectID, Grade) VALUES(1, 1, 85.50),(1, 2, 90.00),(2, 1, 78.00),(2, 3, 88.75),(3, 1, 92.00),(3, 2, 81.25),(4, 4, 95.00),(5, 1, 79.50),(5, 3, 83.00),(6, 2, 89.00);
SELECT *FROM Grades;

SELECT * FROM Students
WHERE FirstName LIKE 'a%';

SELECT AVG(Grade) AS AverageGrade
FROM Grades
WHERE StudentID = 1;

SELECT c.Name AS ClassName, COUNT(s.StudentID) AS StudentCount
FROM Classes c
LEFT JOIN Students s ON c.ClassID = s.ClassID
GROUP BY c.Name;

SELECT s.FirstName, s.LastName, MAX(g.Grade) AS HighestGrade
FROM Students s
JOIN Grades g ON s.StudentID = g.StudentID
GROUP BY s.StudentID
ORDER BY HighestGrade DESC;

SELECT t.FirstName, t.LastName, s.Name AS SubjectName
FROM Teachers t
JOIN Subjects s ON t.SubjectID = s.SubjectID
ORDER BY t.LastName ASC;

SELECT 
    s.FirstName,
    s.LastName,
    g.Grade
FROM  Students s 
JOIN Grades g ON s.StudentID = g.StudentID 
WHERE  g.Grade > 85;
