CREATE DATABASE library_db;      -- Create Database
USE library_db;

CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name VARCHAR(50),
  city VARCHAR(30)
);

CREATE TABLE books (
  book_id INT PRIMARY KEY,
  title VARCHAR(100),
  author VARCHAR(50)
);

CREATE TABLE issue_records (
  issue_id INT PRIMARY KEY,
  student_id INT,
  book_id INT,
  issue_date DATE,
  return_date DATE,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO students VALUES
(1,'Rahul','Jaipur'),
(2,'Amit','Delhi'),
(3,'Neha','Jaipur');

INSERT INTO books VALUES
(101,'Python Basics','Guido'),
(102,'SQL Mastery','John'),
(103,'Data Science Intro','Smith');

INSERT INTO issue_records VALUES
(1,1,101,'2025-01-10','2025-01-20'),
(2,2,102,'2025-01-12',NULL),
(3,1,103,'2025-01-15',NULL);
