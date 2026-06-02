# Case statement allows you to add logic to your select statement



SELECT first_name, last_name, age,
CASE
	WHEN age <= 30 THEN "YOUNG"
    WHEN age BETWEEN 30 AND 40 THEN "Mid_age"
    WHEN age > 40 THEN "OLD"
END AS Age_Status
FROM employee_demographics;

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary + (salary * 0.07)
END AS New_salary,
CASE
	WHEN dept_id = 6 THEN salary + (salary * 0.07)
END Extra_bonus
FROM employee_salary;
    
	