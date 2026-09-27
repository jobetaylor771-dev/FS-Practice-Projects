---Question 1 Student Table
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    class VARCHAR(50),
    age INTEGER
);

---Question 2 Marksheet Table 
CREATE TABLE marksheet (
    score INTEGER,
    year INTEGER,
    ranking INTEGER,
    class VARCHAR(50),
    student_id INTEGER
);

---Question 3 Inserting Values into the Student and Marksheet Table 
INSERT INTO students (student_id, first_name, last_name, class, age)
VALUES
(1, 'krishna', 'gee', 10, 18),
(2, 'Stephen', 'Christ', 10, 17),
(3, 'Kailash', 'kumar', 10, 18),
(4, 'ashish', 'jain', 10, 16),
(5, 'khusbu', 'jain', 10, 17),
(6, 'madhan', 'lal', 10, 16),
(7, 'saurab', 'kothari', 10, 15),
(8, 'vinesh', 'roy', 10, 14),
(9, 'rishika', 'r', 10, 15),
(10, 'sara', 'rayan', 10, 16),
(11, 'rosy', 'kumar', 10, 16);

INSERT INTO marksheet (score, year, class, ranking, student_id)
VALUES
(989, 2014, 10, 1, 1),
(454, 2014, 10, 10, 2),
(880, 2014, 10, 4, 3),
(870, 2014, 10, 5, 4),
(720, 2014, 10, 7, 5),
(670, 2014, 10, 8, 6),
(900, 2014, 10, 3, 7),
(540, 2014, 10, 9, 8),
(801, 2014, 10, 6, 9),
(420, 2014, 10, 11, 10),
(970, 2014, 10, 2, 11),
(720, 2014, 10, 12, 12);

---Question 4 Age greater than or equal to 16, and last name kumar 
SELECT student_id, first_name
FROM students
WHERE age >= 16
  AND last_name = 'kumar';

---Question 5 Score Between 800 and 1000
SELECT *
FROM marksheet
WHERE score BETWEEN 800 AND 1000;


---Question 6 Increase score by 5
SELECT score,
       score + 5 AS new_score
FROM marksheet;

---Question 7 List Score in Desccending Order
SELECT *
FROM marksheet
ORDER BY score DESC;

---Question 8 First name starts with 'a'
SELECT *
FROM students
WHERE first_name LIKE 'a%';