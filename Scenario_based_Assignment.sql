--Gaurav Jaybhay
--FIS
--Day 4 (Scenario based Assignment)

create database FISGLOBAL

use FISGLOBAL

create table books (
id int primary key,
title varchar(60),
author varchar(50),
isbn numeric(12),
published_date date
)

insert into books values(1,'My First SQL book','Mary Parker',981483029127,'2012-02-22'),
(2,'My Second SQL book','John Mayer',857300923713,'1972-07-03'),
(3,'My Third SQL book','Cary Flint',523120967812,'2015-10-18')

select * from books

--[1] Write a query to fetch the details of the books written by author whose name ends with er.
select * from books where author like '%er';

create table reviews (
id int primary key,
book_id int references books(id),
reviewer_name varchar(50),
content varchar(60),
rating int,
published_date date
)


insert into reviews values(1,1,'John Smith','My first review',4,'2017-12-10'),
(2,2,'John Smith','My second review',5,'2017-10-13'),
(3,2,'Alice Walker','Another review',1,'2017-10-22')

select * from books
select * from reviews

--[2] Display the Title ,Author and ReviewerName for all the books from the above table 
select b.title as 'Title',b.author as 'Author',r.reviewer_name as 'Reviewer Name' from
books b join reviews r
on b.id=r.book_id

--[3] Display the  reviewer name who reviewed more than one book.
select reviewer_name as 'Reviewer Name' from reviews 
group by reviewer_name
having count(book_id)>1


CREATE TABLE Customer(ID INT PRIMARY KEY,
NAME VARCHAR(30),
AGE INT,
ADDRESS VARCHAR(30),
SALARY FLOAT
)

INSERT INTO Customer values(1,'Ramesh',32,'Ahmedabad',2000.00),
(2,'Khilan',25,'Delhi',1500.00),
(3,'Kaushik',23,'Kota',2000.00),
(4,'Chaitali',25,'Mumbai',6500.00),
(5,'Hardik',27,'Bhopal',8500.00),
(6,'Komal',22,'MP',4500.00),
(7,'Muffy',24,'Indore',10000.00)

select * from Customer

--[4] Display the Name for the customer from above customer table  who live in same address 
--which has character o anywhere in address 
select NAME,ADDRESS from Customer
where ADDRESS like '%o%'


create table orders(OID int primary key,
DATE date,
CUSTOMER_ID int references Customer(ID),
AMOUNT int
)

insert into orders values(102,'2009-10-08',3,3000),
(100,'2009-10-08',3,1500),
(101,'2009-11-20',2,1560),
(103,'2008-05-20',4,2060)

select * from Customer
select * from orders

--[5] Write a query to display the Date,Total no of customer placed order on same Date
select date as 'DATE',count(CUSTOMER_ID) as 'Total no of Customers' from orders 
group by date 
having count(CUSTOMER_ID) > 1


CREATE TABLE EMPLOYEE(ID INT PRIMARY KEY,
NAME VARCHAR(30),
AGE INT,
ADDRESS VARCHAR(30),
SALARY FLOAT
)

INSERT INTO EMPLOYEE values(1,'Ramesh',32,'Ahmedabad',2000.00),
(2,'Khilan',25,'Delhi',1500.00),
(3,'Kaushik',23,'Kota',2000.00),
(4,'Chaitali',25,'Mumbai',6500.00),
(5,'Hardik',27,'Bhopal',8500.00),
(6,'Komal',22,'MP',null),
(7,'Muffy',24,'Indore',null)

select * from EMPLOYEE

--[6] Display the Names of the Employee in lower case, whose salary is null 
select lower(NAME)as 'Emplyoee Name' from EMPLOYEE where SALARY is NULL


create table Studentdetails(RegisterNo int primary key,
Name varchar(30),
Age int,
Qualification varchar(30),
MobileNo numeric(10),
Mail_ID varchar(30),
Location varchar(30),
Gender char(1)
)

