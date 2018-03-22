DROP TABLE IF EXISTS film ;
DROP TABLE IF EXISTS actor;
DROP TABLE IF EXISTS film_actor;

CREATE TABLE IF NOT EXISTS film
(id INT(11) NOT NULL ,
description TEXT,
release_year DATETIME );

CREATE TABLE IF NOT EXISTS actor
(id INT(11) NOT NULL,
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15) NOT NULL); 

ALTER TABLE actor
	ADD CONSTRAINT pk_actor_id PRIMARY KEY (id),
	MODIFY id INT(11) AUTO_INCREMENT ;


ALTER TABLE film
	ADD CONSTRAINT pk_film_id PRIMARY KEY (id),
	MODIFY id INT(11) AUTO_INCREMENT ;
	
CREATE TABLE film_actor 
(actor_id INT(11) NOT NULL,
film_id INT(11) NOT NULL);

ALTER TABLE film_actor ADD 
	CONSTRAINT fk_film_id 
	FOREIGN KEY (film_id) 
	REFERENCES film (id);

ALTER TABLE film_actor	ADD	
CONSTRAINT fk_actor_id 
FOREIGN KEY (actor_id)
REFERENCES actor (id);

ALTER TABLE actor ADD COLUMN last_update DATETIME ;
 
ALTER TABLE film ADD COLUMN last_update DATETIME ;

INSERT INTO imdb.actor
(first_name, last_name)
VALUES('robert', 'downey'),
	  ('scarlet ','johanson'),
	  ('elizabeth ','olsen'),
      ('rachel','mcadams');


INSERT INTO imdb.film
(description, release_year)
VALUES('iron man', '2008-02-05'),
	   ('avengers age of ultron','2015-02-07'),
	   ('sherlock holmes','2013-05-08');



