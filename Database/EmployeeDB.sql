-- ===============================
-- Create Database
-- ===============================
CREATE DATABASE Employee;
GO

USE Employee;
GO

-- ===============================
-- Manager Table
-- ===============================
CREATE TABLE Manager
(
    mid INT PRIMARY KEY IDENTITY(1,1),
    mname VARCHAR(100) NOT NULL
);
GO

-- ===============================
-- Employee Table
-- ===============================
CREATE TABLE emp
(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL,
    salary DECIMAL(9,2) NOT NULL,
    pf DECIMAL(9,2),
    netsal DECIMAL(9,2),
    ephoto VARCHAR(100),
    mid INT,
    CONSTRAINT FK_emp_Manager 
        FOREIGN KEY (mid) REFERENCES Manager(mid)
);
GO

-- ===============================
-- Candidate Applications Table
-- ===============================
CREATE TABLE CandidateApplications
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Stream VARCHAR(50),
    Type VARCHAR(20),
    Name VARCHAR(100),
    Contact VARCHAR(15),
    Email VARCHAR(100),
    CTC VARCHAR(20),
    ECTC VARCHAR(20),
    NoticePeriod VARCHAR(20),
    ResumePath VARCHAR(300),
    CreatedDate DATETIME DEFAULT GETDATE()
);
GO

-- ===============================
-- Stored Procedures
-- ===============================

-- Save Employee
CREATE PROCEDURE sp_SaveEmp
   @name VARCHAR(100),
   @salary DECIMAL(9,2),
   @ephoto VARCHAR(100),
   @mid INT
AS
BEGIN
     DECLARE @pfamt DECIMAL(9,2);
     DECLARE @NetSal DECIMAL(9,2);

     SET @pfamt = @salary * 0.1;
     SET @NetSal = @salary - @pfamt;

     INSERT INTO emp(name, salary, pf, netsal, ephoto, mid)
     VALUES (@name, @salary, @pfamt, @NetSal, @ephoto, @mid);
END
GO

-- Fetch Employees
CREATE PROCEDURE sp_fetchEmpList
AS
BEGIN
     SELECT * FROM emp;
END
GO

-- Delete Employee
CREATE PROCEDURE sp_DeleteEmp
    @id INT
AS
BEGIN
    DELETE FROM emp WHERE id = @id;
END
GO

-- Fetch Managers
CREATE PROCEDURE sp_FetchManagerList
AS
BEGIN
    SELECT * FROM Manager;
END
GO

-- ===============================
-- Sample Data (Optional)
-- ===============================

INSERT INTO Manager (mname)
VALUES 
('ITManager'),
('HRManager'),
('SalesManager'),
('AccountsManager');

INSERT INTO emp (name, salary, pf, netsal, ephoto, mid)
VALUES
('Rasika', 20000, 2000, 18000, 'Images/Graduation.jpeg', 3),
('Srushti', 25000, 2500, 22500, 'Images/error.jpg', 2),
('Sanika', 15000, 1500, 13500, 'Images/DSC_8099.jpg', 1);

INSERT INTO CandidateApplications 
(Stream, Type, Name, Contact, Email, ResumePath)
VALUES
('BSC IT', 'Fresher', 'Srushti Pawar', '9867352842', 
 'sanukadam22@gmail.com', 
 'Uploads/Resume.pdf');
GO