--Learning Activity 4.5: Create database & tables, Add constraints & relationships

--Question 1 Create a new database named Membership.

create database Membership;

--Question 2 Write the CREATE TABLE statements needed to implement the following design in the Membership database. 
--Define IndividualID and GroupID as identity columns. 
--Decide which columns should allow null values, if any, and explain your decision.
--Define the Dues column with a default of zero and a check constraint to allow only positive values.

create table Individuals
	(
	IndividualID int not null unique, --Individual ID's should not contain a null value as it is an identifier
	Dues money not null default 0, --Dues should not contain a null value as it has a default value associated with it
	primary key (IndividualID)
	);

create table Groups
	(
	GroupID int not null unique, --Group ID's should not contain a null value as it is an identifier
	Dues money not null default 0, --Dues should not contain a null value as it has a default value associated with it
	primary key (GroupID)
	);
	
--Question 3 Write an ALTER TABLE statement that adds a new column, DuesPaid, to the Individuals table. Use the bit data type, disallow null values, and assign a default Boolean value of False.

Alter Table Individuals
	Add DuesPaid bit not null default 0;

--Question 4 Write a SQL script named registration-schema.sql that creates a database with the following tables:
--Student (student_id, name, gpa)
--Dept(dept_id,name, dean, building, room)
--Course(dept_id, course_id, name, hours), where dept_id is a foreign key referencing the Dept(dept_id)
--Enrolled(dept_id, course_id, student_id), where (dept_id, course_id) is a foreign key referencing course(dept_id, course_id) and student_id is a foreign key referencing student(student_id)

--registration-schema.sql
create database Registration;

create table Student
	(
	student_id int not null unique, name varchar(50) not null, gpa numeric,
	primary key (student_id)
	);

create table Dept
	(
	dept_id int not null unique, dean varchar(50) not null, building varchar(100), room varchar(10),
	primary key (dept_id)
	);

create table Course
	(
	dept_id int not null unique, course_id int not null unique, name varchar(50), hours int not null,
	primary key (dept_id, course_id), foreign key (dept_id) references Dept (dept_id)
	);
	
create table Enrolled
	(
	dept_id int not null unique, course_id int not null unique, student_id int not null,
	foreign key (dept_id, course_id) references Course (dept_id, course_id), foreign key (student_id) references Student (student_id)
	);


