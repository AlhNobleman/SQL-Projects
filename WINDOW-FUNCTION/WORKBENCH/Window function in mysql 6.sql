# Window function dont roll everything into one role like group by
# Window functions allows us to look at a partition or group but they keep thier own unique rows in the output

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

# Using Join and Group BY
SELECT gender, AVG(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

# using window function
SELECT gender, AVG(salary) OVER()
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;

# The difference btw group by and window function here is that; in group by, gender is grouped by jsut single male and female, while in window function is different


# Additon of other columns to make more sense on how window function is use
SELECT dem.first_name, dem.last_name,gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
    
    #Window function by rolling total
SELECT dem.first_name, dem.last_name, gender, salary, 
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
    #ROW NUMBER gives a roll number to each partition. 
    #Rank gives same number if it detect dublicate value and the nxt no wont be next number numerically
    #DENSE rank gives the next row number numerically when it dtect dublicate
    
SELECT dem.first_name, dem.last_name, gender, salary, 
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
    
