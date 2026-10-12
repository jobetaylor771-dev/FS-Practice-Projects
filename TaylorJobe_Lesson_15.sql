---Question 1 Create a Database 
/* 
 Forgoing any code I went to database in the ribbon and then 
 new database connection connected to SQLITE and from there 
 established my path to the class folder
 */

---Question 2 Create an Employee Table 
CREATE TABLE employee (
    emp_id INTEGER PRIMARY KEY,
    f_name TEXT,
    l_name TEXT,
    job_id INTEGER,
    salary REAL,
    manager_id INTEGER,
    dept_id INTEGER
);

---Question 3 Insert Values
INSERT INTO employee (emp_id, f_name, l_name, job_id, salary, manager_id, dept_id)
VALUES
(101, 'John', 'Smith', 'JP123', 70000, 02, 30),
(102, 'Emily', 'Johnson', 'EN45', 80000, 03, 40),
(103, 'Michael', 'Williams', 'MW789', 90000, 04, 20),
(104, 'Emma', 'Jones', 'EJ567', 75000, 02, 10),
(105, 'Calvin', 'Miller', 'CM345', 85000, 03, 30),
(106, 'Sophia', 'Davis', 'SD678', 95000, 04, 20),
(107, 'Liam', 'Moore', 'LM901', 72000, 02, 40),
(108, 'Olivia', 'Anderson', 'OA234', 87000, 03, 10),
(109, 'William', 'Brown', 'WB567', 92000, 04, 30),
(110, 'Ava', 'Taylor', 'AT890', 78000, 02, 20);

---Question 4 Salary Higher Than Calvin's 
SELECT e.f_name, e.l_name
FROM employee AS e
JOIN employee AS c
    ON e.salary > c.salary
WHERE c.f_name = 'Calvin';

---Question 5 Above Average Salary Using Subqueries 
SELECT emp_id, l_name
FROM employee
WHERE salary > (
    SELECT AVG(salary)
    FROM employee
);

---Question 6 Salary Higher Than 'MW789'
SELECT emp_id, f_name
FROM employee
WHERE salary > (
    SELECT salary
    FROM employee
    WHERE job_id = 'MW789'
)
ORDER BY emp_id;

---Question 7 Top Three Earners
SELECT e.f_name, e.emp_id, e.salary
FROM employee AS e
JOIN (
    SELECT emp_id, salary
    FROM employee
    ORDER BY salary DESC
    LIMIT 3
) AS top_earners
ON e.emp_id = top_earners.emp_id
ORDER BY e.salary DESC;
