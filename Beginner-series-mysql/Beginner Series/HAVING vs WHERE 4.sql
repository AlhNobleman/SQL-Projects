# The difference betwen HAVING and WHERE

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

# Using WHERE and HAVING together
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE "%manager%"
GROUP BY occupation;
# Agg_fuction will work after the group by actually runs






