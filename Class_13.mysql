

#1
INSERT INTO sakila.customer
(store_id, first_name, last_name, email, address_id, active, create_date, last_update)
VALUES(1, 'pepe', 'botella', '', (SELECT address_id from address, city , country 
WHERE city.city_id=address.city_id 
AND city.country_id = country.country_id 
AND country.country = 'United States' 
order by address_id DESC 
LIMIT 1) , 1, CURRENT_TIMESTAMP , CURRENT_TIMESTAMP);

#2
SELECT address_id from address, city , country 
WHERE city.city_id=address.city_id 
AND city.country_id = country.country_id 
AND country.country = 'United States' 
order by address_id DESC 
LIMIT 1;

SELECT first_name from customer
WHERE address_id = 599
;

INSERT INTO rental(rental_date,inventory_id,customer_id,staff_id)
  VALUES (
        CURRENT_DATE(),
        (SELECT inventory_id FROM inventory INNER JOIN film USING
(film_id) WHERE title = "ZOOLANDER FICTION" LIMIT 1),
        (SELECT customer_id FROM customer WHERE store_id = 2 LIMIT 1),
        (SELECT staff_id FROM staff WHERE store_id = 2 LIMIT 1));

#3
UPDATE film
  SET release_year =
 (CASE
  WHEN rating = "G" THEN 2000
  WHEN rating = "PG" THEN 2002
  WHEN rating = "PG-13" THEN 2004
  WHEN rating = "R" THEN 2006
  WHEN rating = "NC-17" THEN 2008
  END);
#4
UPDATE rental, inventory, film
SET return_date = CURRENT_DATE
WHERE rental.inventory_id =inventory.inventory_id  AND inventory.film_id = film.film_id  AND film.film_id = 80

SELECT film_id FROM film
INNER JOIN inventory using (film_id)
INNER JOIN rental USING (inventory_id)
ORDER BY rental.rental_date 
limit 1; 

#5
no te permite borrar debido a las relaciones de la table films con otras tablas

DELETE FROM film_actor
WHERE film_id = 1;

DELETE FROM film_category
WHERE film_id = 1;

DELETE FROM rental
WHERE inventory_id in (select inventory_id from inventory where film_id = 1);

DELETE FROM inventory
WHERE film_id = 1;

DELETE FROM film
WHERE film_id = 1;

SELECT film_id , title from film; #esto es para probar si esta borrada 
         
 # 6        
SELECT inventory_id from inventory 
INNER JOIN rental USING (inventory_id)
WHERE rental.return_date is NOT NULL 
order by inventory_id 
LIMIT 1;

INSERT INTO sakila.rental
(rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES(CURRENT_DATE, 9, , '', 0, CURRENT_TIMESTAMP);         
         
