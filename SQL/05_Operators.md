In SQL, operators are symbols or keywords that perform operations on data values within queries. These operators are divided into several categories based on the type of operation they perform:

---

### 1. **Arithmetic Operators**
Arithmetic operators are used to perform basic mathematical operations on numeric data.

- `+` (Addition): Adds two values.
    ```sql
    SELECT Salary + Bonus AS TotalCompensation FROM Employees;
    ```

- `-` (Subtraction): Subtracts one value from another.
    ```sql
    SELECT Price - Discount AS FinalPrice FROM Products;
    ```

- `*` (Multiplication): Multiplies two values.
    ```sql
    SELECT Quantity * UnitPrice AS TotalCost FROM Orders;
    ```

- `/` (Division): Divides one value by another.
    ```sql
    SELECT Sales / Target AS PerformanceRatio FROM SalesData;
    ```

- `%` (Modulo): Returns the remainder of a division operation.
    ```sql
    SELECT EmployeeID, Salary % 1000 AS SalaryRemainder FROM Employees;
    ```

---

### 2. **Comparison Operators**
Comparison operators are used to compare two values and return a Boolean result (TRUE or FALSE).

- `=` (Equal to): Checks if two values are equal.
    ```sql
    SELECT * FROM Employees WHERE DepartmentID = 5;
    ```

- `!=` or `<>` (Not equal to): Checks if two values are not equal.
    ```sql
    SELECT * FROM Employees WHERE DepartmentID <> 5;
    ```

- `>` (Greater than): Checks if the left value is greater than the right value.
    ```sql
    SELECT * FROM Employees WHERE Salary > 50000;
    ```

- `<` (Less than): Checks if the left value is less than the right value.
    ```sql
    SELECT * FROM Employees WHERE Age < 30;
    ```

- `>=` (Greater than or equal to): Checks if the left value is greater than or equal to the right value.
    ```sql
    SELECT * FROM Employees WHERE Experience >= 5;
    ```

- `<=` (Less than or equal to): Checks if the left value is less than or equal to the right value.
    ```sql
    SELECT * FROM Employees WHERE Salary <= 60000;
    ```

---

### 3. **Logical Operators**
Logical operators are used to combine multiple conditions in a query.

- `AND`: Returns TRUE if both conditions are true.
    ```sql
    SELECT * FROM Employees WHERE Department = 'Sales' AND Salary > 50000;
    ```

- `OR`: Returns TRUE if either condition is true.
    ```sql
    SELECT * FROM Employees WHERE Department = 'Sales' OR Salary > 50000;
    ```

- `NOT`: Returns TRUE if the condition is false.
    ```sql
    SELECT * FROM Employees WHERE NOT Department = 'Sales';
    ```

---

### 4. **Bitwise Operators**
Bitwise operators perform bit-level operations on binary numbers. They are less commonly used in SQL.

- `&` (Bitwise AND): Performs a bitwise AND between two integers.
- `|` (Bitwise OR): Performs a bitwise OR between two integers.
- `^` (Bitwise XOR): Performs a bitwise XOR between two integers.
- `~` (Bitwise NOT): Inverts all bits of an integer.
  
---

### 5. **Set Operators**
Set operators are used to combine the results of two or more SELECT queries.

- `UNION`: Combines results from two queries, removing duplicates.
    ```sql
    SELECT Name FROM Employees
    UNION
    SELECT Name FROM Clients;
    ```

- `UNION ALL`: Combines results from two queries, including duplicates.
    ```sql
    SELECT Name FROM Employees
    UNION ALL
    SELECT Name FROM Clients;
    ```

- `INTERSECT`: Returns common rows between two queries (only some SQL dialects).
    ```sql
    SELECT Name FROM Employees
    INTERSECT
    SELECT Name FROM Clients;
    ```

- `EXCEPT`: Returns rows from the first query that are not in the second query (only some SQL dialects).
    ```sql
    SELECT Name FROM Employees
    EXCEPT
    SELECT Name FROM Clients;
    ```

---

### 6. **Special Operators**

- `BETWEEN`: Checks if a value is within a specified range.
    ```sql
    SELECT * FROM Products WHERE Price BETWEEN 10 AND 50;
    ```

- `IN`: Checks if a value matches any value in a list.
    ```sql
    SELECT * FROM Employees WHERE DepartmentID IN (3, 4, 5);
    ```

- `LIKE`: Used with wildcard characters to search for a specified pattern in a column.
    - `%` (percent sign): Represents zero or more characters.
    - `_` (underscore): Represents a single character.
    ```sql
    SELECT * FROM Employees WHERE Name LIKE 'J%';
    ```

- `IS NULL` / `IS NOT NULL`: Checks if a value is NULL or not.
    ```sql
    SELECT * FROM Employees WHERE ManagerID IS NULL;
    ```

---

### 7. **Assignment Operator**

- `=` (Equals): Used to assign a value to a column in `UPDATE` or `SET` statements.
    ```sql
    UPDATE Employees SET Salary = Salary * 1.10 WHERE DepartmentID = 2;
    ```

---

Each of these operators provides essential tools for manipulating and retrieving data in SQL, allowing for flexible and complex queries to be constructed for various types of operations.

