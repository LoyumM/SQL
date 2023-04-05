-- 1.List the teachers who have NULL for their department.

SELECT name
FROM teacher
WHERE dept IS NULL;


-- 2.Note the INNER JOIN misses the teachers with no department and the departments with no teacher.

SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
    ON (teacher.dept=dept.id);

-- 3.Use a different JOIN so that all teachers are listed.

SELECT teacher.name AS teacher, dept.name AS dept
FROM teacher LEFT JOIN dept
    ON (teacher.dept=dept.id);

-- 4.Use a different JOIN so that all departments are listed.

SELECT teacher.name AS teacher, dept.name AS dept
FROM teacher RIGHT JOIN dept
    ON (teacher.dept=dept.id);

-- 5.Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'

SELECT name,
    COALESCE(mobile, '07986 444 2266') AS mobile
FROM teacher;

-- 6.Print the teacher name and department name. Use the string 'None' where there is no department.

SELECT teacher.name,
    COALESCE(dept.name, 'None') AS department
FROM teacher LEFT JOIN dept
    ON teacher.dept = dept.id;

-- 7. Show the number of teachers and the number of mobile phones

SELECT COUNT(name), COUNT(mobile)
FROM teacher;

-- 8.Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.

SELECT dept.name, COUNT(teacher.name) AS total_staff
FROM teacher RIGHT JOIN dept
    ON teacher.dept = dept.id
GROUP BY dept.name;

