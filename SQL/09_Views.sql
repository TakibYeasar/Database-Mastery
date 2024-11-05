
### 1. **Creating a View**

--In this example, we create a view that combines employee names with their corresponding department names.



-- Create a view that shows employee names and their department names
CREATE VIEW EmployeeDepartmentView AS
SELECT 
    e.EmployeeID, 
    e.Name AS EmployeeName, 
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;

### 2. **Querying a View**

--You can select data from the view just like you would from a regular table.



-- Retrieve all records from the EmployeeDepartmentView
SELECT * FROM EmployeeDepartmentView;

### 3. **Filtering Data from a View**

--You can also filter the results from the view. 


-- Get employees from a specific department
SELECT * 
FROM EmployeeDepartmentView
WHERE DepartmentName = 'Sales';

### 4. **Updating Data through a View**

--If the view is updatable, you can perform updates on it. Here’s an example of updating an employee’s name.



-- Update an employee's name through the view (if it's updatable)
UPDATE EmployeeDepartmentView
SET EmployeeName = 'John Doe'
WHERE EmployeeID = 1;

### 5. **Dropping a View**

If you no longer need the view, you can drop it. 


-- Remove the view when it's no longer needed
DROP VIEW EmployeeDepartmentView;

### 6. **Creating a Materialized View (if supported)**

--In databases that support materialized views, you can create one to store the result set physically.



-- Create a materialized view for faster access to summary data
CREATE MATERIALIZED VIEW DepartmentSummary AS
SELECT 
    d.DepartmentName, 
    COUNT(e.EmployeeID) AS EmployeeCount,
    AVG(e.Salary) AS AverageSalary
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY 
    d.DepartmentName;

### 7. **Refreshing a Materialized View**

--To update a materialized view with the latest data, you may need to refresh it.



-- Refresh the materialized view to update it with the latest data
REFRESH MATERIALIZED VIEW DepartmentSummary;

### 8. **Querying a Materialized View**

--Similar to regular views, you can query a materialized view as well. 


-- Retrieve data from the materialized view
SELECT * FROM DepartmentSummary;

