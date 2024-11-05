

--- ### 1. **Arithmetic Operators**

-- Adding two numeric values (calculating total compensation)
SELECT Name, Salary + Bonus AS TotalCompensation FROM Employees;

-- Subtracting a discount from the price to get the final price
SELECT ProductID, Price - Discount AS FinalPrice FROM Products;

-- Multiplying quantity and unit price to get total cost
SELECT OrderID, Quantity * UnitPrice AS TotalCost FROM Orders;

-- Dividing total sales by target to get performance ratio
SELECT EmployeeID, Sales / Target AS PerformanceRatio FROM SalesData;

-- Modulo operation to get remainder of salary when divided by 1000
SELECT EmployeeID, Salary % 1000 AS SalaryRemainder FROM Employees;

--- ### 2. **Comparison Operators**


-- Check if the department ID is equal to 5
SELECT * FROM Employees WHERE DepartmentID = 5;

-- Check if the department ID is not equal to 5
SELECT * FROM Employees WHERE DepartmentID <> 5;

-- Get employees with a salary greater than 50,000
SELECT * FROM Employees WHERE Salary > 50000;

-- Get employees who are younger than 30
SELECT * FROM Employees WHERE Age < 30;

-- Get employees with 5 or more years of experience
SELECT * FROM Employees WHERE Experience >= 5;

-- Get employees with a salary of 60,000 or less
SELECT * FROM Employees WHERE Salary <= 60000;

---

### 3. **Logical Operators**


-- Get employees in the Sales department with a salary greater than 50,000
SELECT * FROM Employees WHERE Department = 'Sales' AND Salary > 50000;

-- Get employees in either the Sales department or with a salary greater than 50,000
SELECT * FROM Employees WHERE Department = 'Sales' OR Salary > 50000;

-- Get employees not in the Sales department
SELECT * FROM Employees WHERE NOT Department = 'Sales';

---

### 4. **Bitwise Operators**

Assume we have integer values in columns `BitField1` and `BitField2`.



-- Bitwise AND
SELECT BitField1 & BitField2 AS BitwiseAndResult FROM BinaryData;

-- Bitwise OR
SELECT BitField1 | BitField2 AS BitwiseOrResult FROM BinaryData;

-- Bitwise XOR
SELECT BitField1 ^ BitField2 AS BitwiseXorResult FROM BinaryData;

-- Bitwise NOT
SELECT ~BitField1 AS BitwiseNotResult FROM BinaryData;

---

### 5. **Set Operators**

Assume we have two tables `Employees` and `Clients`, both with a `Name` column.



-- Combine employee and client names, removing duplicates
SELECT Name FROM Employees
UNION
SELECT Name FROM Clients;

-- Combine employee and client names, including duplicates
SELECT Name FROM Employees
UNION ALL
SELECT Name FROM Clients;

-- Find common names between employees and clients (if supported)
SELECT Name FROM Employees
INTERSECT
SELECT Name FROM Clients;

-- Find names that are in Employees but not in Clients (if supported)
SELECT Name FROM Employees
EXCEPT
SELECT Name FROM Clients;

---

### 6. **Special Operators**


-- Find products with prices between 10 and 50
SELECT * FROM Products WHERE Price BETWEEN 10 AND 50;

-- Find employees in specific departments (3, 4, and 5)
SELECT * FROM Employees WHERE DepartmentID IN (3, 4, 5);

-- Find employees with names starting with 'J'
SELECT * FROM Employees WHERE Name LIKE 'J%';

-- Find employees with names containing 'an'
SELECT * FROM Employees WHERE Name LIKE '%an%';

-- Find employees whose name has an 'M' in the second position
SELECT * FROM Employees WHERE Name LIKE '_M%';

-- Find employees with a NULL manager ID (indicating no manager assigned)
SELECT * FROM Employees WHERE ManagerID IS NULL;

-- Find employees with a non-NULL manager ID (indicating a manager is assigned)
SELECT * FROM Employees WHERE ManagerID IS NOT NULL;

---

### 7. **Assignment Operator**


-- Update the salary by 10% for employees in department 2
UPDATE Employees SET Salary = Salary * 1.10 WHERE DepartmentID = 2;

