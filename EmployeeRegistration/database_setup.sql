-- ============================================================
--  Employee Registration System - Database Setup
--  MPJ Assignment 5
--  Run: mysql -u root -p < database_setup.sql
-- ============================================================

CREATE DATABASE IF NOT EXISTS employee_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE employee_db;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id            INT            NOT NULL AUTO_INCREMENT,
    first_name    VARCHAR(50)    NOT NULL,
    last_name     VARCHAR(50)    NOT NULL,
    email         VARCHAR(100)   NOT NULL UNIQUE,
    phone         VARCHAR(15),
    department    VARCHAR(100)   NOT NULL,
    designation   VARCHAR(100)   NOT NULL,
    salary        DECIMAL(12,2)  NOT NULL DEFAULT 0.00,
    joining_date  DATE           NOT NULL,
    created_at    TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sample Data
INSERT INTO employees (first_name, last_name, email, phone, department, designation, salary, joining_date)
VALUES
  ('Ravi',   'Kumar',  'ravi.kumar@company.com',   '9876543210', 'Engineering',     'Software Engineer',  65000.00, '2023-06-01'),
  ('Priya',  'Sharma', 'priya.sharma@company.com', '9123456780', 'Human Resources', 'HR Manager',         72000.00, '2022-03-15'),
  ('Amit',   'Patil',  'amit.patil@company.com',   '9988776655', 'Finance',         'Financial Analyst',  58000.00, '2024-01-10'),
  ('Sneha',  'Joshi',  'sneha.joshi@company.com',  '9870001122', 'Marketing',       'Marketing Executive',48000.00, '2023-09-20'),
  ('Vikram', 'Mehta',  'vikram.mehta@company.com', '9001234567', 'Engineering',     'Senior Developer',   90000.00, '2021-11-05');

SELECT * FROM employees;
