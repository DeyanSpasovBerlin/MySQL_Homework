/*
1 уровень сложности: Используйте бд uni, скрип есть в репозитории:
1) Найти компетенции , которых нет ни у одного преподавателя.
2)Вывести название курса и имя старосты
3)Вывести имя студента и имена старост, которые есть на курсах, которые он проходит
*/
USE uni;
SELECT * FROM competencies;
SELECT * FROM courses;
SELECT * FROM students;
SELECT * FROM students2courses;
SELECT * FROM teachers;
SELECT * FROM teachers2competencies;
-- 1) Найти компетенции , которых нет ни у одного преподавателя.
-- a) with LEFT JOIN
SELECT
c.title AS Name_competence
FROM competencies AS c
LEFT JOIN teachers2competencies AS tc
ON c.id = tc.competencies_id
WHERE tc.teacher_id IS NULL;
-- with sub query
SELECT 
c.title AS Name_competence
FROM competencies AS c
WHERE c.id NOT IN (
					SELECT
					teachers2competencies.competencies_id
					FROM teachers2competencies);
                    
--  2)Вывести название курса и имя старосты
SELECT 
cour.title AS Course_name,
s.name
FROM courses AS cour
LEFT JOIN students AS s
ON cour.headman_id = s.id;

-- 3)Вывести имя студента и имена старост, которые есть на курсах, которые он проходит

SELECT 
s.name,
HeadName.name AS Head_Name
FROM students AS s
INNER JOIN students2courses AS sc
ON sc.student_id = s.id
INNER JOIN courses AS c
ON c.id = sc.course_id
INNER JOIN students AS HeadName
ON HeadName.id = c.headman_id;

				