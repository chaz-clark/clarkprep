-- Chapter 3 questions
USE sakila;
-- ------------------------------------------------------------------------
-- 1. Write the SQL statement that retrieves the 
-- actor ID, first name, and last name for all actors. 
-- Sort results by last name and then by first name.
-- ------------------------------------------------------------------------


-- ------------------------------------------------------------------------
-- 2. Write the SQL statement that retrieves the 
-- actor ID, first name, and last name for all actors 
-- whose last name equals 'WILLIAMS' or 'DAVIS'.
-- ------------------------------------------------------------------------


-- ------------------------------------------------------------------------
-- 3. Write a query against the rental table that returns
-- the IDs of the customers who rented a film on July 5, 2005 
-- (use the rental.rental_date column, and you can use the date() function 
-- to ignore the time component). 
-- Include a single row for each distinct customer ID.
-- ------------------------------------------------------------------------


-- ------------------------------------------------------------------------
-- 4. Fill in the blanks in the following SQL statement
-- SELECT   c.email, r.return_date
-- FROM     customer c INNER JOIN rental <1>
-- ON       c.customer_id = <2>
-- WHERE    date(r.rental_date) = '2005-06-14'
-- ORDER BY <3> <4>;
-- ------------------------------------------------------------------------


-- ------------------------------------------------------------------------
-- 5. Write the SQL statement that retrieves the unique 
-- actor last name values for all actors. 
-- Sort results by last name.
-- ------------------------------------------------------------------------

