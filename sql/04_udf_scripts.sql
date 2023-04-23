-- User defined functions

CREATE OR REPLACE FUNCTION cityAverageStars(city varchar)
RETURNS number
AS
$$
SELECT AVG(b.STARS)
FROM BUSINESSES b
WHERE b.CITY = city
GROUP BY b.CITY
$$;

SELECT cityAverageStars('Las Vegas');

CREATE OR REPLACE FUNCTION cityReputation(city varchar)
RETURNS TABLE(City varchar,ReviewCount number, AverageStars number)
AS
$$
SELECT b.CITY, SUM(b.REVIEW_COUNT), AVG(b.STARS)
FROM BUSINESSES b
WHERE b.CITY = city
GROUP BY b.CITY
$$;


SELECT * FROM TABLE(cityReputation('Las Vegas'));