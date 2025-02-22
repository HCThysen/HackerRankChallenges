-- Calculate the moving average of a value with a window size of 3 (order comes from ID)
SELECT ID, value, AVG(value) OVER(ORDER BY id ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS trailing_avg
FROM "movingAvg";

-- Calculate it with the center rather than lagged
SELECT ID, value, AVG(value) OVER(ORDER BY id ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS centered_mavg
FROM "movingAvg";

-- Calculate the moving median instead
SELECT ID, value, MEDIAN(value) OVER(ORDER BY id ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS centered_mmedian
FROM "movingAvg";

-- Calculate the moving average for each group such that there is no spillage from one group to the other
SELECT "group", id, value, AVG(value) OVER(PARTITION BY "Group"
    ORDER BY id ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as group_mavg
FROM "movingAvg2";

-- Create a column that shows the rank value for each group
SELECT id, "group", value, RANK() 
    OVER(PARTITION BY "group" 
    ORDER BY value ASC) as rank
FROM rank_table2;
-- NULL in this type of rank is treated as the largest
-- Equal values are given the same rank, but jumps that many numbers after

SELECT id, "group", value, RANK_DENSE() 
    OVER(PARTITION BY "group" 
    ORDER BY value ASC) as rank
FROM rank_table2;
-- the next is rank is given the number right after the rank with multiple values attached

SELECT id, "group", value, PERCENT_RANK() 
    OVER(PARTITION BY "group" 
    ORDER BY value ASC) as rank
FROM rank_table2;
--Gives the relative ranking from 0 to 1

-- create a (high medium low) grouping column that depends upon the sum of values in value1 and value2.
-- Low if the sum is strictly less than 20, medium if the value is bigger tahn 20 but strictly less than 40 and otherwise high
