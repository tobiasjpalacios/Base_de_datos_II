#1  

SELECT CONCAT(first_name, ' ',last_name), address , city from customer
INNER JOIN address USING (address_id)
INNER JOIN city USING (city_id)
;


#2
SELECT title as titulo, name as lenguaje  , CASE 
  WHEN rating = "G" THEN "General Audiencies "
  WHEN rating = "PG" THEN "Parental Guidance Suggested"
  WHEN rating = "PG-13" THEN "Parental Strongly Cautioned"
  WHEN rating = "R" THEN "Restricted"
  WHEN rating = "NC-17" THEN "Adults only" 
 END as rating
from film 
INNER JOIN `language` USING (language_id); 

#3

SELECT title , release_year from film 
INNER JOIN film_actor USING (film_id)
INNER JOIN actor USING (actor_id)
WHERE first_name =  UPPER("ED")
AND last_name =  UPPER("Chase");

#4
SELECT title, first_name, CASE
	WHEN return_date IS NULL THEN "no"
	WHEN return_date IS NOT NULL THEN "yes"
END as returned 
FROM rental 
INNER JOIN inventory USING (inventory_id)
INNER JOIN film USING (film_id)
INNER JOIN customer USING (customer_id);

#5     

/* 
 * Tanto Cast como Convert Cumplen la misma funcion. la de convertir 
 * un valor determinado a un tipo de datos a eleccion 
 */

SELECT CONVERT((SELECT rental_duration FROM film 
ORDER by film_id
LIMIT 1),CHAR);

SELECT CAST("14:06:10" AS TIME); 

#6
/* 
 * estas funciones tiene como objetivo remplazar los valores nulos por un valor
 * a la hora de mostrarlos 
 */

SELECT title, first_name, IFNULL(return_date, "no devuelta") as " Fecha de devolucion"
FROM rental 
INNER JOIN inventory USING (inventory_id)
INNER JOIN film USING (film_id)
INNER JOIN customer USING (customer_id);

SELECT title, first_name, COALESCE(return_date, "no devuelta") as " Fecha de devolucion"
FROM rental 
INNER JOIN inventory USING (inventory_id)
INNER JOIN film USING (film_id)
INNER JOIN customer USING (customer_id);


