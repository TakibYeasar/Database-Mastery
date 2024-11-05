

--- ### 1. **One-to-One Relationship**

-- In a one-to-one relationship, each row in one table is related to only one row in another table.
-- **Example**: Create a relationship between `Employees` and `EmployeeDetails`.

-- Table 1: Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50)
);

-- Table 2: EmployeeDetails (each employee has only one detail record)
CREATE TABLE EmployeeDetails (
    DetailID INT PRIMARY KEY,
    EmployeeID INT UNIQUE,  -- Unique constraint enforces one-to-one relationship
    Address VARCHAR(255),
    Phone VARCHAR(15),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Inserting records with a one-to-one relationship
INSERT INTO Employees (EmployeeID, Name, Position) VALUES (1, 'John Doe', 'Manager');
INSERT INTO EmployeeDetails (DetailID, EmployeeID, Address, Phone) VALUES (1, 1, '123 Main St', '555-1234');

--- ### 2. **One-to-Many Relationship**

--In a one-to-many relationship, a row in one table can be related to multiple rows in another table.


--**Example**: Create a relationship between `Departments` and `Employees` where each department has multiple employees, but each employee belongs to only one department.



-- Table 1: Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Table 2: Employees (many employees can belong to one department)
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Inserting records with a one-to-many relationship
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (1, 'Sales');
INSERT INTO Employees (EmployeeID, Name, Position, DepartmentID) VALUES (1, 'Jane Doe', 'Sales Representative', 1);
INSERT INTO Employees (EmployeeID, Name, Position, DepartmentID) VALUES (2, 'John Smith', 'Sales Manager', 1);

--- ### 3. **Many-to-Many Relationship**

--In a many-to-many relationship, rows in one table can relate to multiple rows in another table and vice versa. This is typically implemented through a junction table.


--**Example**: Create a relationship between `Students` and `Courses` where each student can enroll in multiple courses, and each course can have multiple students.



-- Table 1: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Table 2: Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

-- Junction Table: Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Inserting records with a many-to-many relationship
INSERT INTO Students (StudentID, Name) VALUES (1, 'Alice');
INSERT INTO Courses (CourseID, CourseName) VALUES (1, 'Mathematics');
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID) VALUES (1, 1, 1);

--- ### 4. **Self-Referencing Relationship (Recursive Relationship)**

--A self-referencing relationship occurs when a table has a foreign key that references its own primary key.


--**Example**: Create a relationship within the `Employees` table where each employee may have a manager who is also an employee.



-- Table: Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID) -- Self-referencing foreign key
);

-- Inserting records with a self-referencing relationship
INSERT INTO Employees (EmployeeID, Name, Position) VALUES (1, 'Alice', 'CEO');  -- No manager
INSERT INTO Employees (EmployeeID, Name, Position, ManagerID) VALUES (2, 'Bob', 'Manager', 1);  -- Manager is Alice
INSERT INTO Employees (EmployeeID, Name, Position, ManagerID) VALUES (3, 'Charlie', 'Developer', 2); -- Manager is Bob

--- ### Basic Operations on Relationships

Using the relationships created above, here are some common operations:


--1. * * Join Tables in a One - to - Many Relationship * * 
   -- List all employees with their department names
   SELECT e.Name AS EmployeeName, e.Position, d.DepartmentName
   FROM Employees e
   JOIN Departments d ON e.DepartmentID = d.DepartmentID;
   

--2. * * Join Tables in a Many - to - Many Relationship * * 
   -- List all students with their enrolled courses
   SELECT s.Name AS StudentName, c.CourseName
   FROM Students s
   JOIN Enrollments e ON s.StudentID = e.StudentID
   JOIN Courses c ON e.CourseID = c.CourseID;
   

--3. * * Self - Join for a Self - Referencing Relationship * * 
   -- List each employee along with their manager's name
   SELECT e.Name AS EmployeeName, m.Name AS ManagerName
   FROM Employees e
   LEFT JOIN Employees m ON e.ManagerID = m.EmployeeID;
   

--4. * * Cascade Delete in a One - to - Many Relationship * * 
   -- Enable cascading delete so that when a department is deleted, its employees are deleted too
   ALTER TABLE Employees
   ADD CONSTRAINT FK_Department
   FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
   ON DELETE CASCADE;

   -- Deleting a department will automatically delete related employees
   DELETE FROM Departments WHERE DepartmentID = 1;
   

