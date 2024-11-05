---

### **1. Numeric Data Types**

-- Table Creation
CREATE TABLE NumericExample (
    ID SERIAL PRIMARY KEY,
    Age SMALLINT,
    Population BIGINT,
    Price DECIMAL(10, 2),
    DiscountRate FLOAT
);

-- Insert and Query Data

-- Insert data
INSERT INTO
    NumericExample (
        Age,
        Population,
        Price,
        DiscountRate
    )
VALUES (25, 1000000000, 99.99, 0.15);

-- Query data
SELECT * FROM NumericExample WHERE Age > 20;

-- Update operation
UPDATE NumericExample
SET
    Price = Price * (1 - DiscountRate)
WHERE
    ID = 1;

---

### **2. Character Data Types**

-- Table Creation
CREATE TABLE CharacterExample (
    Code CHAR(5),
    Name VARCHAR(50),
    Description TEXT
);

-- Insert and Query Data

-- Insert data
INSERT INTO
    CharacterExample (Code, Name, Description)
VALUES (
        'A123',
        'Laptop',
        'High-end gaming laptop with excellent performance.'
    );

-- Query data
SELECT Name, Description FROM CharacterExample WHERE Code = 'A123';

-- Update operation
UPDATE CharacterExample
SET
    Description = 'Updated description'
WHERE
    Code = 'A123';

---

### **3. Date and Time Data Types**

