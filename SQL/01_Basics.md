# SQL Mastery

## What is _SQL_ and what is it used for?

==> **SQL** (**Structured Query Language**) is a domain-specific, declarative programming language designed for managing relational databases. SQL consists of a data definition language, data manipulation language, and a data control language. You can use it to interact with various database systems to insert, update, delete and retrive data.

### Core Components

- **DDL** (Data Definition Language): Used for defining and modifying the structure of the database.
- **DML** (Data Manipulation Language): Deals with adding, modifying, and removing data in the database.
- **DCL** (Data Control Language): Manages the permissions and access rights of the database.
- **TCL** (Transaction Control Language): Governs the transactional management of the database, such as commits or rollbacks.

### Basic SQL Commands

- **CREATE DATABASE**: Used to create a new database.
- **CREATE TABLE**: Defines a new table.
- **INSERT INTO**: Adds a new record into a table.
- **SELECT**: Retrieves data from one or more tables.
- **UPDATE**: Modifies existing records.
- **DELETE**: Removes records from a table.
- **ALTER TABLE**: Modifies an existing table (e.g., adds a new column, renames an existing column, etc.).
- **DROP TABLE**: Deletes a table (along with its data) from the database.
- **INDEX**: Adds an index to a table for better performance.
- **VIEW**: Creates a virtual table that can be used for data retrieval.
- **TRIGGER**: Triggers a specified action when a database event occurs.
- **PROCEDURE** and **FUNCTION**: Store database logic for reuse and to simplify complex operations.


### Code Example: Basic SQL Queries

```sql

-- Create a Database
CREATE DATABASE SqlMastery;

-- Show all Databases
SHOW DATABASES;

-- Use SqlMastery Database
USE SqlMastery;

-- Delete a Database
DROP DATABASE DB_Name;

-- Check Current Using Database
SELECT DATABASE();

```
