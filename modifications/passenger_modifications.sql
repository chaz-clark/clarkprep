INSERT INTO passenger
(passportno, firstname, lastname)
VALUES
('123454678','Emma','Wright'),
('987654321','Liam','Carter'),
('564738291','Sophie','Adams'),
('102938475','James','Thompson'),
('657483920','Olivia','Harris');


INSERT INTO passengerdetails
(passenger_id, birthdate, street, city, zip, country)
VALUES
( (SELECT passenger_id FROM passenger WHERE CONCAT(firstname, ' ',lastname) = 'Olivia Harris')
, '1995-05-05'
, '121 Greenfield Drive'
, 'Glasgow'
, 9832
, 'United Kingdom'
),
( (SELECT passenger_id FROM passenger WHERE CONCAT(firstname, ' ',lastname) = 'James Thompson')
, '1978-11-10'
, '22 Riverbank Road'
, 'Edinburgh'
, 2456
, 'United Kingdom'
),
( (SELECT passenger_id FROM passenger WHERE CONCAT(firstname, ' ',lastname) = 'Liam Carter')
, '1985-02-23'
, '15 Oakwood Avenue'
, 'Manchester'
, 5310
, 'United Kingdom'
),
( (SELECT passenger_id FROM passenger WHERE CONCAT(firstname, ' ',lastname) = 'Emma Wright')
, '1990-04-14'
, '42 High Street'
, 'London'
, 1562
, 'United Kingdom'
);

