INSERT INTO student (name,email,department,join_year) VALUES
('Alex','alex@gmail.com','CSM',2020),
('James','james@gmail.com','IT',2024),
('Robin','Robin@gmail.com','EEE',2022),
('Siri','siri@gmail.com','CSM',2019),
('Sumanth','kethe@gmail.com','CSM',2026),
('Lakshmi','lucky@gmail.com','IT',2026);

INSERT INTO course (course_name, instructor, credits) VALUES
('Database Systems', 'Dr. Rao', 4),
('Python Programming', 'Ms. Neha', 3),
('Data Structures', 'Mr. Kumar', 4),
('Data Science','Mr.Raju',5),
('Java Programming','Mr.Reyan',4);

INSERT INTO enrollments (student_id, course_id, enrollment_date, status, grade) VALUES
(1, 1, '2024-01-10', 'Enrolled', 'A'),
(2, 2, '2024-01-12', 'Enrolled', 'B'),
(3, 1, '2024-01-11', 'Completed', 'A'),
(4, 3, '2024-01-15', 'Enrolled', NULL),
(5,4,'2025-04-16','Completed','A'),
(6,5,'2025-03-18','Enrolled','B');
