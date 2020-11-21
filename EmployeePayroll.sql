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

--UC5 Ability to retrieve salary data for a particular employee as well as all employees who have joined in a particular data range from the payroll service database
SELECT Salary 
FROM Employee_Payroll
WHERE EmpName = 'Bill';

SELECT * 
FROM Employee_Payroll
WHERE Start_Date between cast('2019-01-01' AS DATE) and SYSDATETIME();

--UC6 Ability to add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender
ALTER TABLE Employee_Payroll Add Gender char(1);
UPDATE Employee_Payroll SET Gender='F' where EmpId=1;
UPDATE Employee_Payroll SET Gender='M' where EmpId=2;
UPDATE Employee_Payroll SET Gender='F' where EmpId=3;
UPDATE Employee_Payroll SET Gender='M' where EmpId=4;
UPDATE Employee_Payroll SET Gender='M' where EmpId=5;

--UC7 Ability to find sum, average, min, max and number of male and female employees
SELECT SUM(Salary) from Employee_Payroll where Gender='F' group by Gender;
SELECT SUM(Salary) from Employee_Payroll where Gender='M' group by Gender;

SELECT AVG(Salary) from Employee_Payroll where Gender='F' group by Gender;
SELECT AVG(Salary) from Employee_Payroll where Gender='M' group by Gender;

SELECT MIN(Salary) from Employee_Payroll where Gender='F' group by Gender;
SELECT MIN(Salary) from Employee_Payroll where Gender='M' group by Gender;

SELECT MAX(Salary) from Employee_Payroll where Gender='F' group by Gender;
SELECT MAX(Salary) from Employee_Payroll where Gender='M' group by Gender;

SELECT Count(Salary) from Employee_Payroll where Gender='F' group by Gender;
SELECT Count(Salary) from Employee_Payroll where Gender='M' group by Gender;

--UC8 Ability to extend Employee_Payroll data to store employee information like employee phone, address and department
ALTER TABLE Employee_Payroll Add Phone_Number numeric(10),Employee_Address varchar(50) null default 'India',Department varchar(20) default 'Tester';

UPDATE Employee_Payroll set Phone_Number=9876543212, Employee_Address='Pune',Department='Research' where EmpId=1;
UPDATE Employee_Payroll set Phone_Number=9876543245, Employee_Address='Thane',Department='Testing' where EmpId=2;
UPDATE Employee_Payroll set Phone_Number=9876743212, Employee_Address='Mumbai',Department='Development' where EmpId=3;
UPDATE Employee_Payroll set Phone_Number=9126543212, Employee_Address='Nagpur',Department='Sales' where EmpId=4;
UPDATE Employee_Payroll set Phone_Number=9076543212, Employee_Address='Banglore',Department='Analysis' where EmpId=5;

--UC9 Ability to extend Employee_Payroll table to have Basic Pay,Deductions,Taxable Pay,Income Tax,Net Pay
ALTER TABLE Employee_Payroll Add Basic_Pay money null default 0,Deductions money null default 0,Taxable_Pay money null default 0,Income_Tax money null default 0,Net_Pay money null default 0;

--UC10 Ability to make Terisa as part of Sales and Marketing Department
UPDATE Employee_Payroll set Basic_Pay=48652,Deductions=24785,Taxable_Pay=12874,Income_Tax=18712,Net_Pay=587542 where EmpId=1;
UPDATE Employee_Payroll set Basic_Pay=57172,Deductions=12854,Taxable_Pay=26589,Income_Tax=23987,Net_Pay=698745 where EmpId=2;
UPDATE Employee_Payroll set Basic_Pay=84572,Deductions=11651,Taxable_Pay=18547,Income_Tax=21854,Net_Pay=732594 where EmpId=3;
UPDATE Employee_Payroll set Basic_Pay=47885,Deductions=13587,Taxable_Pay=15698,Income_Tax=14732,Net_Pay=557964 where EmpId=4;
UPDATE Employee_Payroll set Basic_Pay=32594,Deductions=22287,Taxable_Pay=18569,Income_Tax=14987,Net_Pay=387532 where EmpId=5;

INSERT INTO Employee_Payroll
(EmpName, Salary, Start_Date, Gender, Phone_Number, Employee_Address, Department, Basic_Pay, Deductions, Taxable_Pay, Income_Tax, Net_Pay) 
VALUES('Terisa', 450000, '2018-01-03', 'F', 9054731953, 'Mumbai', 'Marketing', 30000,10000,20000,50000,15000);

SELECT * FROM Employee_Payroll;

SELECT * FROM Employee_Payroll
WHERE EmpName='Terisa';

--UC11 Draw the ER Diagram for Payroll Service DB

--UC12 Implement the ER Diagram into Payroll Service DB
--Create Employee Table with EmpId as Primary Key
CREATE TABLE Employee(
EmpId INT PRIMARY KEY IDENTITY(1,1),
EmpName VARCHAR(20) NOT NULL,
Employee_Address VARCHAR(50) NOT NULL,
Gender VARCHAR(1) NOT NULL,
Phone_Number NUMERIC(10) UNIQUE
);

--Create Department Table with DeptId as Primary Key and EmpiId as Foreign Key
CREATE TABLE Department(
EmpId int,
DeptId INT PRIMARY KEY IDENTITY(101,1),
DeptName VARCHAR(20) NOT NULL,
DeptLocation VARCHAR(50) NOT NULL,
FOREIGN KEY (EmpId) REFERENCES Employee(EmpId)
);

--Create Salary Table with SalaryId as Primary Key and EmpiId as Foreign Key
CREATE TABLE Salary(
EmpId int,
SalaryId INT PRIMARY KEY IDENTITY(1,1),
Salary MONEY NOT NULL,
Basic_Pay MONEY NOT NULL,
Deductions MONEY NOT NULL,
Taxable_Pay MONEY NOT NULL,
Income_Tax MONEY NOT NULL,
Net_Pay MONEY NOT NULL,
FOREIGN KEY (EmpId) REFERENCES Employee(EmpId)
);
