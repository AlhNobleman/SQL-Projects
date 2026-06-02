# Union allows you to combine rows of data together from same table or separate tables
# Done by taking one SELECT statement and using UNION to combine it with another SELECT statement

SELECT first_name, last_name
FROM employee_salary
UNION   # distinct, UNION ALL for all
SELECT first_name, last_name
FROM employee_demographics;


# Usecase
SELECT first_name, last_name, "Old Man" AS Label
FROM employee_demographics
WHERE age > 40 AND gender = "Male"
UNION
SELECT first_name, last_name, "Old Lady" AS Label
FROM employee_demographics
WHERE age > 40 AND gender = "Female"
UNION
SELECT first_name, last_name, "Highly paid employee" AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name;


