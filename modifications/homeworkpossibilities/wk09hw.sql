-- week 9 questions
USE airportdb;

-- ---------------------------------------------------------------------------
-- 1. What are the flight details for flight AL9073 (flight id #93)?
--    The columns should look like the following:
--    | Flight Number | From | To | Departure Date | Arrival Date |
-- ---------------------------------------------------------------------------


-- ---------------------------------------------------------------------------
-- 2. How many passengers are on flight AL9073 (flight id #93)?
--    Tell me whether or not the flight is full.
--    Code an example with seats available and when it is full
--    This should be done in one query.
--    A `group by` clause shouldn't be used.
--    The columns should look like the following:
--    | Flight Number | From | To | Plane Capacity | Original Number of Passengers | Seats Remaining | Full FLight Number of Passengers | Seats Remaining |
-- ---------------------------------------------------------------------------


-- -------------------------------------------------------------------------------
-- 3. How many flights are on each day that are contained within the U.S.?
--    These flights depart from a city in the U.S. and arrives at a U.S. city
--    The columns should look like the following:
--    | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday |
-- -------------------------------------------------------------------------------


-- ---------------------------------------------------------------------------
-- 4. List the number of passengers each flight serviced within the U.S.
--    Sort by total number of passengers from greatest to least
--    The activity column consists of a case statement with the
--    following conditions:
--    - If 10,000 or more, state "High Activity"
--    - If 5,000 or more, state "Moderate Activity"
--    - If less than 5,000, state "Low Activity"
--    The columns should look like the following:
--    | Flight Number | From | To | Activity | Number of Passengers |
-- ---------------------------------------------------------------------------

