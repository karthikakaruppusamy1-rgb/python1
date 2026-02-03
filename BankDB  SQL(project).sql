-- ======================================================
--     BANK DATABASE MANAGEMENT SYSTEM PROJECT
-- ======================================================

-- Create Database
CREATE DATABASE BankDB;
USE BankDB;

-- ======================================================
-- 1. Branch Table
-- ======================================================
CREATE TABLE Branch (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(50),
    branch_city VARCHAR(50)
);

INSERT INTO Branch (branch_name, branch_city) VALUES
('Main Branch','Delhi'),('South Branch','Mumbai'),('East Branch','Kolkata'),
('West Branch','Pune'),('North Branch','Chennai');

SELECT * FROM Branch;

-- ======================================================
-- 2. Customer Table
-- ======================================================
CREATE TABLE Customer (
    cust_id INT PRIMARY KEY AUTO_INCREMENT,
    cust_name VARCHAR(50),
    phone VARCHAR(15),
    address VARCHAR(100),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

INSERT INTO Customer (cust_name, phone, address, branch_id) VALUES
('Amit Sharma','9876543210','Delhi',1),('Priya Singh','9876543211','Mumbai',2),
('Ravi Kumar','9876543212','Kolkata',3),('Sneha Patel','9876543213','Pune',4),
('Arjun Reddy','9876543214','Chennai',5),('Neha Gupta','9876543215','Delhi',1),
('Rohan Das','9876543216','Mumbai',2),('Meera Nair','9876543217','Kolkata',3),
('Vikram Joshi','9876543218','Pune',4),('Anjali Mehta','9876543219','Chennai',5),
('Deepak Rao','9876543220','Delhi',1),('Swati Agarwal','9876543221','Mumbai',2),
('Manish Yadav','9876543222','Kolkata',3),('Pooja Iyer','9876543223','Pune',4),
('Rahul Verma','9876543224','Chennai',5);

SELECT * FROM Customer;

-- ======================================================
-- 3. Account Table
-- ======================================================
CREATE TABLE Account (
    acc_id INT PRIMARY KEY AUTO_INCREMENT,
    acc_type VARCHAR(20),
    balance DECIMAL(12,2),
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
);

INSERT INTO Account (acc_type, balance, cust_id) VALUES
('Savings',20000,1),('Current',50000,2),('Savings',35000,3),
('Current',100000,4),('Savings',25000,5),('Savings',18000,6),
('Current',45000,7),('Savings',12000,8),('Current',60000,9),
('Savings',28000,10),('Current',90000,11),('Savings',15000,12),
('Current',40000,13),('Savings',27000,14),('Current',65000,15);

SELECT * FROM Account;

-- ======================================================
-- 4. Loan Table
-- ======================================================
CREATE TABLE Loan (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    cust_id INT,
    amount DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
);

INSERT INTO Loan (cust_id, amount, interest_rate) VALUES
(1,50000,7.5),(2,100000,8.2),(3,250000,9.1),(4,80000,7.8),(5,60000,8.0),
(6,90000,7.6),(7,40000,7.5),(8,120000,8.4),(9,50000,9.0),(10,150000,8.3),
(11,200000,8.5),(12,110000,7.9),(13,75000,8.1),(14,135000,8.4),(15,95000,7.7);

SELECT * FROM Loan;

-- ======================================================
-- 5. Employee Table
-- ======================================================
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    designation VARCHAR(50),
    salary DECIMAL(10,2),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

INSERT INTO Employee (emp_name, designation, salary, branch_id) VALUES
('Raj Verma','Manager',60000,1),('Sunita Rao','Clerk',30000,2),
('Vikram Singh','Cashier',25000,3),('Neha Patel','Assistant',28000,4),
('Deepak Kumar','Manager',62000,5);

SELECT * FROM Employee;

-- ======================================================
-- 6. Transactions Table
-- ======================================================
CREATE TABLE Transactions (
    trans_id INT PRIMARY KEY AUTO_INCREMENT,
    acc_id INT,
    trans_type VARCHAR(20),
    amount DECIMAL(10,2),
    trans_date DATE,
    FOREIGN KEY (acc_id) REFERENCES Account(acc_id)
);

INSERT INTO Transactions (acc_id, trans_type, amount, trans_date) VALUES
(1,'Deposit',5000,'2025-09-01'),(2,'Withdraw',2000,'2025-09-02'),
(3,'Deposit',3000,'2025-09-03'),(4,'Withdraw',4000,'2025-09-04'),
(5,'Deposit',6000,'2025-09-05'),(6,'Withdraw',1500,'2025-09-06'),
(7,'Deposit',2500,'2025-09-07'),(8,'Deposit',3000,'2025-09-08'),
(9,'Withdraw',5000,'2025-09-09'),(10,'Deposit',7000,'2025-09-10'),
(11,'Withdraw',8000,'2025-09-11'),(12,'Deposit',5500,'2025-09-12'),
(13,'Withdraw',3500,'2025-09-13'),(14,'Deposit',2700,'2025-09-14'),
(15,'Deposit',4500,'2025-09-15');

SELECT * FROM Transactions;

-- ======================================================
-- 7. ATM Table
-- ======================================================
CREATE TABLE ATM (
    atm_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(50),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

INSERT INTO ATM (location, branch_id) VALUES
('Delhi',1),('Mumbai',2),('Kolkata',3),('Pune',4),('Chennai',5);

SELECT * FROM ATM;

-- ======================================================
-- 8. Card Table
-- ======================================================
CREATE TABLE Card (
    card_id INT PRIMARY KEY AUTO_INCREMENT,
    card_type VARCHAR(20),
    acc_id INT,
    issue_date DATE,
    expiry_date DATE,
    FOREIGN KEY (acc_id) REFERENCES Account(acc_id)
);

INSERT INTO Card (card_type, acc_id, issue_date, expiry_date) VALUES
('Debit',1,'2024-01-01','2028-01-01'),('Credit',2,'2023-05-01','2027-05-01'),
('Debit',3,'2024-03-01','2028-03-01'),('Credit',4,'2024-02-01','2028-02-01'),
('Debit',5,'2023-07-01','2027-07-01'),('Credit',6,'2024-04-01','2028-04-01');

SELECT * FROM Card;

-- ======================================================
-- QUERIES SECTION
-- ======================================================

-- BASIC QUERIES
SELECT cust_name, phone FROM Customer;
SELECT * FROM Account WHERE balance > 30000;
SELECT * FROM Customer WHERE address LIKE '%Delhi%';
SELECT * FROM Transactions WHERE trans_type = 'Deposit';
SELECT * FROM Loan WHERE amount BETWEEN 50000 AND 150000;

-- JOINS
-- Show all customers with account type and balance
SELECT c.cust_name, a.acc_type, a.balance
FROM Customer c JOIN Account a ON c.cust_id = a.cust_id;

-- Display customers with their branch and manager
SELECT c.cust_name, b.branch_name, e.emp_name AS Manager
FROM Customer c JOIN Branch b ON c.branch_id=b.branch_id
JOIN Employee e ON e.branch_id=b.branch_id AND e.designation='Manager';

-- Show customers with their loan amount and interest rate
SELECT c.cust_name, l.amount, l.interest_rate
FROM Customer c JOIN Loan l ON c.cust_id = l.cust_id;

-- GROUP BY
-- a. Count customers per branch
SELECT b.branch_name, COUNT(c.cust_id) AS total_customers
FROM Customer c JOIN Branch b ON c.branch_id = b.branch_id
GROUP BY b.branch_name;

-- b. Total loan amount per interest rate
SELECT interest_rate, SUM(amount) AS total_amount
FROM Loan GROUP BY interest_rate;

-- HAVING
-- Show branches with more than 2 customers
SELECT b.branch_name, COUNT(c.cust_id) AS total_customers
FROM Customer c JOIN Branch b ON c.branch_id=b.branch_id
GROUP BY b.branch_name HAVING COUNT(c.cust_id)>2;

-- UNION
SELECT cust_name AS Name FROM Customer
UNION
SELECT emp_name AS Name FROM Employee;

-- CASE
SELECT acc_id, balance,
CASE 
    WHEN balance >= 50000 THEN 'High Balance'
    WHEN balance BETWEEN 20000 AND 49999 THEN 'Medium Balance'
    ELSE 'Low Balance'
END AS Balance_Status
FROM Account;

-- SUBQUERY
SELECT cust_name FROM Customer 
WHERE cust_id IN (SELECT cust_id FROM Loan WHERE amount > 100000);

-- VIEW
CREATE VIEW CustomerLoanView AS
SELECT c.cust_name, l.amount, l.interest_rate
FROM Customer c JOIN Loan l ON c.cust_id = l.cust_id;
SELECT * FROM CustomerLoanView;

-- STORED PROCEDURE
DELIMITER $$
CREATE PROCEDURE GetCustomerDetails(IN branchName VARCHAR(50))
BEGIN
    SELECT c.cust_name, a.acc_type, a.balance, b.branch_name
    FROM Customer c 
    JOIN Account a ON c.cust_id = a.cust_id
    JOIN Branch b ON c.branch_id = b.branch_id
    WHERE b.branch_name = branchName;
END $$
DELIMITER ;

-- Execute Stored Procedure Example
CALL GetCustomerDetails('Main Branch');
