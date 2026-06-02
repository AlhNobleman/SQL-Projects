#Sunqueries: It is a query within another query

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

# WHERE Clause
SELECT *
FROM employee_demographics
WHERE employee_id IN (
					SELECT employee_id
                    FROM employee_salary
                    WHERE dept_id = 1);
                    
# WHERE Clause
SELECT first_name, last_name, age
FROM employee_demographics
WHERE first_name IN (
					SELECT first_name
                    FROM employee_salary
                    WHERE salary >= 70000);
                    
	# Subquery in Select statement
    SELECT first_name, salary,
		(SELECT AVG(salary)
        FROM employee_salary) AS Average_salary
    FROM employee_salary;
                    
	SELECT first_name, last_name,
		(SELECT AVG(age)
        FROM employee_demographics)
	FROM employee_salary;
        
                    
		# Subquery using FROM statement
SELECT AVG(Max_salary) Average_salary
FROM
	(SELECT dept_id, AVG(salary) Avg_salary , MAX(salary) Max_salary, MIN(salary), COUNT(salary)
	FROM employee_salary
	GROUP BY dept_id) Agg_table;

                    