




-- works but doesn't look great and doesn't set a single station with min(lat) and min(long) [result: 184.1616]

DECLARE @a FLOAT;
DECLARE @b FLOAT;
DECLARE @c FLOAT;
DECLARE @d FLOAT;
DECLARE @distance FLOAT;

SET @a = (SELECT MIN(lat_n) FROM station);
SET @b = (SELECT MAX(lat_n) FROM station);
SET @c = (SELECT MIN(long_w) FROM station);
SET @d = (SELECT MAX(long_w) FROM station);
SET @distance = SQRT(SQUARE(@a - @b) + SQUARE(@c - @d));

SELECT FORMAT(@distance, 'F4');





-- works but doesn't set a single station with min(lat) and min(long) [result: 184.1616]

SELECT FORMAT(SQRT(POWER(MIN(LAT_N)-MAX(LAT_N), 2) + POWER(MIN(LONG_W)-MAX(LONG_W), 2)), 'F4') FROM STATION;


-- doesn't work for the sake of the exercise however is more realistic:


/*
While [this solution](https://www.hackerrank.com/challenges/weather-observation-station-19/forum/comments/324275)
 works for MS SQL I have another question I need help with:

In the solution we declare the minium lat_n and minimum long_w from the whole database
so potentially the lat_n and long_w of 2 different stations.
 This works for the sake of the exercise.
 However, I think a more realistic scenario would be to find the station
 with the min(lat_n) and min(long_w) available in the table.
 I can't wrap my head around how to declare a varaible that would take into account those 2 aggregate functions.
I went through with my idea of finding the station that had the lowest latitude and lowest longitude.
The exercise is just not possible to solve that way because there is not a single station that meet these criteria.
Here's the query I used to find out about this:
 */

WITH
cte_min_lat AS (SELECT min(lat_n) as min_lat_n FROM station),
cte_min_long AS ( SELECT min(long_w) as min_long_w FROM station)

SELECT *
FROM station
LEFT JOIN cte_min_lat ON station.lat_n = cte_min_lat.min_lat_n
LEFT JOIN cte_min_long ON station.long_w = cte_min_long.min_long_w
WHERE cte_min_lat.min_lat_n IS NOT NULL OR cte_min_long.min_long_w IS NOT NULL

/*
Here's the output of the query:
743 De Tour Village MI 25.41948948 25.10565434 
649 Pengilly MN 25.07352606 154.06429180
So no result meets the criterium of having both lowest lat_n and lowest long_w. */
