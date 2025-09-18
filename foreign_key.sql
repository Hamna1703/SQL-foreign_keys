-- Step 1: Create and use the database
CREATE DATABASE IF NOT EXISTS startsql;
USE startsql;

-- Step 2: Drop tables if they already exist (to avoid duplicate errors)
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS users;

-- Step 3: Create the users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    gender ENUM('Male','Female','Others') NOT NULL,
    date_of_birth DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 4: Insert sample users
INSERT INTO users (name, email, gender, date_of_birth)
VALUES
('HAMNA', 'hamna@gmail.com', 'Female', '2000-09-19'),
('ABC', 'abc@gmail.com', 'Male', '2001-09-18'),
('XYZ', 'xyz@gmail.com', 'Others', '1999-09-17');

-- Step 5: Create the addresses table with foreign key
CREATE TABLE addresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    street VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(50),
    pincode VARCHAR(10),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Step 6: Insert sample addresses (linked to users above)
INSERT INTO addresses (user_id, street, city, state, pincode) VALUES
(1, '123 MG Road', 'Bengaluru', 'Karnataka', '560001'),
(2, '45 Park Street', 'Kolkata', 'West Bengal', '700016'),
(3, '10 Marine Drive', 'Mumbai', 'Maharashtra', '400001'),
(1, '22 Residency Road', 'Bengaluru','Karnataka', '560025'),
(2, '88 Connaught Place', 'New Delhi', 'Delhi', '110001');

-- Step 7: Verify the data
SELECT * FROM users;
SELECT * FROM addresses;

-- Step 8: Join query to see users with their addresses
SELECT u.id AS user_id, u.name, u.email, u.gender, u.date_of_birth,
       a.street, a.city, a.state, a.pincode
FROM users u
LEFT JOIN addresses a ON u.id = a.user_id;
