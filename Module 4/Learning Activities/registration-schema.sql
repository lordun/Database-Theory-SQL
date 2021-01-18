--Question 4
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

