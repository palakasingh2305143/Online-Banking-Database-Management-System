
CREATE DATABASE OnlineBankingSystem;

USE OnlineBankingSystem;

CREATE TABLE Customers (

    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE Accounts (

    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(30),
    balance DECIMAL(12,2),
    status VARCHAR(20) DEFAULT 'Active',

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)

);

CREATE TABLE Transactions (

    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    sender_account INT,
    receiver_account INT,
    transaction_type VARCHAR(30),
    amount DECIMAL(12,2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (sender_account)
    REFERENCES Accounts(account_id),

    FOREIGN KEY (receiver_account)
    REFERENCES Accounts(account_id)

);

CREATE TABLE Loans (

    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    loan_amount DECIMAL(12,2),
    loan_type VARCHAR(50),
    interest_rate DECIMAL(5,2),
    loan_status VARCHAR(20) DEFAULT 'Pending',

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)

);

INSERT INTO Customers
(full_name,email,phone,city)

VALUES

('Palak Singh','palak@gmail.com','9876543210','Bhubaneswar'),

('Rahul Sharma','rahul@gmail.com','9876543221','Delhi'),

('Ananya Verma','ananya@gmail.com','9876543232','Mumbai'),

('Karan Mehta','karan@gmail.com','9876543243','Pune');

SELECT * FROM Customers;
