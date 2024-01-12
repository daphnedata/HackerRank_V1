/*
Generate the following two result sets:
    Query an alphabetically ordered list of all names in OCCUPATIONS,
    immediately followed by the first letter of each profession as a parenthetical
    (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
    Query the number of ocurrences of each occupation in OCCUPATIONS.
    Sort the occurrences in ascending order, and output them in the following format:
    There are a total of [occupation_count] [occupation]s.
    where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS
    and [occupation] is the lowercase occupation name.
    If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
*/

SELECT CONCAT(name, '(', SUBSTR(occupation, 1, 1), ')') AS concat_name
-- substr function is space sensitive, unlike concat
FROM occupations
ORDER BY name ASC
;

SELECT CONCAT ('There are a total of ', (SELECT COUNT(occupation)), ' ', LOWER (occupation), 's.')
FROM occupations
GROUP BY occupation
ORDER BY (SELECT COUNT(occupation)) ASC, occupation ASC
;