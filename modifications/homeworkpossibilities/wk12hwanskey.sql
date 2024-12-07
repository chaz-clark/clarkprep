-- Background:
-- You have been hired by BYU-I Air to help sort through the airportdb database. 
-- Each week you will receive a file from your manager with questions that 
-- need answered by writing queries against the database. 
-- This week your manager wants you to understand what views and CTE expressions are. 

-- week 12 questions
USE airportdb;

-- Thought: Take questions from week 10 and 11 and modify them to use CTE statement
-- ---------------------------------------------------------------------------------
-- 1. Create a view from week 10 question 1. Make a table based on that view
--    named `passengerrewards`. Provide a select statement that queries the table.
--    DO NOT use a select * statement.
--    The columns should look like the following:
--    | Status | Number of Flights | First Name | Last Name |
-- ---------------------------------------------------------------------------------

SELECT pr.status
,      pr.number_of_flights
,      pr.first_name
,      pr.last_name
FROM   passengerrewards pr;

-- --------------------------------------------------------------------------------------------------------
-- 2. Rewrite the question from week 11 question 5 to use a CTE statement.
--    List the following columns:
--    | Flight Number | From | To | Activity | Number of Passengers | Total Revenue | Average Revenue |
-- --------------------------------------------------------------------------------------------------------
WITH 
(SELECT CASE 
			WHEN COUNT(b.passenger_id) > 10000 THEN 'High Activity' 
			WHEN COUNT(b.passenger_id) BETWEEN 5000 AND 10000 THEN 'Medium Activity'
			WHEN COUNT(b.passenger_id) BETWEEN 1000 AND 5000 THEN 'Low Activity'
			WHEN COUNT(b.passenger_id) < 1000 THEN 'Very Low Activity'
		END AS 'Activity'
,       COUNT(b.passenger_id) AS 'Number of Passengers'
,       CONCAT('$', FORMAT(SUM(b.price), 2)) AS 'Total Revenue'
,       CONCAT('$', FORMAT(SUM(b.price) / COUNT(b.passenger_id),2)) AS 'Average Revenue'
FROM    booking b) AS counts
SELECT f.flightno AS 'Flight Number'
,      CONCAT(ag.city, ', ', ag.country) AS 'From'
,      CONCAT(ag2.city, ', ', ag2.country) AS 'To'
,      counts.Activity
,      counts.'Number of Passengers'
,      counts.'Total Revenue'
,      counts.'Average Revenue'
FROM   flight f
INNER JOIN airport a
ON     f.from = a.airport_id
INNER JOIN airport a2
ON     f.to = a2.airport_id
INNER JOIN airport_geo ag
ON     a.airport_id = ag.airport_id
INNER JOIN airport_geo ag2
ON     a2.airport_id = ag2.airport_id
WHERE  ag.country = 'United States'
AND     ag2.country = 'United States'
GROUP BY f.flightno
,        CONCAT(ag.city, ', ', ag.country)
,        CONCAT(ag2.city, ', ', ag2.country);