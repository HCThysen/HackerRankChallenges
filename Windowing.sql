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

