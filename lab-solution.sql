USE sakila;
-- 1.How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name, count(film_id) AS film_num
FROM sakila.film_category as f
LEFT JOIN sakila.category as c
ON f.category_id = c.category_id
group by c.name;

-- 2.Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM payment;

SELECT s.first_name,sum(p.amount) AS total_amount
FROM sakila.payment as p
LEFT JOIN sakila.staff as s
ON p.staff_id = s.staff_id
WHERE month(p.payment_date) = 8
group by s.first_name;

-- 3.Which actor has appeared in the most films?
SELECT a.first_name,count(fa.actor_id) AS total_amount
FROM sakila.film_actor as fa
LEFT JOIN sakila.actor as a
ON fa.actor_id = a.actor_id
group by a.first_name
order by total_amount desc;

-- 4.Most active customer (the customer that has rented the most number of films)
SELECT * FROM sakila.customer;
SELECT * FROM sakila.rental;

SELECT concat(c.first_name,' ',c.last_name),count(r.rental_id) AS rental_num
FROM sakila.rental as r
LEFT JOIN sakila.customer as c
ON r.customer_id = c.customer_id
group by c.first_name
order by rental_num desc;

-- SELECT concat(c.first_name,' ',c.last_name)
-- FROM sakila.rental as r
-- LEFT JOIN sakila.customer as c
-- ON r.customer_id = c.customer_id
-- HAVING COUNT(r.rental_id) = max(count(r.rental_id));

-- 5.Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name,s.last_name,a.address
FROM sakila.staff as s
LEFT JOIN sakila.address as a
ON s.address_id = a.address_id;

-- 6.List each film and the number of actors who are listed for that film.

SELECT f.title,count(fa.actor_id) as actor_num
FROM sakila.film as f
LEFT JOIN sakila.film_actor as fa
ON f.film_id = fa.film_id
group by f.title;

-- 7.Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT concat(c.first_name,' ',c.last_name),sum(p.amount) as pay
FROM sakila.payment as p
LEFT JOIN sakila.customer as c
ON p.customer_id = c.customer_id
group by concat(c.first_name,' ',c.last_name)
order by c.last_name;

-- 8.List number of films per category
SELECT c.name, count(film_id) AS film_num
FROM sakila.film_category as f
LEFT JOIN sakila.category as c
ON f.category_id = c.category_id
group by c.name;