insert into Studentdetails values(2,'Sai',22,'B.E',9952836777,'Sai@gmail.com','Chennai','M'),
(3,'Kumar',20,'BSC',7890125648,'Kumar@gmail.com','Madurai','M'),
(4,'Selvi',22,'B.Tech',8904567342,'selvi@gamil.com','Selam','F'),
(5,'Nisha',25,'M.E',7834672310,'Nisha@gmail.com','Theni','F'),
(6,'SaiSaran',21,'B.A',7890345678,'saran@gmail.com','Madurai','F'),
(7,'Tom',23,'BCA',8901234675,'Tom@gmail.com','Pune','M')

select * from Studentdetails

--[7] Write a sql server query to display the Gender of Total no of male and female 
--from the above relation 
select sum(case when Gender='M' then 1 else 0 end) as 'No of Males',
sum(case when Gender='F' then 1 else 0 end) as 'No of Females'
from Studentdetails


create table Coursedetails(C_ID varchar(5) primary key,
C_Name varchar(30),
Start_date date,
End_date date,
Fee int)

create table CourseRegistration(RegisterNo int,
Cid varchar(5) references Coursedetails(C_ID),
Batch varchar(2)
)

insert into Coursedetails values('DN003','DotNet','2018-02-01','2018-02-28',15000),
('DV004','Data Visualization','2018-03-01','2018-04-15',15000),
('JA002','Advanced Java','2018-01-02','2018-01-20',10000),
('JC001','Core Java','2018-01-02','2018-01-12',3000)

insert into CourseRegistration values(2,'DN003','FN'),
(3,'DV004','AN'),
(4,'JA002','FN'),
(2,'JA002','AN'),
(5,'JC001','FN')

select * from Coursedetails
select * from CourseRegistration

--[8] Retrieve the CourseName and the number of student registered for each course 
--between 2018-01-02 and 2018-02-28 and arrange the result by courseid in descending order.
select cr.Cid,cd.C_Name,count(cr.Cid) as 'No of Students' 
from Coursedetails cd join CourseRegistration cr
on cd.C_ID=cr.Cid
where Start_date between '2018-01-02' and '2018-02-28'
group by cd.C_Name,cr.Cid
order by cr.Cid desc


create table Customer1(customer_id int primary key,
first_name varchar(30),
last_name varchar(30)
)

create table Order1(order_id int primary key,
order_date date,
amount float,
customer_id int
)

insert into Customer1 values(1,'George','Washington'),
(2,'John','Adams'),
(3,'Thomas','Jefferson'),
(4,'James','Madison'),
(5,'James','Mpnroe')

insert into Order1 values(1,'1776-07-04',234.56,1),
(2,'1760-03-14',78.50,3),
(3,'1784-05-23',124.00,2),
(4,'1790-09-03',65.50,3),
(5,'1795-07-21',25.50,10),
(6,'1787-11-27',14.40,9)

select * from Customer1
select * from Order1

--[9] Display the Firstname and LastName of the customer who have placed exactly 2 orders.select c.first_name,c.last_name from Customer1 c
where c.customer_id in
	(select o.customer_id from Order1 o group by customer_id having count(o.customer_id)=2)


select * from Studentdetails
--[10] Display all the student name in reverse order and Capitalize all the character in location
select REVERSE(Name) as 'Reverse order Student Name',UPPER(Location) as 'Location in UpperCase'
from Studentdetails


create table Product(Id int primary key,
ProductName varchar(30),
SupplierId int,
UnitPrice int,
Package varchar(20),
IsDiscontinued varchar(5)
)
create table OrderItem(Id int primary key,
OrderId int,
ProductId int,
UnitPrice int,
Quantity int
)
create table Order11(Id int primary key,
OrderDate date,
OrderNumber int,
CustomerId int,
TotalAmount int
)

--[11] Create a view table to display the ProductName,ordered Quantity and OrderNumber 
--from the above relations
create view OrderDetails 
as select 
p.ProductName,ot.Quantity,o.OrderNumber from Product p,OrderItem ot,Order11 o

select * from OrderDetails
sp_help OrderDetails

select * from Studentdetails
select * from Coursedetails
select * from CourseRegistration
--[12] Display the Course Name registered by student Nisha
select C_Name as 'Course Name' from Coursedetails 
where C_ID in
	(select Cid from CourseRegistration 
	where RegisterNo in
		(select RegisterNo from Studentdetails where Name='Nisha')
	)