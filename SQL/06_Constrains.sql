

--- ### 1. **PRIMARY KEY**
   -- Ensures each record in the `Employees` table has a unique identifier.

   
   CREATE TABLE Employees (
       EmployeeID INT PRIMARY KEY,
       Name VARCHAR(100) NOT NULL
   );

   -- Insert sample data
   INSERT INTO Employees (EmployeeID, Name) VALUES (1, 'Alice');
   INSERT INTO Employees (EmployeeID, Name) VALUES (2, 'Bob');
   

   **Operation**: Attempt to insert a duplicate `EmployeeID` will fail.
   
   INSERT INTO Employees (EmployeeID, Name) VALUES (1, 'Charlie');  -- Error: Duplicate entry
   

--- ### 2. **FOREIGN KEY**
   -- Links `Orders` table to `Employees` table, ensuring all `EmployeeID` values in `Orders` exist in `Employees`.

   
   CREATE TABLE Orders (
       OrderID INT PRIMARY KEY,
       EmployeeID INT,
       FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
   );

   -- Insert sample data
   INSERT INTO Orders (OrderID, EmployeeID) VALUES (1, 1);  -- Success: EmployeeID 1 exists
   INSERT INTO Orders (OrderID, EmployeeID) VALUES (2, 3);  -- Error: EmployeeID 3 does not exist
   

--- ### 3. **UNIQUE**
   -- Enforces that each email in the `Users` table is unique.

   
   CREATE TABLE Users (
       UserID INT PRIMARY KEY,
       Email VARCHAR(100) UNIQUE
   );

   -- Insert sample data
   INSERT INTO Users (UserID, Email) VALUES (1, 'alice@example.com');
   INSERT INTO Users (UserID, Email) VALUES (2, 'bob@example.com');
   INSERT INTO Users (UserID, Email) VALUES (3, 'alice@example.com');  -- Error: Duplicate email
   

--- ### 4. **NOT NULL**
   -- Ensures the `ProductName` column in the `Products` table cannot be `NULL`.

   
   CREATE TABLE Products (
       ProductID INT PRIMARY KEY,
       ProductName VARCHAR(100) NOT NULL
   );

   -- Insert sample data
   INSERT INTO Products (ProductID, ProductName) VALUES (1, 'Laptop');
   INSERT INTO Products (ProductID, ProductName) VALUES (2, NULL);  -- Error: ProductName cannot be NULL
   

--- ### 5. **CHECK**
   -- Restricts values in the `Age` column to be 18 or older.

   
   CREATE TABLE Employees (
       EmployeeID INT PRIMARY KEY,
       Name VARCHAR(100),
       Age INT CHECK (Age >= 18)
   );

   -- Insert sample data
   INSERT INTO Employees (EmployeeID, Name, Age) VALUES (1, 'Alice', 25);  -- Success
   INSERT INTO Employees (EmployeeID, Name, Age) VALUES (2, 'Bob', 16);    -- Error: Age must be 18 or above
   

--- ### 6. **DEFAULT**
   -- Sets a default value for `OrderDate` if no date is provided.

   
   CREATE TABLE Orders (
       OrderID INT PRIMARY KEY,
       ProductID INT,
       OrderDate DATE DEFAULT CURRENT_DATE
   );

   -- Insert sample data without specifying OrderDate
   INSERT INTO Orders (OrderID, ProductID) VALUES (1, 101);
   

   **Operation**: The `OrderDate` will be set to the current date if not provided explicitly.

--- ### 7. **INDEX**
   -- Creates an index on the `ProductName` column to improve query performance.

   
   CREATE TABLE Products (
       ProductID INT PRIMARY KEY,
       ProductName VARCHAR(100) NOT NULL
   );

   CREATE INDEX idx_product_name ON Products(ProductName);

   -- Query using the indexed column
   SELECT * FROM Products WHERE ProductName = 'Laptop';
   

   **Operation**: Using the index can improve search speed for `ProductName`.

--- ### 8. **AUTO_INCREMENT** (MySQL) / **IDENTITY** (SQL Server)
   -- Automatically generates unique values for `CustomerID` in `Customers`.

   
   CREATE TABLE Customers (
       CustomerID INT AUTO_INCREMENT PRIMARY KEY,
       CustomerName VARCHAR(100)
   );

   -- Insert data without specifying CustomerID
   INSERT INTO Customers (CustomerName) VALUES ('Alice');
   INSERT INTO Customers (CustomerName) VALUES ('Bob');
   

   **Operation**: The `CustomerID` is automatically incremented for each new row.

--- ### 9. **CASCADE** (ON DELETE / ON UPDATE)
   -- Deletes related rows in the `Orders` table when a corresponding row in `Employees` is deleted.

   
   CREATE TABLE Orders (
       OrderID INT PRIMARY KEY,
       EmployeeID INT,
       FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
   );

   -- Insert sample data
   INSERT INTO Employees (EmployeeID, Name) VALUES (1, 'Alice');
   INSERT INTO Orders (OrderID, EmployeeID) VALUES (1, 1);  -- Associated with EmployeeID 1

   -- Delete the employee
   DELETE FROM Employees WHERE EmployeeID = 1;  -- This will also delete the related row in Orders due to ON DELETE CASCADE
   

