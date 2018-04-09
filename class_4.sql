


# Ejercicio--------1

SELECT title,special_features
FROM film 
where rating ="PG-13";

# Ejercicio--------2

SELECT f1.title, f2.title, f1.`length` 
FROM film f1, film f2
WHERE f1.`length` <> f2.`length`;

# ejercicio--------3

SELECT title,rental_rate,replacement_cost from film 
WHERE replacement_cost BETWEEN 20.00 and 24.00;

# ejercicio -------4 
SELECT f.title, f.special_features, f.rental_rate, c.name
 FROM film f, film_category fc,  category c 
WHERE f.film_id = fc.film_id 
  AND fc.category_id = c.category_id
  AND f.special_features = "Behind the Scenes"

# Ejercicio-------5 

SELECT a.first_name,a.last_name from actor a,film_actor fa ,film f 
WHERE a.actor_id =fa.actor_id AND f.film_id = fa.film_id AND f.title ='ZOOLANDER FICTION'
  
# Ejercicio------6 

 SELECT address, city, country, store_id from store, city, address, country 
WHERE store.address_id = address.address_id 
AND address.city_id = city.city_id 
AND city.country_id = country.country_id 
AND store.store_id = 1;

# Ejercicio------7

SELECT DISTINCT f1.title , f2.title, f1.rating, f2.rating 
FROM film f1, film f2 
WHERE f1.rating = f2.rating;

# Ejercicio------8


SELECT DISTINCT film.title, staff.first_name, staff.last_name 
FROM film, inventory, store, staff 
WHERE film.film_id = inventory.film_id 
AND store.store_id = inventory.store_id 
AND store.store_id = 2 
AND staff.staff_id = store.manager_staff_id;


