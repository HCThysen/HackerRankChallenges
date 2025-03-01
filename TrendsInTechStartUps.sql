-- Howdy! It’s your first day as a TechCrunch reporter. Your first task is to write an article on the rising trends in the startup world.

-- Calculate the total number of companies in the table.
SELECT COUNT(DISTINCT(name))
FROM startups;

-- We want to know the total value of all companies in this table.
SELECT SUM(valuation)
FROM startups;

-- What is the highest amount raised by a startup?
SELECT MAX(raised)
FROM startups;

-- Edit the query so that it returns the maximum amount of money raised, during ‘Seed’ stage.
SELECT MAX(raised)
FROM startups
WHERE stage = 'Seed';

-- In what year was the oldest company on the list founded?
SELECT MIN(founded)
FROM startups;

-- Let's find out the valuations among different sectors:
-- Return the average valuation by category.
SELECT category, AVG(valuation)
FROM startups
GROUP BY category;

-- Round to two decimal points
SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY category;

-- Lastly, order the list from highest averages to lowest.
SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY category
ORDER BY 2 DESC;

-- What are the most competitive markets?
-- First, return the name of each category with the total number of companies that belong to it.
SELECT category, COUNT(*)
FROM startups
GROUP BY category;

-- Next, filter the result to only include categories that have more than three companies in them.
SELECT category, COUNT(*)
FROM startups
GROUP BY category
HAVING COUNT(*) > 3;

-- Let's see if there's a difference in startups sizes among different locations:
-- What is the average size of a startup in each location?
SELECT location, AVG(employees)
FROM startups
GROUP BY location;

-- What is the average size of a startup in each location, with average sizes above 500?
SELECT location, AVG(employees)
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;