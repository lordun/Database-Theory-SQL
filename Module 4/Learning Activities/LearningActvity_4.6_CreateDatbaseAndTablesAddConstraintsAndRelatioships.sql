--Learning Activity 4.6: Create database & tables, Add constraints & relationships

--Create a database called Film_World and write SQL statements to create a database with the tables from the following ERD:

--Assume the following:
--Question 1.	Primary keys are indicated in bold.
--Question 2.	Foreign keys are indicated in italics
--Question 3.	Review score can be any value between 0 and 10, inclusive.
--Question 4.	Movies without set release dates are allowed.
--Question 5.	Movies without a title are not allowed.

create database Film_World;

create table Company
	(
	companyId int unique, companyName varchar(255) not null, primary key (companyId)
	);

create table Movie
	(
	moviedId int unique, title varchar(255) not null, companyId int not null, releaseDate date null, boxOfficeRevenue money,
	reviewScore int check (reviewScore >= 0 and reviewScore <= 10), primary key (moviedId), foreign key (companyId) references 
	Company
	);

create table Actor
	(
	actorId int unique, firstName varchar(255) not null, LastName varchar(255) not null, dateOfBirth date, primary key (actorId)
	);

create table ActedIn
	(
	movieId int, actorId int, foreign key (movieId) references Movie, foreign key (actorId) references Actor
	);
	
