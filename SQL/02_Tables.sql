
-- Create tables
CREATE TABLE Department (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    EmpName VARCHAR(100) NOT NULL,
    EmpDeptID INT,
    FOREIGN KEY (EmpDeptID) REFERENCES Department (DeptID)
);

-- Display a list of all tables
SHOW TABLES;

-- Display the columns of a table
SHOW COLUMNS FROM Department;

-- Display/Describe the structure of a table
DESC Employee;

-- Insert data
INSERT INTO Department (DeptName) VALUES ('Engineering');
INSERT INTO Department (DeptName) VALUES ('Sales');

INSERT INTO Employee (EmpName, EmpDeptID) VALUES ('John Doe', 1);
INSERT INTO Employee (EmpName, EmpDeptID) VALUES ('Jane Smith', 2);

-- Select data from database
SELECT * FROM Department;

SELECT * FROM Employee;

-- Delete a table
DROP TABLE Employee;




