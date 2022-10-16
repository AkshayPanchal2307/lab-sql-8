USE sakila
-- Write a query to display for each store its store ID, city, and country.
     -- we need 4 tables store, address, city, country so three joins.

SELECT s.store_id, s.address_id FROM sakila.store as s
JOIN sakila.address as a
ON s.address_id = a.address_id;

SELECT ad.address_id, ad.city_id FROM sakila.address as a
JOIN sakila.city as b
ON b.city_id = a.city_id;

SELECT c.city_id, c.country_id FROM sakila.city as c
JOIN sakila.country as ct
ON ct.country_id = c.country_id;


SELECT ct.country, b.city, s.store_id FROM sakila.store as s
JOIN sakila.address as a
ON s.address_id = a.address_id
JOIN sakila.city as b
ON b.city_id = a.city_id
JOIN sakila.country as ct
ON ct.country_id = b.country_id;


-- Write a query to display how much business, in dollars, each store brought in.
Select * from sakila.payment;
Select * from sakila.store;

Select s.store_id, st.staff_id from sakila.store as s
Join sakila.staff as st
on s.store_id = st.store_id;

Select st.staff_id, count(p.amount) as total_amount from sakila.staff as st
join sakila.payment as p
on st.staff_id = p.staff_id
Group by staff_id;

Select s.store_id, count(p.amount) as total_amount from sakila.store as s
Join sakila.staff as st
on s.store_id = st.store_id
join sakila.payment as p
on st.staff_id = p.staff_id
Group by store_id;


-- Which film categories are longest?
SELECT * from category;

SELECT c.name, c.category_id from sakila.category as c
JOIN sakila.film_category as fc
on fc.category_id=c.category_id;

Select fc.film_id, avg(f.length) from sakila.film_category as fc
join sakila.film as f
on fc.film_id=f.film_id;


SELECT c.name, avg(f.length) as avg_length from sakila.category as c 
JOIN sakila.film_category as fc
on fc.category_id = c.category_id
join sakila.film as f
on fc.film_id = f.film_id
Group by c.name;


-- Display the most frequently rented movies in descending order.
   -- film, inventory, rental tables
Select i.film_id, f.title from sakila.film as f
join sakila.inventory as i
on i.film_id = f.film_id;

Select i.inventory_id, count(r.inventory_id) as frequency from sakila.inventory as i 
join sakila.rental as r 
on i.inventory_id=r.inventory_id
group by rental_id;

Select count(r.inventory_id) as frequency, f.title from sakila.film as f
join sakila.inventory as i
on i.film_id = f.film_id
join sakila.rental as r 
on i.inventory_id=r.inventory_id
group by title
Order by count(r.inventory_id) DESC;


-- List the top five genres in gross revenue in descending order

SELECT cat.name as category, count(fc.category_id) as films FROM sakila.category as cat
JOIN sakila.film_category as fc
ON cat.category_id = fc.category_id
GROUP BY cat.name
order by films DESC
LIMIT 5;


-- Is "Academy Dinosaur" available for rent from Store 1?

SELECT f.title, i.store_id, count(i.film_id)as availability from sakila.film as f
Join sakila.inventory as i
On f.film_id = i.film_id
Join sakila.rental as r
ON r.inventory_id = i.inventory_id
Where f.title LIKE "Academy Dinosaur" AND i.store_id = 1;


-- Get all pairs of actors that worked together.

SELECT f.title as film_title,
conca


-- Get all pairs of customers that have rented the same film more than 3 times



-- For each film, list actor that has acted in more films

SELECT fa.actor_id, f.title, a.last_name, count(fa.actor_id) as films_total from sakila.film_actor as fa
JOIN sakila.film as f
ON f.film_id = fa.film_id
JOIN sakila.actor as a
ON fa.actor_id = a.actor_id
GROUP BY fa.actor_id
HAVING films_total > 1;





