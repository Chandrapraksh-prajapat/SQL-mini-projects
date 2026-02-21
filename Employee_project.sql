create database Employees;
use employees;

Create table Employee(
	emp_id int primary key ,
    name varchar(20),
    department varchar(30),
    salary int,
    city varchar(20)
    );
    
CREATE TABLE attendance (
    att_id INT PRIMARY KEY,
    emp_id INT,
    date DATE,
    status VARCHAR(10),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    emp_id INT,
    project_name VARCHAR(50),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);


INSERT INTO employee VALUES
	(1,'Rahul','IT',50000,'Jaipur'),
	(2,'Amit','HR',40000,'Delhi'),
	(3,'Neha','IT',55000,'Jaipur'),
	(4,'Priya','Finance',45000,'Mumbai'),
	(5,'Karan','HR',38000,'Delhi');

select * from employee;

insert into attendance values
	(1, 1, '2025-02-01', 'Present'),  
	(2, 1, '2025-02-02', 'Absent'),  
	(3, 2, '2025-02-01', 'Present'),  
	(4, 3, '2025-02-01', 'Present'),  
	(5, 3, '2025-02-02', 'Present'),  
	(6, 4, '2025-02-01', 'Absent'),  
	(7, 5, '2025-02-01', 'Present'),  
	(8, 5, '2025-02-02', 'Present');
    
select * from attendance;  -- check data 

INSERT INTO projects VALUES
(101,1,'Website Development'),
(102,2,'Recruitment System'),
(103,3,'Data Analysis'),
(104,4,'Budget Planning'),
(105,5,'Employee Portal');

select * from projects;   --  check data
    
    
-- Task 1- Display all employees along with their project names.

select e.name, p.project_name from employee as e 
	join projects as p 
     on e.emp_id = p.emp_id;

-- Task 2- Find the employees whose salary is greater than the average salary of all employees.

select * from employee;

select name, salary from employee 
	where salary > (select avg(salary) from employee);

-- Task 3- Show total attendance records for each employee.

select name, count(att_id) as Attendance_count from employee as e 
	join attendance as a 
		on e.emp_id=a.emp_id
			group by name;
     
-- Task 4- Display the employees who were absent at least once.

select distinct name  from employee as e 
	join attendance as a 
		on e.emp_id=a.emp_id
         where a.status='Absent';
         
-- Task 5- Calculate the total salary for each department.

select department, sum(salary) as Total_salary from employee 
group by department;


-- Task 6- Create an INDEX on emp_id in the attendance table.

CREATE INDEX idx_emp ON attendance(emp_id);
