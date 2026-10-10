CREATE DATABASE employee;
USE employee;

CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(100)
);

CREATE TABLE Location (
    location_id INT,
    location_name VARCHAR(100)
);

CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(100),
    gender CHAR(1),
    age INT,
    designation VARCHAR(50),
    hire_date DATE,
    department_id INT,
    location_id INT
);

ALTER TABLE Employees
ADD COLUMN email VARCHAR(255);

select * from employees;

ALTER TABLE Employees
MODIFY COLUMN designation VARCHAR(150);

select * from employees;

ALTER TABLE Employees
DROP COLUMN age;

select * from employees;

ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;

select * from employees;

RENAME TABLE Departments TO Departments_Info;

RENAME TABLE Location TO Locations;

TRUNCATE TABLE Employees;
select * from employees;

DROP TABLE Employees;
DROP DATABASE employee;

CREATE DATABASE employee;
USE employee;

DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO Departments VALUES(1, 'IT'),(2, 'HR'),
(3, 'Finance');
SELECT * FROM Departments;


CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL UNIQUE
); 

INSERT INTO Location (location_name)
VALUES ('Riyadh'),('Jeddah'),('Dammam');

SELECT * FROM Location;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    gender CHAR(1),
    age INT,
    designation VARCHAR(150),
    hire_date DATE DEFAULT (CURRENT_DATE),
    department_id INT,
    location_id INT,

    CONSTRAINT chk_gender
        CHECK (gender IN ('M', 'F')),

    CONSTRAINT chk_age
        CHECK (age >= 18),

    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    CONSTRAINT fk_employee_location
        FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);

INSERT INTO Employees
(
    employee_id,employee_name,gender,age,designation,department_id,location_id
)
VALUES
(101, 'Arun', 'M', 25, 'Data Analyst', 1, 1),
(102, 'Priya', 'F', 27, 'HR Executive', 2, 2),
(103, 'Rahul', 'M', 30, 'Accountant', 3, 3);

SELECT * FROM Employees;

INSERT INTO Employees VALUES (101, 'Asha', 'F', 24, 'Developer', DEFAULT, 1, 1);
INSERT INTO Employees(
    employee_id,employee_name,gender,age,designation,department_id,location_id
)
VALUES
(104, NULL, 'M', 25, 'Developer', 1, 1);

INSERT INTO Employees VALUES(105, 'Asha', 'X', 24, 'Developer', DEFAULT, 1, 1);

INSERT INTO Employees VALUES (106, 'Asha', 'F', 16, 'Developer', DEFAULT, 1, 1);

INSERT INTO Employees VALUES(107, 'Asha', 'F', 24, 'Developer', DEFAULT, 99, 1);

SELECT
    e.employee_id,
    e.employee_name,
    e.hire_date,
    d.department_name,
    l.location_name
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id
JOIN Location l
    ON e.location_id = l.location_id;