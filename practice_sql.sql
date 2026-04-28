-- ============================================
--   SQL PRACTICE DATABASE
--   Tables: Employees, Departments, Orders
-- ============================================

-- Step 1: Create and use a new database
CREATE DATABASE IF NOT EXISTS sql_practice;
USE sql_practice;

-- ============================================
--   TABLE 1: Departments
-- ============================================
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    dept_id     INT PRIMARY KEY,
    dept_name   VARCHAR(50),
    location    VARCHAR(50)
);

INSERT INTO Departments VALUES
(10, 'Engineering', 'Delhi'),
(20, 'HR',          'Mumbai'),
(30, 'Marketing',   'Delhi'),
(40, 'Finance',     'Bangalore'),
(50, 'Legal',       'Chennai');


-- ============================================
--   TABLE 2: Employees
-- ============================================
CREATE TABLE Employees (
    emp_id       INT PRIMARY KEY,
    name         VARCHAR(50),
    dept_id      INT,
    salary       INT,
    joining_date DATE,
    manager_id   INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Employees VALUES
(1, 'Alice', 10, 90000, '2020-03-15', NULL),
(2, 'Bob',   10, 75000, '2021-06-01', 1),
(3, 'Carol', 20, 60000, '2019-11-20', 4),
(4, 'Dave',  20, 80000, '2018-07-10', 1),
(5, 'Eve',   30, 55000, '2022-01-05', 4),
(6, 'Frank', 30, 55000, '2022-01-05', 4),
(7, 'Grace', 10, 95000, '2017-04-22', NULL),
(8, 'Hank',  40, 70000, '2023-09-01', 1);


-- ============================================
--   TABLE 3: Orders
-- ============================================
CREATE TABLE Orders (
    order_id   INT PRIMARY KEY,
    emp_id     INT,
    amount     INT,
    order_date DATE,
    status     VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

INSERT INTO Orders VALUES
(101, 1, 5000, '2024-01-10', 'delivered'),
(102, 2, 3000, '2024-01-11', 'pending'),
(103, 1, 7000, '2024-02-15', 'delivered'),
(104, 3, 2000, '2024-02-20', 'cancelled'),
(105, 5, 4500, '2024-03-01', 'delivered'),
(106, 2, 6000, '2024-03-15', 'delivered'),
(107, 8, 1500, '2024-03-20', 'pending'),
(108, 1, 8000, '2024-04-01', 'delivered'),
(109, 6, 3500, '2024-04-10', 'cancelled'),
(110, 4, 9000, '2024-04-25', 'delivered');


-- ============================================
--   VERIFY DATA
-- ============================================
SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT * FROM Orders;
