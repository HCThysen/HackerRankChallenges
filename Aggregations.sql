# The Blunder

# Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboards 0 key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

# Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.

# Note: Salary is per month.

# Constraints Salaries are in (1000, 100000)

WITH salaries AS (
    SELECT salary, REPLACE(salary, "0", "") AS noZerosSalary
    FROM employees)
SELECT CONVERT(INT, CEILING(AVG(CONVERT(FLOAT,salary)) - AVG(CONVERT(FLOAT, noZerosSalary))))
FROM salaries;

# Japan Population

# Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

SELECT SUM(population) FROM city WHERE countrycode = "JPN";

# Population Density Difference

# Query the difference between the maximum and minimum populations in CITY.

SELECT MAX(population) - MIN (population) FROM city;