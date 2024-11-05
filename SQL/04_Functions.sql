

--- ### 1. **Aggregate Functions**

-- Calculate the total number of employees
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- Calculate the average salary of employees
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- Find the maximum and minimum salary
SELECT MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary FROM Employees;

-- Calculate the total sales for a particular month
SELECT SUM(SaleAmount) AS TotalSales FROM Sales WHERE SaleDate BETWEEN '2024-11-01' AND '2024-11-30';


--- ### 2. **String Functions**

-- Convert names to uppercase
SELECT UPPER(Name) AS UppercaseName FROM Employees;

-- Concatenate first and last name
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Employees;

-- Find the length of each employee's name
SELECT Name, LENGTH(Name) AS NameLength FROM Employees;

-- Extract the first 3 characters of a department name
SELECT SUBSTRING(Department, 1, 3) AS DepartmentCode FROM Employees;

-- Replace occurrences of 'Manager' with 'Lead' in job titles
SELECT REPLACE(JobTitle, 'Manager', 'Lead') AS NewJobTitle FROM Employees;


--- ### 3. **Date and Time Functions**

-- Get the current date and time
SELECT NOW() AS CurrentDateTime;

-- Calculate age based on birth date (using CURDATE for current date)
SELECT Name, YEAR(CURDATE()) - YEAR(BirthDate) AS Age FROM Employees;

-- Extract year, month, and day from a hire date
SELECT HireDate, YEAR(HireDate) AS Year, MONTH(HireDate) AS Month, DAY(HireDate) AS Day FROM Employees;

-- Find the number of days between two dates
SELECT DATEDIFF('2024-12-31', '2024-01-01') AS DaysDifference;

-- Add 10 days to a specific date
SELECT DATE_ADD('2024-11-01', INTERVAL 10 DAY) AS NewDate;


--- ### 4. **Mathematical Functions**

-- Round the salary to 2 decimal places
SELECT Name, ROUND(Salary, 2) AS RoundedSalary FROM Employees;

-- Get the absolute value of a change in sales (useful for comparisons)
SELECT SaleID, ABS(SaleChange) AS AbsoluteSaleChange FROM Sales;

-- Calculate the square root of an employee’s salary
SELECT Name, Salary, SQRT(Salary) AS SalarySqrt FROM Employees;

-- Find the remainder when dividing salary by 5
SELECT Name, MOD(Salary, 5) AS Remainder FROM Employees;

-- Raise a number (e.g., salary) to the power of 2
SELECT Name, POWER(Salary, 2) AS SalarySquared FROM Employees;


--- ### 5. **Conditional Functions**

-- Categorize employees based on their salary range
SELECT 
    Name,
    CASE 
        WHEN Salary > 70000 THEN 'High'
        WHEN Salary BETWEEN 50000 AND 70000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;

-- Use IF() function (specific to MySQL) to check if an employee is active
SELECT Name, IF(IsActive = 1, 'Active', 'Inactive') AS Status FROM Employees;


--- ### 6. **JSON Functions** (PostgreSQL or MySQL)

-- Retrieve a specific value from JSON data (theme preference)
SELECT UserName, Preferences->>'theme' AS Theme FROM Users;

-- Update a nested JSON field (e.g., set SMS notifications to true)
UPDATE Users 
SET Preferences = JSON_SET(Preferences, '$.notifications.sms', true)
WHERE UserID = 1;


--- ### 7. **Window Functions** (for ranking or cumulative calculations)

-- Rank employees within their department based on salary
SELECT 
    Name, 
    Department,
    Salary,
    RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank
FROM Employees;

-- Calculate the cumulative total of sales by date
SELECT 
    SaleDate, 
    SaleAmount,
    SUM(SaleAmount) OVER(ORDER BY SaleDate) AS CumulativeSales
FROM Sales;


