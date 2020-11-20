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