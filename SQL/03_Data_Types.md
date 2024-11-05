SQL data types can be grouped into several categories, including numeric, character, date/time, and more. Here’s an overview of common SQL data types with examples.

---

### **1. Numeric Data Types**

| Data Type       | Description                          | Example           |
|-----------------|--------------------------------------|--------------------|
| **INT**         | Stores whole numbers, both positive and negative. Size varies by DBMS. | `INT` for age, ID |
| **SMALLINT**    | Stores smaller whole numbers. Typically used to save space. | `SMALLINT` for counts |
| **BIGINT**      | Stores large whole numbers. Useful for big values like population counts. | `BIGINT` for transaction IDs |
| **DECIMAL(p, s)** | Stores exact fixed-point numbers. `p` is precision (total digits), `s` is scale (digits after decimal). | `DECIMAL(10, 2)` for currency |
| **NUMERIC(p, s)** | Similar to `DECIMAL` and often used interchangeably. | `NUMERIC(8, 2)` for prices |
| **FLOAT**       | Stores approximate floating-point numbers. Useful for scientific data. | `FLOAT` for percentages |
| **REAL**        | Another approximate number type, often with less precision than `FLOAT`. | `REAL` for scientific measurements |

---

### **2. Character Data Types**

| Data Type       | Description                          | Example           |
|-----------------|--------------------------------------|--------------------|
| **CHAR(n)**     | Fixed-length character string of size `n`. Pads with spaces if data is shorter than `n`. | `CHAR(10)` for codes |
| **VARCHAR(n)**  | Variable-length character string with a maximum length of `n`. More space-efficient than `CHAR`. | `VARCHAR(50)` for names |
| **TEXT**        | Stores large variable-length text data. Maximum length varies by DBMS. | `TEXT` for descriptions or comments |

---

### **3. Date and Time Data Types**

| Data Type       | Description                          | Example           |
|-----------------|--------------------------------------|--------------------|
| **DATE**        | Stores date values in `YYYY-MM-DD` format. | `DATE` for birth date |
| **TIME**        | Stores time values in `HH:MM:SS` format. | `TIME` for event time |
| **DATETIME**    | Stores both date and time in `YYYY-MM-DD HH:MM:SS` format. | `DATETIME` for timestamps |
| **TIMESTAMP**   | Stores date and time, often with time zone information. Automatically updates with the current timestamp on insertion or update in some DBMS. | `TIMESTAMP` for record creation date |
| **YEAR**        | Stores only the year. Available in MySQL and useful for birth years, etc. | `YEAR` for product year |

---

### **4. Boolean Data Type**

| Data Type       | Description                          | Example           |
|-----------------|--------------------------------------|--------------------|
| **BOOLEAN**     | Stores `TRUE` or `FALSE`. Internally represented as `1` (true) or `0` (false) in some DBMS. | `BOOLEAN` for active/inactive status |

---

### **5. Binary Data Types**

| Data Type       | Description                          | Example           |
|-----------------|--------------------------------------|--------------------|
| **BINARY(n)**   | Fixed-length binary data. Typically used for raw binary data like cryptographic hashes. | `BINARY(16)` for fixed hash |
| **VARBINARY(n)**| Variable-length binary data with a maximum length of `n`. | `VARBINARY(50)` for variable binary input |
| **BLOB**        | Binary Large Object for storing large amounts of binary data like images or files. | `BLOB` for photos or PDFs |

---

### **6. JSON Data Type**

| Data Type       | Description                          | Example           |
|-----------------|--------------------------------------|--------------------|
| **JSON**        | Stores JSON data. Many DBMSs provide support for JSON manipulation functions. | `JSON` for nested user preferences |

---

### **7. Spatial Data Types**

| Data Type       | Description                          | Example           |
|-----------------|--------------------------------------|--------------------|
| **GEOMETRY**    | Stores geometrical data such as points, lines, and polygons. Useful in GIS applications. | `GEOMETRY` for locations |
| **POINT**       | Stores a point in a 2D space. | `POINT` for a specific GPS coordinate |

---

### **8. Other Specialized Data Types**

| Data Type       | Description                          | Example           |
|-----------------|--------------------------------------|--------------------|
| **UUID**        | Universally Unique Identifier for unique keys. Common in PostgreSQL. | `UUID` for unique order ID |
| **XML**         | Stores XML data. Supported in some databases for handling XML documents. | `XML` for structured data |
| **ARRAY**       | Stores a list or array of values. Supported in PostgreSQL. | `ARRAY` of phone numbers |
| **ENUM**        | A string object with a predefined set of possible values. Only available in some DBMSs (like MySQL). | `ENUM('small', 'medium', 'large')` for size |
| **SERIAL**      | Auto-incrementing integer, often used for primary keys in PostgreSQL. | `SERIAL` for unique IDs |

---

### **Examples of Table Creation with Various Data Types**

```sql
CREATE TABLE Employees (
    EmployeeID SERIAL PRIMARY KEY,          -- Auto-incrementing ID
    FirstName VARCHAR(50) NOT NULL,         -- Variable-length string for names
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE,                         -- Date only
    StartTime TIME,                         -- Time only
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp with default current time
    Salary DECIMAL(10, 2),                  -- Fixed-point number for exact values
    IsActive BOOLEAN DEFAULT TRUE,          -- Boolean for active/inactive status
    ProfilePhoto BLOB,                      -- Binary data for photo
    Skills JSON                             -- JSON data for storing skills in JSON format
);
```
