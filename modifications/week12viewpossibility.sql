CREATE OR REPLACE VIEW passenger_rewards AS
SELECT CASE 
		WHEN COUNT(b.passenger_id) >= 30 THEN 'Platinum'
		WHEN COUNT(b.passenger_id) >= 20 THEN 'Gold' 
        WHEN COUNT(b.passenger_id) >= 10 THEN 'Silver'
        ELSE 'No Status'
		END AS 'Status'
,      SUM(CASE WHEN b.passenger_id IS NULL THEN 0 ELSE 1 END) AS 'Number of Flights'
,      p.firstname AS 'First Name'
,      p.lastname AS 'Last Name'
FROM   passenger p
LEFT JOIN passengerdetails pd
ON     p.passenger_id = pd.passenger_id
LEFT JOIN booking b
ON     p.passenger_id =  b.passenger_id
LEFT JOIN flight f
ON     b.flight_id = f.flight_id
LEFT JOIN airport a
ON     f.from = a.airport_id
LEFT JOIN airport_geo ag
ON     a.airport_id = ag.airport_id
WHERE  (ag.country = 'United Kingdom' AND pd.country = 'United Kingdom')
OR      (b.passenger_id IS NULL AND pd.country IS NULL)
OR      (b.passenger_id IS NULL AND pd.country = 'United Kingdom')
GROUP BY p.firstname
,        p.lastname
,        MONTH(f.departure)
ORDER BY COUNT(b.passenger_id) DESC;
