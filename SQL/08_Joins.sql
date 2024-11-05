
### Sample Tables
--**Employees Table:**

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    ManagerID INT
);

INSERT INTO Employees (EmployeeID, Name, DepartmentID, ManagerID) VALUES
(1, 'Alice', 1, NULL),
(2, 'Bob', 1, 1),
(3, 'Charlie', 2, 1),
(4, 'David', NULL, 1),
(5, 'Eve', 3, 1);



--**Departments Table:**

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Marketing');


### 1. **INNER JOIN**

SELECT Employees.Name AS EmployeeName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

### 2. **LEFT JOIN**

SELECT Employees.Name AS EmployeeName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

### 3. **RIGHT JOIN**

SELECT Employees.Name AS EmployeeName, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

### 4. **FULL JOIN**

SELECT Employees.Name AS EmployeeName, Departments.DepartmentName
FROM Employees
FULL JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

### 5. **CROSS JOIN**

SELECT Employees.Name AS EmployeeName, Departments.DepartmentName
FROM Employees
CROSS JOIN Departments;

### 6. **SELF JOIN**

SELECT e1.Name AS EmployeeName, e2.Name AS ManagerName
FROM Employees e1
JOIN Employees e2 ON e1.ManagerID = e2.EmployeeID;