-- Table Creation
CREATE TABLE DateTimeExample (
    EventID SERIAL PRIMARY KEY,
    EventName VARCHAR(100),
    EventDate DATE,
    EventTime TIME,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert and Query Data

-- Insert data
INSERT INTO
    DateTimeExample (
        EventName,
        EventDate,
        EventTime
    )
VALUES (
        'Conference',
        '2024-11-15',
        '09:00:00'
    );

-- Query data
SELECT EventName, EventDate, EventTime
FROM DateTimeExample
WHERE
    EventDate > '2024-01-01';

-- Update operation
UPDATE DateTimeExample SET EventTime = '10:00:00' WHERE EventID = 1;

---

### **4. Boolean Data Type**

-- Table Creation
CREATE TABLE BooleanExample (
    UserID SERIAL PRIMARY KEY,
    UserName VARCHAR(50),
    IsActive BOOLEAN DEFAULT TRUE
);

-- Insert and Query Data

-- Insert data
INSERT INTO
    BooleanExample (UserName, IsActive)
VALUES ('Alice', TRUE);

-- Query data
SELECT UserName FROM BooleanExample WHERE IsActive = TRUE;

-- Update operation
UPDATE BooleanExample SET IsActive = FALSE WHERE UserID = 1;

---

### **5. Binary Data Types**

-- Table Creation
CREATE TABLE BinaryExample (
    DocumentID SERIAL PRIMARY KEY,
    DocName VARCHAR(50),
    DocumentData BYTEA -- BYTEA used for binary data in PostgreSQL
);

-- Insert and Query Data

-- Insert binary data (example hex data)
INSERT INTO
    BinaryExample (DocName, DocumentData)
VALUES (
        'UserManual',
        decode ('89504E470D0A1A0A', 'hex')
    );

-- Query data
SELECT DocName FROM BinaryExample WHERE DocumentID = 1;

---

### **6. JSON Data Type**

-- Table Creation (PostgreSQL or MySQL 5.7+)
CREATE TABLE JsonExample (
    RecordID SERIAL PRIMARY KEY,
    UserName VARCHAR(50),
    Preferences JSON
);

-- Insert and Query Data

-- Insert JSON data
INSERT INTO
    JsonExample (UserName, Preferences)
VALUES (
        'JohnDoe',
        '{"theme": "dark", "notifications": {"email": true, "sms": false}}'
    );

-- Query data (example for PostgreSQL)
SELECT UserName, Preferences ->> 'theme' AS Theme
FROM JsonExample
WHERE
    RecordID = 1;

-- Update JSON field (example for PostgreSQL)
UPDATE JsonExample SET Preferences = jsonb_set(Preferences, '{notifications, sms}', 'true'::jsonb) WHERE RecordID = 1;

---

### **7. Spatial Data Types (using POINT)**

-- Table Creation
CREATE TABLE SpatialExample (
    LocationID SERIAL PRIMARY KEY,
    LocationName VARCHAR(50),
    Coordinates POINT -- PostgreSQL specific type
);

-- Insert and Query Data

-- Insert spatial data
INSERT INTO
    SpatialExample (LocationName, Coordinates)
VALUES (
        'Central Park',
        POINT(40.785091, -73.968285)
    );

-- Query data (example query for bounding box check in PostgreSQL)
SELECT LocationName FROM SpatialExample WHERE Coordinates <@ BOX(POINT(40.785, -73.969), POINT(40.786, -73.967));

---

### **8. Other Specialized Data Types**

#### UUID Example

-- Table Creation with UUID (PostgreSQL)
CREATE TABLE UUIDExample (
    ItemID UUID DEFAULT uuid_generate_v4 () PRIMARY KEY,
    ItemName VARCHAR(50)
);

-- Insert data with auto-generated UUID
INSERT INTO UUIDExample (ItemName) VALUES ('Unique Item');

#### ENUM Example (only in MySQL)

-- Table Creation with ENUM
CREATE TABLE EnumExample (
    Status ENUM(
        'active',
        'inactive',
        'pending'
    ) DEFAULT 'active'
);

-- Insert and query data
INSERT INTO EnumExample (Status) VALUES ('inactive');

SELECT * FROM EnumExample WHERE Status = 'inactive';

#### ARRAY Example (only in PostgreSQL)

-- Table Creation with ARRAY
CREATE TABLE ArrayExample (
    ID SERIAL PRIMARY KEY,
    Tags TEXT[]
);

-- Insert and query data
INSERT INTO ArrayExample (Tags) VALUES (ARRAY['sql', 'postgresql', 'database']);

SELECT * FROM ArrayExample WHERE 'database' = ANY (Tags);

---

### Summary Table

| Data Type | Column Definition |
Insert
    Example | Query Example |
Update Example | | ----------------|------------------------|---------------------------------|--------------------------------------|------------------------------------------------|
| * * INT * * | `Age INT` | `25` | `WHERE Age > 20` | `SET Age = Age + 1` | | * * VARCHAR * * | `Name VARCHAR(50)` | `'Alice'` | `WHERE Name = 'Alice'` | `SET Name = 'Bob'` | | * * DATE * * | `EventDate DATE` | `'2024-01-01'` | `WHERE EventDate > '2024-01-01'` | `SET EventDate = '2024-02-01'` | | * * BOOLEAN * * | `IsActive BOOLEAN` | `TRUE` | `WHERE IsActive = TRUE` | `SET IsActive = FALSE` | | * * BYTEA * * | `DocumentData BYTEA` | `decode('89504E47', 'hex')` | `WHERE DocumentID = 1` | N / A (usually replaced entirely) | | * * JSON * * | `Preferences JSON` | `'{"key": "value"}'` | `WHERE Preferences->>'key' = 'value'` | `SET Preferences = jsonb_set(...` (PostgreSQL) | | * * UUID * * | `ItemID UUID` | `DEFAULT uuid_generate_v4()` | `WHERE ItemID = ...` | Not usually updated | | * * ENUM * * | `Status ENUM` | `'active'` | `WHERE Status = 'active'` | `SET Status = 'inactive'` | | * * POINT * * | `Coordinates POINT` | `POINT(40.78, -73.96)` | `WHERE Coordinates <@ BOX(...)` | `SET Coordinates = ...` | | * * ARRAY * * | `Tags TEXT[]` | `ARRAY['sql', 'database']` | `WHERE 'database' = ANY(Tags)` | `SET Tags = ARRAY[...]` |

