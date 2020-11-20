--UC1 Ability to create a payroll service database
CREATE DATABASE Payroll_Service;
USE Payroll_Service;

--UC2 Ability to create a employee payroll table in the payroll service database to manage employee payrolls
CREATE TABLE Employee_Payroll(
EmpId INT PRIMARY KEY IDENTITY(1,1),
EmpName VARCHAR(20) NOT NULL,
Salary MONEY NOT NULL,
Start_Date DATE NOT NULL 
);

--UC3 Ability to create employee payroll data in the payroll service database as part of CURD Operation
INSERT INTO Employee_Payroll(EmpName,Salary,Start_Date)
VALUES('Apoorva',500000.00,'2020-09-12'),
	  ('Bill',350000.00,'2019-09-25'),
	  ('Terisa',400000.00,'2019-11-13'),
	  ('Mark',600000.00,'2020-05-21'),
	  ('Charlie',300000.00,'2018-03-07');

--UC4 Ability to retrieve all the employee payroll data that is added to payroll service database
SELECT * FROM Employee_Payroll;