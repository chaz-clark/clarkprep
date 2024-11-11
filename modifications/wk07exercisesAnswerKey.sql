-- Chapter 3 questions
USE sakila;
-- ------------------------------------------------------------------------
-- 1. Write the SQL statement that retrieves the 
-- actor ID, first name, and last name for all actors. 
-- Sort results by last name and then by first name.
-- ------------------------------------------------------------------------
SELECT a.actor_id
,      a.first_name
,      a.last_name
FROM   actor a
ORDER BY a.last_name, a.first_name;

-- ------------------------------------------------------------------------
-- 2. Write the SQL statement that retrieves the 
-- actor ID, first name, and last name for all actors 
-- whose last name equals 'WILLIAMS' or 'DAVIS'.
-- ------------------------------------------------------------------------
SELECT a.actor_id
,      a.first_name
,      a.last_name
FROM   actor a
WHERE  a.last_name IN ('WILLIAMS', 'DAVIS');

-- ------------------------------------------------------------------------
-- 3. Write a query against the rental table that returns
-- the IDs of the customers who rented a film on July 5, 2005 
-- (use the rental.rental_date column, and you can use the date() function 
-- to ignore the time component). 
-- Include a single row for each distinct customer ID.
-- ------------------------------------------------------------------------
SELECT DISTINCT r.customer_id
FROM   rental r
WHERE  DATE(r.rental_date) = '2005-07-05';

-- ------------------------------------------------------------------------
-- 4. Fill in the blanks in the following SQL statement
-- SELECT   c.email, r.return_date
-- FROM     customer c INNER JOIN rental <1>
-- ON       c.customer_id = <2>
-- WHERE    date(r.rental_date) = '2005-06-14'
-- ORDER BY <3> <4>;
-- ------------------------------------------------------------------------
SELECT c.email
,      r.return_date
FROM   customer C INNER JOIN rental r
ON     c.customer_id = r.customer_id
WHERE  DATE(r.rental_date) = '2005-06-14'
ORDER BY c.customer_id DESC;

-- ------------------------------------------------------------------------
-- 5. Write the SQL statement that retrieves the unique 
-- actor last name values for all actors. 
-- Sort results by last name.
-- ------------------------------------------------------------------------
SELECT DISTINCT a.last_name
FROM   actor a
ORDER BY last_name;

-- Chapter 4 questions

-- +------------+-------------+--------+--------------------+
-- | payment_id | customer_id | amount | date(payment_date) |
-- +------------+-------------+--------+--------------------+
-- |        101 |           4 |   8.99 | 2005-08-18         |
-- |        102 |           4 |   1.99 | 2005-08-19         |
-- |        103 |           4 |   2.99 | 2005-08-20         |
-- |        104 |           4 |   6.99 | 2005-08-20         |
-- |        105 |           4 |   4.99 | 2005-08-21         |
-- |        106 |           4 |   2.99 | 2005-08-22         |
-- |        107 |           4 |   1.99 | 2005-08-23         |
-- |        108 |           5 |   0.99 | 2005-05-29         |
-- |        109 |           5 |   6.99 | 2005-05-31         |
-- |        110 |           5 |   1.99 | 2005-05-31         |
-- |        111 |           5 |   3.99 | 2005-06-15         |
-- |        112 |           5 |   2.99 | 2005-06-16         |
-- |        113 |           5 |   4.99 | 2005-06-17         |
-- |        114 |           5 |   2.99 | 2005-06-19         |
-- |        115 |           5 |   4.99 | 2005-06-20         |
-- |        116 |           5 |   4.99 | 2005-07-06         |
-- |        117 |           5 |   2.99 | 2005-07-08         |
-- |        118 |           5 |   4.99 | 2005-07-09         |
-- |        119 |           5 |   5.99 | 2005-07-09         |
-- |        120 |           5 |   1.99 | 2005-07-09         |
-- +------------+-------------+--------+--------------------+

-- --------------------------------------------------------------------------
-- 6. Write the SQL statement that will retrieve the
-- payment ids with the following filter:
-- customer_id <> 5 AND (amount > 8 OR date(payment_date) = '2005-08-23')
-- --------------------------------------------------------------------------
SELECT p.payment_id
,      customer_id
,      amount
,      DATE(payment_date) AS 'Payment Date'
FROM   payment p
WHERE  p.customer_id <> 5
AND    (p.amount > 8 OR DATE(p.payment_date) = '2005-08-23');

-- --------------------------------------------------------------------------
-- 7. Construct a query that retrieves all rows from the payments table 
-- where the amount is either 1.98, 7.98, or 9.98.
-- --------------------------------------------------------------------------
SELECT p.payment_id
,      p.customer_id
,      p.amount
,      DATE(p.payment_date) AS 'Payment Date'
FROM   payment p
WHERE  p.amount IN (1.98, 7.98, 9.98);

-- --------------------------------------------------------------------------
-- 8. Construct a query that finds all customers whose last name contains 
-- an A in the second position and a W anywhere after the A.
-- --------------------------------------------------------------------------
SELECT c.first_name
,      c.last_name
FROM   customer c
WHERE  c.last_name LIKE '_A%W%';