---Question 1 Create Table 1
CREATE TABLE patients (
    date DATE,
    pid VARCHAR(10) PRIMARY KEY,
    p_name VARCHAR(100),
    age INT,
    weight INT,
    gender VARCHAR(20),
    location VARCHAR(100),
    phone_no VARCHAR(20),
    disease VARCHAR(100),
    doctor_name VARCHAR(100),
    doctor_id INT
);


---Question 2 Insert Values into table
INSERT INTO patients
(date, pid, p_name, age, weight, gender, location, phone_no, disease, doctor_name, doctor_id)
VALUES
('2019-06-15', 'AP2021', 'Sarath', 67, 76, 'Male', 'Chennai', '5462829', 'Cardiac', 'Mohan', 21),
('2019-02-13', 'AP2022', 'John', 62, 80, 'Male', 'Banglore', '1234731', 'Cancer', 'Suraj', 22),
('2018-01-08', 'AP2023', 'Henry', 43, 65, 'Male', 'Kerala', '9028320', 'Liver', 'Mehta', 23),
('2020-02-04', 'AP2024', 'Carl', 56, 72, 'Female', 'Mumbai', '9293829', 'Asthma', 'Karthik', 24),
('2017-09-15', 'AP2025', 'Shikar', 55, 71, 'Male', 'Delhi', '7821281', 'Cardiac', 'Mohan', 21),
('2018-07-22', 'AP2026', 'Piysuh', 47, 59, 'Male', 'Haryana', '8912819', 'Cancer', 'Suraj', 22),
('2017-03-25', 'AP2027', 'Stephen', 69, 55, 'Male', 'Gujarat', '8888211', 'Liver', 'Mehta', 23),
('2019-04-22', 'AP2028', 'Aaron', 75, 53, 'Male', 'Banglore', '9012192', 'Asthma', 'Karthik', 24); 

---Question 3 Total Number of Patients 
SELECT COUNT(*) AS total_patients
FROM patients;

---Question 4.a Current Date
SELECT pid, p_name, DATE('now') AS current_date
FROM patients;
---Question 4.b Display name as UPPERCASE
SELECT p_name AS old_patient_name,
       UPPER(p_name) AS new_patient_name
FROM patients;
---4.c Length of Name
SELECT p_name, LENGTH(p_name) AS total_characters
FROM patients;
---4.d Patient and Doctors Name
SELECT p_name || ' ' || doctor_name AS patient_doctor
FROM patients;
---4.e Exact Year
SELECT date, strftime('%Y', date) AS year
FROM patients;
---4.f Display Duplicate Entries
SELECT doctor_name, COUNT(*) AS number_of_entries
FROM patients
GROUP BY doctor_name
HAVING COUNT(*) > 1;