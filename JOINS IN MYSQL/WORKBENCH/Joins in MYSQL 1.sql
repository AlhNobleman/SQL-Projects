# Joins allow you to combine two tables or more together if they have a common column

SELECT *
FROM employee_demographics;


SELECT *
FROM employee_salary;


# INNER JOIN
SELECT dem.employee_id, age, occupation
FROM employee_demographics dem # Alising
	INNER JOIN employee_salary sal ON dem.employee_id = sal.employee_id;
    
    # Outer join: LEFT OUTER, RIGHT OUTER, FULL LEFT OUTER AND FULL RIGHT OUTER
SELECT *
FROM employee_demographics dem # Alising
	RIGHT JOIN employee_salary sal ON dem.employee_id = sal.employee_id;
    
    # Self join: it is a join where you tie the table to itself
    # INNER JOIN
SELECT *
FROM employee_salary emp1
	JOIN employee_salary emp2 ON emp1.employee_id +1 = emp2.employee_id;
    
    
    select *
    from parks_departments;
    
    # Joining multiple table together
SELECT *
FROM employee_demographics dem # Alising
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
JOIN parks_departments pd
	ON sal.dept_id = pd.department_id;

    
