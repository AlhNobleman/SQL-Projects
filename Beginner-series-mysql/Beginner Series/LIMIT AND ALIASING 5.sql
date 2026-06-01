#USE OF LIMIT 
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

# LIMIT.... Start at position 2 and go one row at a time
SELECT *
FROM employee_demographics
ORDER BY age
LIMIT 2,1;

# Alising: It is just a way to change the name of the column

SELECT gender, AVG(age) AS avg_age   # name changed from AVG(age) to avg_age. 
# it can be use anywhere. You can aslo remove the AS.. It works too i.e AVG(age) avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;