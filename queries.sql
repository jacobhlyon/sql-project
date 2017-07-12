-- - For any episode, list the guests
-- - Which guest occupation was most popular?
-- - Which guest had the most appearances?
-- - What was the average number of guests per year for the years listed?
-- - For a given occupation, list the guests that match


#our queries are in pure SQL - we tested them with dummy data
#as we couldn't get our tables to populate
-- 1.
SELECT guests.name 
FROM guests 
INNER JOIN shows_guests
ON guests.id = shows_guests.guest_id
WHERE shows_guests.id = "id given";

-- 2.
SELECT guests.occupation
FROM guests
GROUP BY guests.occupatoin
ORDER BY COUNT (guests.occupation) DESC
LIMIT 1;

-- 3.
SELECT guests.name
FROM guests
INNER JOIN shows_guests
ON guests.id = shows_guests.guest_id
GROUP BY guests.name
ORDER BY COUNT (shows_guests.show_id) DESC
LIMIT 1;

-- Yura's Answer Below
-- SELECT guests.name
-- FROM guests
-- GROUP BY guests.name
-- ORDER BY COUNT (guests.name) DESC
-- LIMIT 1;

-- 4.
SELECT COUNT(shows_guests.guest_id)/COUNT(shows.year)
FROM shows_guests
INNER JOIN shows
ON shows_guests.show_id = shows.id;

-- 5.
SELECT guests.name
FROM guests
WHERE guests.occupation = "occupation given";