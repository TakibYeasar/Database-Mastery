-- Create tables
CREATE TABLE Department (
    DeptID SERIAL PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    EmpID SERIAL PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL,
    EmpDeptID INT,
    FOREIGN KEY (EmpDeptID) REFERENCES Department (DeptID) ON DELETE SET NULL
);

-- Display a list of all tables
-- PostgreSQL:
SELECT table_name
FROM information_schema.tables
WHERE
    table_schema = 'public';

-- MySQL:
SHOW TABLES;

-- Display the columns of a table
-- PostgreSQL:
SELECT column_name, data_type
FROM information_schema.columns
WHERE
    table_name = 'department';

-- MySQL:
SHOW COLUMNS FROM Department;

-- Describe the structure of a table
-- PostgreSQL:
SELECT
    column_name,
    data_type,
    character_maximum_length
FROM information_schema.columns
WHERE
    table_name = 'employee';

-- MySQL:
DESC Employee;

-- Insert data
INSERT INTO Department (DeptName) VALUES ('Engineering');

INSERT INTO Department (DeptName) VALUES ('Sales');

INSERT INTO Employee (EmpName, EmpDeptID) VALUES ('John Doe', 1);

INSERT INTO Employee (EmpName, EmpDeptID) VALUES ('Jane Smith', 2);

-- Select data from tables
SELECT * FROM Department;

SELECT * FROM Employee;

-- Delete a table
DROP TABLE IF EXISTS Employee;

