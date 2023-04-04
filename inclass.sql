-- --select all from actor
-- SELECT * FROM actor;
-- SELECT first_name, last_name FROM actor;
-- SELECT first_name, last_name from actor WHERE last_name = 'Hart';


-- --like class
-- SELECT first_name, last_name from actor WHERE last_name LIKE 'H%';

-- SELECT * FROM payment;

-- SELECT customer_id, amount FROM payment WHERE amount > 5;


-- SELECT customer_id, amount from payment WHERE amount > 5 ORDER BY amount;

-- SELECT SUM(amount) from payment WHERE  amount > 5;


-- SELECT COUNT(DISTINCT amount) FROM payment WHERE amount > 5;


-- SELECT MIN(amount) FROM payment WHERE amount > 5;

-- --grouping

-- SELECT customer_id, SUM(amount) FROM payment WHERE amount > 5 GROUP BY customer_id;

-- SELECT customer_id,
--     SUM(amount)
-- FROM payment
-- WHERE amount > 5
-- GROUP BY customer_id
-- HAVING SUM(amount) > 100;






-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT first_name, last_name from actor WHERE last_name = 'Wahlberg';

--the answer is 2








-- 2. How many payments were made between $3.99 and $5.99?
SELECT * FROM payment WHERE amount BETWEEN 3.99 AND 5.99;

--when i ran this line, sql came back with "no data", if memory serves correct, this was one of the questions where the data got goofed.









-- 3. What film does the store have the most of? (search in inventory)
SELECT film_id FROM inventory;




-- 4. How many customers have the last name ‘William’?
SELECT * FROM customer;
SELECT first_name, last_name FROM customer WHERE last_name LIKE 'W%';

-- the answer is 0, theres a "Williams", but not "William"




-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id FROM rental ORDER BY staff_id;
--after scrolling through the list staff id 1 only takes up about 35% of scrolling where as staff id 2 takes up the rest, so therefor, staff id 2, has sold more




-- 6. How many different district names are there?
SELECT COUNT(DISTINCT district) AS number_of_districts FROM address;
--there are a total of 378 total distrinct districts





-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(*) AS number_of_actors FROM film_actor
GROUP BY film_id
ORDER BY number_of_actors DESC;
--the most actors in a single movie was for movie id 508, it had 15 actors in the movie





-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(*) AS number_of_customers FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';
--a total of 13 customers have a last name ending in 'es'






-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT payment.amount, COUNT(*) as number_of_payments FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
JOIN customer ON rental.customer_id = customer.customer_id
WHERE payment.amount IN (4.99, 5.99) AND customer.customer_id BETWEEN 380 AND 430
GROUP BY payment.amount
HAVING COUNT(*) > 250;
--I couldve done this wrong as we didnt go over the join method really, and i couldve missread docs, but from the code above, when i run it, i get 'no data', so my answer is no data






-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT COUNT(DISTINCT rating) as number_rating_categories, rating, COUNT(*) as num_movies
FROM film
GROUP BY rating
ORDER BY num_movies DESC;
--there are 5 different movie catagories

