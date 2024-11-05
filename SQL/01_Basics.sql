-- Create a Database
CREATE DATABASE SqlMastery;

-- Show all Databases
-- MySQL:
SHOW DATABASES;

-- PostgreSQL:
\l 
-- Switch to SqlMastery Database
-- MySQL:
USE SqlMastery;

-- PostgreSQL:
\c SqlMastery 
-- Delete a Database
DROP DATABASE SqlMastery;

-- Check the Current Database in Use
-- MySQL:
SELECT DATABASE();

-- PostgreSQL:
SELECT current_database ();