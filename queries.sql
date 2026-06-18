/*1.query-Display student name with course name*/
SELECT s.name, c.course_name
FROM student s
JOIN enrollments e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id;
/*This query gives the name of the students with course name*/
/*2.query-Display complete enrollment details*/
SELECT s.name, s.department, c.course_name, e.enrollment_date, e.status, e.grade
FROM student s
JOIN enrollments e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id;
/* This query displays the complete enrollment details*/
/*3.query-Show students enrolled in CSM department*/
SELECT DISTINCT s.name, s.department
FROM student s
JOIN enrollments e ON s.student_id = e.student_id
WHERE s.department = 'CSM';
/*This query shows the students enrolled in CSM department*/
/*4.query-Find students who joined after 2020*/
SELECT * 
FROM student
WHERE join_year > 2020;
/*This query shows the students who joined after 2020*/
/*5.List courses with more than 4 credits*/
SELECT * 
FROM course
WHERE credits > 4;
/* This query gives the list of courses with more than 4 credits*/
/*6.query-Find students with grade A*/
SELECT s.name, c.course_name, e.grade
FROM student s
JOIN enrollments e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id
WHERE e.grade = 'A';
/* This query gives students with grade A*/
/*7.Department-wise student count*/
SELECT department, COUNT(*) AS total_students
FROM student
GROUP BY department;
/*This query shows department-wise total students count*/
/*8.query-Course-wise enrollment count*/
SELECT c.course_name, COUNT(e.student_id) AS total_enrollments
FROM course c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;
/*This query gives total enrollments course wise*/
/*9.Query-Find courses with only one student enrolled*/
SELECT c.course_name
FROM course c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
HAVING COUNT(e.student_id) = 1;
/*This query displays the courses with only one student enrolled*/
/*10.Query-Students enrolled in Database Systems*/
SELECT name
FROM student
WHERE student_id IN (
    SELECT student_id
    FROM enrollments
    WHERE course_id = (
        SELECT course_id
        FROM course
        WHERE course_name = 'Database Systems'
    )
);
/*This query shows the students who are enrolled in database system*/
/*11.Query-students not enrolled in any course*/
SELECT name
FROM student
WHERE student_id NOT IN (
    SELECT student_id FROM enrollments
);
/*This query shows the students who are not enrolled in any course*/
/*12.Query-Courses with no enrollments*/
SELECT course_name
FROM course
WHERE course_id NOT IN (
    SELECT course_id FROM enrollments
);
/*This query finds courses with no enrollments*/
/*13.Update status to Completed where grade is not NULL*/
UPDATE enrollments
SET status = 'Completed'
WHERE grade IS NOT NULL;
/*This query updates status to completed where grade is not NULL*/
/*14.Query-Change department of James to CSM*/
UPDATE student
SET department = 'CSM'
WHERE name = 'James';
/* This query changes the department of james to CSM*/
/*15.Query-Delete enrollment of student Robin*/
DELETE FROM enrollments
WHERE student_id = (
    SELECT student_id FROM student WHERE name = 'Robin'
);
/* The above query is used to delete enrollment of student Robin*/
/*16.Query-Delete students who joined before 2020*/
DELETE FROM student
WHERE join_year < 2020;
/* This query delete the students who joined before 2020*/
/*17.Query-Students whose name starts with 'S'*/
SELECT * 
FROM student
WHERE name LIKE 'S%';
/*This query shows which students name is starting with 'S'*/
/*18.Query-Courses containing word Data*/
SELECT * 
FROM course
WHERE course_name LIKE '%Data%';
/* This query shows the courses containing word Data*/
/*19.Query-Rank students by enrollment date */
SELECT s.name, e.enrollment_date
FROM student s
JOIN enrollments e ON s.student_id = e.student_id
ORDER BY e.enrollment_date DESC;
/*This query gives the rank students by enrollement date*/
/*20.Query-Create a VIEW for student course report*/
CREATE VIEW student_course_report AS
SELECT s.name, s.department, c.course_name, e.status, e.grade
FROM student s
JOIN enrollments e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id;
/*This query is used to create A VIEW for student course report*/
 select * from student_course_report;
 

