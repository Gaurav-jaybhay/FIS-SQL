 --Gaurav Jaybhay
 --FIS
 --Day 3
 
 --Note: Consider the EMP and DEPT tables for the following queries. 

 select * from tblDEPT
 select * from tblEMP

--1. Retrieve a list of MANAGERS. 
select * from tblEMP where job='MANAGER'

--2. Find out the names and salaries of all employees earning more than 1000 per month. 
select ename,sal 'Salary' from tblEMP where sal>1000

--3. Display the names and salaries of all employees except JAMES. 
select ename,sal 'Salary' from tblEMP where ename<>'JAMES'

--4. Find out the details of employees whose names begin with ‘S’. 
select * from tblEMP where ename like 'S%'

--5. Find out the names of all employees that have ‘A’ anywhere in their name. 
select ename as 'Names' from tblEMP where ename like '%A%'

--6. Find out the names of all employees that have ‘L’ as their third character in their name.
select ename as 'Names' from tblEMP where ename like '__L%'

--7. Compute daily salary of JONES. 
select ename,(sal/30) as 'Daily Salary' from tblEMP where ename='JONES'

--8. Calculate the total monthly salary of all employees. 
select sum(sal) as 'Total Monthly Salary' from tblEMP

--9. Print the average annual salary . 
select avg(sal) as 'Average Annual Salary' from tblEMP

--10. Select the name, job, salary, department number of all employees except 
--SALESMAN from department number 30. 
select ename,job,sal,deptno from tblEMP where job<>'SALESMAN' and deptno!=30

--11. List unique departments of the EMP table. 
select distinct(deptno) from tblEMP

--12. List the name and salary of employees who earn more than 1500 and are in department 10 
--or 30. Label the columns Employee and Monthly Salary respectively.
select ename as 'Employee',sal as 'Monthly Salary' from tblEMP where sal > 1500 
and deptno in(10,30)

--13. Display the name, job, and salary of all the employees whose job is MANAGER or 
--ANALYST and their salary is not equal to 1000, 3000, or 5000. 
select ename as 'Employee',job,sal as 'Salary' from tblEMP 
where job in('MANAGER','ANALYST') 
and sal not in(1000,3000,5000)

--14. Display the name, salary and commission for all employees whose commission 
--amount is greater than their salary increased by 10%. 
select ename as 'Employee',sal as 'Salary',comm as 'Commission' from tblEMP
where comm > (sal*0.1)

--15. Display the name of all employees who have two Ls in their name and are in 
--department 30 or their manager is 7782. 
select * from tblEMP where ename like '%LL%' and deptno = 30 and mgr_id=7782

--NO matching data in table for above query if we give deptno=10 then we can get 
--one row as output
select * from tblEMP where ename like '%LL%' and deptno = 10 and mgr_id=7782

--output
--7934	MILLER	CLERK	7782	1982-01-23	1300	NULL	10

--16. Display the names of employees with experience of over 10 years and under 20 yrs.
 --Count the total number of employees. 
 select count(empno) as 'No of Employess' from tblEMP 
 where DATEDIFF(YEAR, hiredate, GETDATE()) between 10 and 20;

--17. Retrieve the names of departments in ascending order and their employees in 
--descending order.
select t1.dname,t2.ename from tblDEPT t1 join tblEMP t2 
on t1.deptno=t2.deptno
order by t1.dname asc,t2.ename desc

--18. Find out experience of MILLER. 
select ename,DATEDIFF(YEAR, hiredate, GETDATE()) as 'Experience in Year' from tblEMP
where ename='MILLER'