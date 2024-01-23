
/* 
A median is defined as a number separating the higher half of a data set from the lower half.
 Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.
*/
--MS SQL SERVER
SELECT DISTINCT
    CONVERT(DECIMAL (16, 4), PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY lat_n) OVER ())
FROM station
;

------

SELECT DISTINCT
    CONVERT(DECIMAL (16, 4), PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY lat_n) OVER ())
FROM station
;