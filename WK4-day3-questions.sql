-- 1. List all customers who live in Texas (use JOINs)
--ANSWER-- No data

SELECT customer.customer_id, customer.first_name, customer.last_name
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
WHERE address = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's FullName
--ANSWER-- Douglas Graf, Mary Smith, Alfredo Mcadmas, Harold Martino, Peter, Menard, Alvin Deloach

SELECT first_name, last_name
FROM payment
JOIN customer on payment.customer_id = customer.customer_id
WHERE payment.amount > 6.99; 

-- 3. Show all customers names who have made payments over $175(use subqueries)
--ANSWER-- Mary Smith, Peter, Menard, Douglas Graf

SELECT first_name, last_name
From customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 5
    GROUP BY customer_id
    HAVING SUM(amount) > 175
    ORDER BY SUM(amount) DESC
);

-- 4. List all customers that live in Nepal (use the city table)
--ANSWER-- No data 
SELECT customer.first_name, customer.last_name
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
WHERE city = 'Nepal';


-- 5. Which staff member had the most transactions?
--ANSWER-- Mike Hillyer

SELECT  first_name, last_name
FROM staff
INNER JOIN payment ON customer_id = payment.customer_id
GROUP BY first_name, last_name
ORDER BY COUNT(payment.payment_id) DESC
LIMIT 1; 

-- 6. How many movies of each rating are there?
--ANSWER--G= 178 PG= 194 PG-13= 224 R = 196 NC-17 = 209

SELECT rating, COUNT (*) AS count_of_movies
FROM film
GROUP BY rating
ORDER BY rating;

--7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
--ANSWER-- customer_ID- 342,  343, 467, 567

SELECT customer_id
FROM payment 
WHERE payment_id IN (
    SELECT payment_id
    FROM payment
    WHERE amount > 6.99
)    
GROUP BY customer_id
HAVING COUNT(payment_id) =1;

-- 8. How many free rentals did our stores give away?
--ANSWER-- 0

SELECT COUNT (*) AS free_rental_count
FROM rental
WHERE rental_id = 0;

