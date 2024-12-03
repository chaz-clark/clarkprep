-- ---------------------------------------------------------------------------
-- 1. Who are our frequent fliers that reside in the U.K. and have flown
--    somewhere in the world from the U.K.?
--    Show their status as 'Platinum', 'Gold', 'Silver', or 'No Status' 
--    based on the number of flights they have taken.
--    The conditions are as follows
--    - Platinum: 30 or more flights
--    - Gold: 20 or more flights
--    - Silver: 10 or more flights
--    - No Status: Less than 10 flights
--    List the number of flights they have taken.
--    Group by departure month.
--    The columns should look like the following:
--    | Status | Number of Flights | First Name | Last Name |
-- ---------------------------------------------------------------------------
SELECT CASE 
		WHEN COUNT(p.passenger_id) >= 30 THEN 'Platinum'
		WHEN COUNT(p.passenger_id) >= 20 THEN 'Gold' 
        WHEN COUNT(p.passenger_id) >= 10 THEN 'Silver'
        ELSE 'No Status'
		END AS 'Status'
,      COUNT(p.passenger_id) AS 'Number of Flights'
,      p.firstname AS 'First Name'
,      p.lastname AS 'Last Name'
FROM   passenger p
INNER JOIN passengerdetails pd
ON     p.passenger_id = pd.passenger_id
LEFT JOIN booking b
ON     p.passenger_id =  b.passenger_id
LEFT JOIN flight f
ON     b.flight_id = f.flight_id
LEFT JOIN airport a
ON     f.from = a.airport_id
LEFT JOIN airport a2
ON     f.to = a2.airport_id
LEFT JOIN airport_geo ag
ON     a.airport_id = ag.airport_id
LEFT JOIN airport_geo ag2
ON     a2.airport_id = ag2.airport_id
WHERE  ag.country = 'United Kingdom'
AND    pd.country = 'United Kingdom'
GROUP BY p.firstname
,        p.lastname
,        MONTH(f.departure)
ORDER BY COUNT(b.passenger_id) DESC;


-- --------------------------------------------------------------
-- 2. Who in the 'no status' section from the previous query
--    have never flown?
--    Columns will look like the following:
--    | Status | Number of Flights | First Name | Last Name |
-- --------------------------------------------------------------
SELECT CASE 
		WHEN COUNT(p.passenger_id) > 30 THEN 'Platinum'
		WHEN COUNT(p.passenger_id) > 20 THEN 'Gold' 
        WHEN COUNT(p.passenger_id) > 10 THEN 'Silver'
        ELSE 'No Status'
		END AS 'Status'
,      COUNT(p.passenger_id) AS 'Number of Flights'
,      p.firstname AS 'First Name'
,      p.lastname AS 'Last Name'
FROM   passenger p
INNER JOIN passengerdetails pd
ON     p.passenger_id = pd.passenger_id
LEFT JOIN booking b
ON     p.passenger_id =  b.passenger_id
LEFT JOIN flight f
ON     b.flight_id = f.flight_id
LEFT JOIN airport a
ON     f.from = a.airport_id
LEFT JOIN airport a2
ON     f.to = a2.airport_id
LEFT JOIN airport_geo ag
ON     a.airport_id = ag.airport_id
LEFT JOIN airport_geo ag2
ON     a2.airport_id = ag2.airport_id
WHERE  ag.country = 'United Kingdom'
AND    pd.country = 'United Kingdom'
GROUP BY p.firstname
,        p.lastname
,        MONTH(f.departure)
HAVING   COUNT(b.passenger_id) = 0
ORDER BY COUNT(b.passenger_id) DESC;


-- --------------------------------------------------------------------------------
-- 3. Who has never flown and doesn't have any records in our
--    passenger details table?
--    | Status | Number of Flights | First Name | Last Name | Passenger Country |
-- --------------------------------------------------------------------------------
SELECT CASE 
		WHEN COUNT(p.passenger_id) > 30 THEN 'Platinum'
		WHEN COUNT(p.passenger_id) > 20 THEN 'Gold' 
        WHEN COUNT(p.passenger_id) > 10 THEN 'Silver'
        ELSE 'No Status'
		END AS 'Status'
,      COUNT(p.passenger_id) AS 'Number of Flights'
,      p.firstname AS 'First Name'
,      p.lastname AS 'Last Name'
,      pd.country AS 'Passenger Country'
FROM   passenger p
INNER JOIN passengerdetails pd
ON     p.passenger_id = pd.passenger_id
LEFT JOIN booking b
ON     p.passenger_id =  b.passenger_id
LEFT JOIN flight f
ON     b.flight_id = f.flight_id
LEFT JOIN airport a
ON     f.from = a.airport_id
LEFT JOIN airport a2
ON     f.to = a2.airport_id
LEFT JOIN airport_geo ag
ON     a.airport_id = ag.airport_id
LEFT JOIN airport_geo ag2
ON     a2.airport_id = ag2.airport_id
WHERE  ag.country = 'United Kingdom'
AND    pd.country = 'United Kingdom'
AND    pd.passenger_id IS NULL
GROUP BY p.firstname
,        p.lastname
,        MONTH(f.departure)
HAVING   COUNT(b.passenger_id) = 0
ORDER BY COUNT(b.passenger_id) DESC;