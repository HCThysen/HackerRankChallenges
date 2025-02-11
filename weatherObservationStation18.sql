# https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true
# Consider P1(a,b) and P2(c,d) to be two points on a 2D plane where (a,c) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (b,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
# Query the Manhattan Distance between points P1 and P2 and format your answer to display 4 decimal digits.
SELECT ROUND(MAX(LONG_W) - MIN(LONG_W) + MAX(LAT_N) - MIN(LAT_N), 4) FROM STATION;

# Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
# Query the Equclidian Distance between points P1 and P2 and format your answer to display 4 decimal digits.
SELECT ROUND(SQRT(POWER(MIN(LAT_N)-MAX(LAT_N),2)+POWER(MIN(LONG_W)-MAX(LONG_W),2)), 4) FROM station;

# A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
SELECT ROUND(MEDIAN(LAT_N), 4) FROM station