USE sakila;
SELECT * FROM category;
SELECT * FROM film_category;

#1.How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT c.name AS category_name, COUNT(f.film_id) AS Number_of_films
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
Group BY c.name;

#2.Display the total amount rung up by each staff member in August of 2005.
SELECT s.first_name, s.last_name, SUM(p.amount) AS total_amount 
FROM payment p
JOIN staff s ON p.staff_id = s.staff_id
WHERE YEAR(p.payment_date) = 2005 AND MONTH(p.payment_date)= 08
GROUP by s.staff_id;

#3.Which actor has appeared in the most films?
SELECT * FROM film_actor;
SELECT * FROM actor;
SELECT a.first_name, a.last_name, COUNT(f.actor_id) AS number_of_films
FROM film_actor f
JOIN actor a ON a.actor_id = f.actor_id
GROUP BY a.actor_id
ORDER BY number_of_films DESC
LIMIT 1;

#4.Most active customer (the customer that has rented the most number of films)
SELECT * FROM customer;
SELECT * FROM rental;
SELECT c.first_name, c.last_name, COUNT(r.customer_id) AS number_of_rentals
FROM rental r
JOIN customer c ON c.customer_id = r.customer_id
GROUP BY r.customer_id
ORDER BY number_of_rentals DESC
LIMIT 1;

#5. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM address a
JOIN staff s ON s.address_id = a.address_id
GROUP BY s.address_id, s.first_name, s.last_name, a.address;

#6List each film and the number of actors who are listed for that film.
SELECT * FROM film_actor;
SELECT * FROM film;

SELECT f.title, COUNT(fa.film_id) AS number_of_actors
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.title;  


#7Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT * FROM payment;
SELECT * FROM customer;

SELECT c.last_name, SUM(p.amount) as total_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.last_name
ORDER BY c.last_name;

#8 List the titles of films per category.
SELECT * FROM film;
SELECT * FROM film_category;
SELECT * FROM category;

SELECT f.title, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON c.category_id = fc.category_id
GROUP BY f.film_id, f.title, category;



