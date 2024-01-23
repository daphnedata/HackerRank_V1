/*
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
 happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.
*/

SELECT FORMAT (ABS(MAX(LAT_N)) - ABS(MIN(LAT_N)) + 
            (ABS(MAX(LONG_W)) - ABS(MIN(LONG_W))), 'F4')
FROM STATION
;