# Ejercicios --------1 

SELECT first_name, last_name 
from actor a1
WHERE EXISTS (SELECT * FROM actor a2 WHERE a1.last_name = a2.last_name
AND a1.actor_id <> a2.actor_id)
ORDER by last_name;

# Ejercicos --------2 
SELECT first_name,last_name 
FROM actor a1 
WHERE NOT EXISTS (SELECT * 
                FROM film_actor a2 
                WHERE  a1.actor_id <> a2.actor_id) ; 

# Ejercicios -----------3           
SELECT DISTINCT r1.customer_id 
FROM rental r1
WHERE NOT EXISTS
(SELECT *
FROM rental r2 
WHERE r1.customer_id = r2.customer_id 
AND r1.rental_id <> r2.rental_id);
#Ejercicios------------4
SELECT DISTINCT c1.last_name
FROM rental r1 ,customer c1
WHERE EXISTS
(SELECT * 
FROM rental r2 
WHERE r1.customer_id = r2.customer_id 
AND r1.rental_id <> r2.rental_id);
#Ejercicios------------5
SELECT actor.first_name, last_name, film.title 
FROM actor, film, film_actor 
WHERE actor.actor_id = film_actor.actor_id
AND film_actor.film_id = film.film_id 
AND film.title IN("BETRAYED REAR","CATCH AMISTAD");
#Ejercicios------------6
SELECT first_name, last_name , title 
FROM actor, film, film_actor 
WHERE actor.actor_id=film_actor.actor_id 
AND film.film_id=film_actor.film_id 
AND film.title IN ('BETRAYED REAR') 
AND film.title NOT IN ('CATCH AMISTAD');
#Ejercicios------------7
SELECT first_name, last_name FROM actor
WHERE actor_id IN
(SELECT actor_id 
FROM film,film_actor 
WHERE film.film_id=film_actor.film_id 
AND film.title IN ('BETRAYED REAR')) 
AND actor_id IN (SELECT actor_id 
FROM film,film_actor 
WHERE film.film_id=film_actor.film_id 
AND film.title IN ('CATCH AMISTAD'));

#Ejercicios------------8
SELECT DISTINCT actor.first_name, last_name, film.title 
FROM actor, film, film_actor 
WHERE actor.actor_id = film_actor.actor_id 
AND film_actor.film_id = film.film_id 
AND film.title NOT IN("BETRAYED REAR","CATCH AMISTAD");


