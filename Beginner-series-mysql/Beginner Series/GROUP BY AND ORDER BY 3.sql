SELECT gender, COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT gender
FROM employee_demographics
GROUP BY gender;

# Single group but with aggregate function
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

# Group on multiple
SELECT occupation, salary, AVG(age)
FROM employee_salary
GROUP BY occupation, salary;


# ORDER BY ASC and DESC
SELECT *
FROM employee_demographics
ORDER BY gender, age;

