-- Create a new database
CREATE DATABASE IF NOT EXISTS SampleDB;
USE SampleDB;

-- Create a table for storing information about users
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

-- Create a table for storing information about orders
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Insert sample data into Users table
INSERT INTO Users (FirstName, LastName, Email) VALUES
    ('John', 'Doe', 'john@example.com'),
    ('Jane', 'Smith', 'jane@example.com'),
    ('Michael', 'Johnson', 'michael@example.com');

-- Insert sample data into Orders table
INSERT INTO Orders (UserID, OrderDate, TotalAmount) VALUES
    (1, '2023-08-25', 150.00),
    (2, '2023-08-26', 200.00),
    (3, '2023-08-26', 75.50);

-- Query to retrieve user's first name, last name, and total order amount
SELECT
    u.FirstName,
    u.LastName,
    SUM(o.TotalAmount) AS TotalSpent
FROM
    Users u
JOIN
    Orders o ON u.UserID = o.UserID
GROUP BY
    u.UserID;

-- Drop the tables (optional)
-- DROP TABLE Orders;
-- DROP TABLE Users;

-- Drop the database (optional)
-- DROP DATABASE SampleDB;
