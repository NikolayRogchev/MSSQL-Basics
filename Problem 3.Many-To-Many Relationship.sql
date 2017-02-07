DROP TABLE StudentsExams
DROP TABLE Students
DROP TABLE Exams

CREATE TABLE Students (
StudentID INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Exams (
ExamID INT PRIMARY KEY IDENTITY(101, 1),
[Name] VARCHAR(100) NOT NULL
)

CREATE TABLE StudentsExams (
StudentID INT NOT NULL,
ExamID INT NOT NULL
)

ALTER TABLE StudentsExams
ADD CONSTRAINT fk_StudentsExams_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
ALTER TABLE StudentsExams
ADD CONSTRAINT fk_StudentsExams_Exams FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
ALTER TABLE StudentsExams
ADD CONSTRAINT pk_StudentsExams PRIMARY KEY (StudentID, ExamID)

INSERT INTO Students VALUES
('Mila'), ('Toni'), ('Ron')

INSERT INTO Exams VALUES
('SpringMVC'), ('Neo4j'), ('Oracle 11g')

INSERT INTO StudentsExams VALUES
(1, 101), (1, 102), (2, 101), (3, 103), (2, 102), (2, 103)