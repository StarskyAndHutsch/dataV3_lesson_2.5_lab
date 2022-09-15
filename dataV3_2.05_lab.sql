-- DATAV3 2.05 LAB

USE sakila;


-- INSTRUCTIONS
-- Select all the actors with the first name ‘Scarlett’.
SELECT 
    *
FROM
    sakila.actor
WHERE
    first_name = 'Scarlett';

-- How many films (movies) are available for rent and how many films have been rented?

SELECT 
    COUNT(DISTINCT inventory_id)
FROM
    Sakila.rental;
SELECT 
    COUNT(DISTINCT rental_id)
FROM
    Sakila.rental;


-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT 
    MIN(length) AS min_duration,
    MAX(length) AS max_duration
FROM
    sakila.film;


-- What's the average movie duration expressed in format (hours, minutes)?
SELECT 
    AVG(length)
FROM
    sakila.film
GROUP BY 'HH:MM';

SELECT 
    SEC_TO_TIME(ROUND(AVG(length) * 60, 0))
FROM
    sakila.film;

-- How many distinct (different) actors' last names are there?
SELECT 
    COUNT(DISTINCT last_name)
FROM
    sakila.actor;
-- ORDER BY 'last_name' DESC;


-- Since how many days has the company been operating (check DATEDIFF() function)?
SELECT 
    create_date,
    DateDiff(DAY,MAX(create_date), MIN(create_date)) AS DateDiff
FROM
    sakila.customer
ORDER BY customer_id;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT 
   rental_duration, CONVERT( rental_duration, DATE)
FROM
    sakila.film;


-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT WEEKDAY(CURDATE())
   -- rental_date, CONVERT( rental_date, DATE)
FROM
    sakila.rental;

-- Get release years.
SELECT 
    release_year
FROM
    sakila.film;


-- Get all films with ARMAGEDDON in the title.
SELECT 
    *
FROM
    sakila.film
WHERE
    title LIKE '%RMAGEDDO%';

-- Get all films which title ends with APOLLO.
SELECT 
	*
FROM
    sakila.film
WHERE 
title LIKE '%APOLLO';

-- Get 10 the longest films.
SELECT 
    length
FROM
    sakila.film
WHERE
    length > 90
LIMIT 10;


-- How many films include Behind the Scenes content?
SELECT 
    COUNT(special_features)
FROM
    sakila.film
WHERE
    special_features LIKE '%Behind the Scenes%';