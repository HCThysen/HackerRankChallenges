-- Let’s examine the three tables.
SELECT * FROM trips LIMIT 3;
SELECT * FROM riders LIMIT 3;
SELECT * FROM cars LIMIT 3;

-- Suppose we want to create a Trip Log with the trips and its users.
SELECT * 
FROM trips LEFT JOIN riders
  ON trips.rider_id = riders.id;

-- Suppose we want to create a link between the trips and the cars used during those trips.
SELECT * 
FROM trips JOIN cars
ON trips.car_id = cars.id;

-- The new riders data are in! There are three new users this month.
-- Stack the riders table on top of the new table named riders2.
SELECT *
FROM riders
UNION
SELECT * 
FROM riders2;

-- What is the average cost for a trip?
SELECT AVG(cost)
FROM trips;

-- Find all the riders who have used Lyft less than 500 times!
WITH all_riders AS (SELECT *
FROM riders
UNION
SELECT * 
FROM riders2)

SELECT *
FROM all_riders
WHERE total_trips < 500;

-- Calculate the number of cars that are active.
SELECT COUNT(*)
FROM CARS
WHERE status = 'active';

-- Write a query that finds the two cars that have the highest trips_completed.
SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;