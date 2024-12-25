CREATE DATABASE Company_ABC;
USE Company_ABC;
CREATE TABLE manager(
  manager_id VARCHAR(10) NOT NULL,
  manager_name VARCHAR(100), city VARCHAR(10),
  PRIMARY KEY (manager_id)
  );
   DESC manager;
    SELECT * FROM manager;
    INSERT INTO manager(manager_id,
  manager_name, city) VALUES ("M101","Ajay","pune");
 INSERT INTO manager(manager_id,manager_name, city)  
 VALUES ("M102","Amit","Mumbai");
INSERT INTO manager(manager_id,manager_name, city)  
 VALUES ("M103","Sandeep","Banglore");
 INSERT INTO manager(manager_id,manager_name, city) 
 VALUES ("M104","Prakhar","Pune");
INSERT INTO manager(manager_id,manager_name, city) 
 VALUES ("M105","Jaydeep","Indore");
  INSERT INTO manager(manager_id,manager_name, city) 
 VALUES ("M106","Shubham","Banglore");
 
 
 CREATE TABLE Department(
  dept_id VARCHAR(10) NOT NULL,
  dept_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (dept_id )
  );
  DESC Department;
  SELECT * FROM Department;
INSERT INTO Department (dept_id,dept_name) VALUES ("1","Admin");
INSERT INTO Department (dept_id,dept_name) VALUES ("2","HR");
INSERT INTO Department (dept_id,dept_name) VALUES ("3","Developer");
INSERT INTO Department (dept_id,dept_name) VALUES ("4","Tester");
INSERT INTO Department (dept_id,dept_name) VALUES ("5","Accounts");

CREATE TABLE employee(
  emp_id VARCHAR(10) NOT NULL,
  employee_name VARCHAR(50),
  salary INT,
  city VARCHAR(50),
  dept_id VARCHAR(10),
  manager_id VARCHAR(10),
  PRIMARY KEY(emp_id),
  FOREIGN KEY(dept_id) REFERENCES department(dept_id),
  FOREIGN KEY(manager_id) REFERENCES manager(manager_id)
);
DESC employee;
INSERT INTO employee (emp_id,employee_name,salary,city,dept_id,manager_id) 
VALUES("1","karan",300000,"mumbai",2,"M102");
INSERT INTO employee (emp_id,employee_name,salary,city,dept_id,manager_id) 
VALUES("2","Rohit",75000,"Banglore",1,"M106");
INSERT INTO employee (emp_id,employee_name,salary,city,dept_id,manager_id) 
VALUES("3","Ankush",35000,"Ahemdabad",5,"M105");
INSERT INTO employee (emp_id,employee_name,salary,city,dept_id,manager_id) 
VALUES("4","Priyanshi",500000,"Kolkata",3,"M102");
INSERT INTO employee (emp_id,employee_name,salary,city,dept_id,manager_id) 
VALUES("5","Sanket",100000,"pune",3,"M101");
 INSERT INTO employee (emp_id,employee_name,salary,city,dept_id,manager_id) 
VALUES("6","shruti",80000,"indore",4,"M105");
INSERT INTO employee (emp_id,employee_name,salary,city,dept_id,manager_id) 
VALUES("7","jayaraj",75000,"bhopal",2,"M103");
INSERT INTO employee (emp_id,employee_name,salary,city,dept_id,manager_id) 
VALUES("8","Dilip",66000,"Mumbai",3,"M102");
INSERT INTO employee (emp_id,employee_name,salary,city,dept_id,manager_id) 
VALUES ("9","Geet",17000,"Mumbai",2,"M101");
SELECT * FROM employee;

-- 1)	Write a SQL query to find the name of the department where more than two employees are working.

SELECT Department.dept_name
FROM Department
JOIN Employee ON Department.dept_ID = Employee.dept_ID
GROUP BY Department.dept_ID,Department.dept_name
HAVING COUNT( Employee.dept_ID) >= 2;

-- 2)	Write SQL query to calculate the average salary of each department which is higher than 150000. Find department name also in descending order.

SELECT 
    department.dept_name,employee.dept_id, 
    AVG(employee.salary) AS avg_salary
FROM 
    employee employee
JOIN 
    department department
ON 
    employee.dept_id = department.dept_id
GROUP BY 
    employee.dept_id, department.dept_name
HAVING 
    AVG(employee.salary) >= 150000
ORDER BY 
    avg_salary DESC;
    
-- 3)  Write a SQL query to find the manager and employee who belongs to same city.
SELECT 
    employee.emp_id AS Employee_ID,
    employee.employee_name AS Employee_Name,
    employee.city AS Employee_City,
    manager.manager_id AS Manager_ID,
    manager.manager_name AS Manager_Name,
    manager.city AS Manager_City
FROM 
    employee  employee
JOIN 
    manager manager
ON 
     employee.manager_id = manager.manager_id
WHERE 
     employee.city = manager.city;
    
 -- 4)	Write a SQL query to find those employee whose salary exist between 35000 and 90000 with the department and manger name.   
    
    SELECT 
    employee.emp_id AS Employee_ID,
    employee.employee_name AS Employee_Name,
    employee.salary AS Salary,
    Department.dept_name AS Department_Name,
    Manager.manager_name AS Manager_Name
FROM 
    employee employee
JOIN 
    Department department ON employee.dept_id =  Department.dept_id
JOIN 
    manager manager ON employee.manager_id = manager.manager_id
WHERE 
    employee.salary >= 35000 AND employee.salary <= 90000;
    
    
    
    