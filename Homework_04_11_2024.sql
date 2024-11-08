/*
1 уровень сложности: Используйте бд hr;
1)Вывести job_id тех сотрудников, которые зарабатывают больше своего менеджера
2)Вывести имя, фамилию и город сотрудников, которые работают в Seattle или Toronto
3)Вывести имя, фамилию и зарплату тех сотрудников, которые работают в городах Oxford и San Francisco
4)Вывести имя, фамилию и город сотрудника
5)Вывести города и соответствующие городам страны
6)Выведите названия департаментов, в которых менеджеры зарабатывают больше 10000
*/
USE hr;
SELECT * FROM countries;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM jobs;
SELECT * FROM locations;
SELECT * FROM regions;

-- 1)Вывести job_id тех сотрудников, которые зарабатывают больше своего менеджера
SELECT
e.job_id
FROM employees AS e
INNER JOIN employees AS m
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

-- 2)Вывести имя, фамилию и город сотрудников, которые работают в Seattle или Toronto

SELECT
e.first_name,
e.last_name,
l.city
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
INNER JOIN locations AS l
ON d.location_id = l.location_id
WHERE l.city IN ('Toronto','Seattle');

-- 3)Вывести имя, фамилию и зарплату тех сотрудников, которые работают в городах Oxford и San Francisco
SELECT
e.first_name,
e.last_name,
e.salary
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
INNER JOIN locations AS l
ON d.location_id = l.location_id
WHERE l.city IN ('Oxford','South San Francisco');

-- 4)Вывести имя, фамилию и город сотрудника
SELECT
e.first_name,
e.last_name,
l.city
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
INNER JOIN locations AS l
ON d.location_id = l.location_id;

-- 5)Вывести города и соответствующие городам страны
SELECT
l.city,
c.country_name
FROM locations AS l
INNER JOIN countries AS c
On l.country_id = c.country_id;

-- 6)Выведите названия департаментов, в которых менеджеры зарабатывают больше 10000
SELECT 
d.department_name
FROM departments AS d
INNER JOIN employees AS e
ON e.department_id = d.department_id
INNER JOIN employees AS m
ON e.manager_id = m.employee_id
WHERE m.salary > 10000;


