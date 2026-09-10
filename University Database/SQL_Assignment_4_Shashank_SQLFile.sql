-- Create Database
CREATE DATABASE UniversityDB;

USE UniversityDB;

-----------------------------------------------------
-- Create Departments Table
-----------------------------------------------------

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-----------------------------------------------------
-- Create Students Table
-----------------------------------------------------

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

-----------------------------------------------------
-- Create Courses Table
-----------------------------------------------------

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    StudentID INT,
    FOREIGN KEY (StudentID)
        REFERENCES Students(StudentID)
);

-----------------------------------------------------
-- Insert Departments
-----------------------------------------------------

INSERT INTO Departments VALUES
(1,'Computer Science'),
(2,'Information Technology'),
(3,'Electronics'),
(4,'Mechanical'),
(5,'Civil');

-----------------------------------------------------
-- Insert Students
-----------------------------------------------------

INSERT INTO Students VALUES
(101,'Alice Johnson',21,1),
(102,'Bob Smith',22,1),
(103,'Charlie Brown',20,2),
(104,'David Miller',23,3),
(105,'Emma Wilson',21,2),
(106,'Frank Thomas',22,4),
(107,'Grace Lee',20,5),
(108,'Henry Clark',24,1);

-----------------------------------------------------
-- Insert Courses
-----------------------------------------------------

INSERT INTO Courses VALUES
(1001,'Artificial Intelligence',101),
(1002,'Data Structures',101),
(1003,'Database Management',102),
(1004,'Machine Learning',102),
(1005,'Computer Networks',103),
(1006,'Artificial Intelligence',104),
(1007,'Data Analytics',105),
(1008,'Operating Systems',105),
(1009,'Software Engineering',106),
(1010,'Data Mining',108),
(1011,'Big Data',108),
(1012,'Artificial Intelligence',108);



5. Query-Based Questions
a. Retrieve all student details along with their department names.
b. Find the names of all students who are enrolled in 'Artificial Intelligence'.
c. Count how many students are in each department.
d. List the courses taken by 'Alice Johnson'. (assuming Alice Johnson is a student)
e. Find students who are enrolled in more than one course.
f. Get the average age of students in each department.
g. Find the department with the most students.
h. List all students who are NOT enrolled in any course.
i. Retrieve students along with the total number of courses they are enrolled in.
j. Find students who belong to 'Computer Science' and are taking a course with 'Data' in its name.


a. Select s.StudentID, s.Name, s.Age, d.DepartmentName from Students join Departments d on s.DepartmentID=d.DepartmentID;
b. Select s.StudentID, s.Name, s.Age,c.CourseName from Students s join Courses c on s.StudentID=c.StudentID where c.CourseName='Artificial Intelligence';
c. Select d.DepartmentName,count(s.StudentID) "Number of Students" from Departments d join Students s on s.DepartmentID=d.DepartmentID group by d.DepartmentName;
d. Select s.Name,c.CourseName from Students s join Courses c on s.StudentID=c.StudentID where s.Name='Alice Johnson';
e. Select s.StudentID,s.Name,count(c.StudentID) "No of Courses" from Students s join Courses c on s.StudentID=c.StudentID group by s.StudentID,s.Name having count(c.StudentID)>1;
f. Select d.DepartmentName,avg(s.age) from Students s join Departments d on s.DepartmentID=d.DepartmentID group by d.DepartmentName;
g. Select d.DepartmentName,count(s.StudentID) "No of Students" from Students s join Departments d on s.DepartmentID=d.DepartmentID group by d.DepartmentName order by count(s.StudentID) desc limit 1;
h. Select s.StudentID, s.Name, s.Age,c.coursename from Students s left join Courses c on s.StudentID =c.StudentID where c.coursename is null;
i. Select s.StudentID, s.Name, s.Age, count(c.StudentID) "Number of Courses" from Students s left join Courses c on s.StudentID=c.StudentID group by s.StudentID, s.Name, s.Age;
j. Select s.StudentID, s.Name, s.Age, d.DepartmentName, c.CourseName from Students s join Departments d on s.DepartmentID=d.DepartmentID
	join Courses c on s.StudentID=c.StudentID where d.DepartmentName='Computer Science' and c.CourseName like '%Data%';