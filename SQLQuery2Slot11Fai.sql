create database TableStudent
use TableStudent

create Table Student (
	SID int NOT NULL UNIQUE,
    S_FName VARCHAR(20) NOT NULL,
    S_LName VARCHAR(30) NOT NULL,
    PRIMARY KEY (SID)
);


create Table Course (
	CID int NOT NULL,
    C_Name VARCHAR(30) NOT NULL,
    PRIMARY KEY (CID)
);


CREATE TABLE Course_Grades (
    CGID int NOT NULL UNIQUE,
    Semester CHAR(4) NOT NULL,
    CID int NOT NULL,
    SID int NOT NULL,
    Grade CHAR,
    PRIMARY KEY (CGID),
    FOREIGN KEY (CID) REFERENCES Course(CID),
    FOREIGN KEY (SID) REFERENCES Student(SID)
);


insert into Student (SID, S_FName, S_LName) values 
(12345, 'Chris', 'Rock'),
(23456, 'Chris', 'Farley'),
(34567, 'David', 'Spade'),
(45678, 'Liz', 'Lemon'),
(56789, 'Jack', 'Donaghy');

insert into Course_Grades (CGID, Semester, CID, SID, Grade) values 
(2010101, 'SP10', 101005, 34567, 'D+'),
(2010308, 'FA10', 101005, 34567, 'A-'),
(2010309, 'FA10', 101001, 45678, 'B+'),
(2011308, 'FA11', 101003, 23456, 'B-'),
(2012206, 'SU12', 101002, 56789, 'A+');

insert into Course (CID, C_Name) values 
(101001, 'Intro to Computers'),
(101002, 'Programming'),
(101003, 'Databases'),
(101004, 'Websites'),
(101005, 'IS Management');


ALTER TABLE Student
ALTER COLUMN S_FName VARCHAR(30);


ALTER TABLE Course
ADD Faculty_LName VARCHAR(30) NOT NULL DEFAULT 'TBD';

UPDATE Course
set Faculty_LName = 'Potter'
WHERE CID = 101001 AND C_Name = 'Intro to Wizardry';

ALTER TABLE Course
RENAME COLUMN C_Name TO Course_Name;

ALTER TABLE Course_Grades
ALTER COLUMN Grade VARCHAR(2);

DELETE FROM Course
WHERE C_Name = 'Websites';