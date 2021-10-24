-- SAKILA DB AVAILABLE AT https://dev.mysql.com/doc/index-other.html
	USE SAKILA;

-- DATA QUERY LANGUAGE (DQL)

	-- SIMPLE SELECT EXEMPLES
    
    
	SELECT * FROM ACTOR;
    SELECT * FROM ACTOR WHERE LAST_NAME LIKE "%GIDA";
	SELECT * FROM ACTOR WHERE LAST_NAME LIKE "LOLLOBRIGIDA%";
    SELECT * FROM ACTOR WHERE LAST_NAME LIKE "%GUINE%";
	SELECT * FROM ACTOR WHERE LAST_UPDATE >= "2006-05-15";
    
    SELECT * FROM FILM;
    SELECT * FROM FILM WHERE RELEASE_YEAR <= 2006;
    SELECT FILM_ID, TITLE, DESCRIPTION FROM FILM;
    
    SELECT * FROM ADDRESS WHERE POSTAL_CODE = "";
    SELECT * FROM ADDRESS WHERE POSTAL_CODE IS NULL;
	SELECT * FROM ADDRESS WHERE POSTAL_CODE = NULL;
	
    SELECT * FROM PAYMENT;
    SELECT * FROM RENTAL;
    SELECT * FROM STAFF;
    
    
    
    -- UTILS FUNCTIONS IN SQL
    
    
    SELECT AVG(AMOUNT) FROM PAYMENT;
    SELECT AVG(AMOUNT) FROM PAYMENT WHERE PAYMENT.PAYMENT_DATE <= "2006-01-01";
	SELECT CURRENT_TIMESTAMP();
    SELECT CURRENT_DATE();
    SELECT NOW();
    SELECT MAX(AMOUNT) FROM PAYMENT;
    SELECT MIN(AMOUNT) FROM PAYMENT;
    SELECT SQRT(MAX(AMOUNT)) FROM PAYMENT;
    
    SELECT
		POW(MAX(AMOUNT), MAX(AMOUNT)) AS "POW"
	FROM PAYMENT;
    
    
    -- UTILS FUNCTIONS IN SQL WITH INNER JOIN
    
    
    SELECT
		COUNT(FILM.TITLE)
	FROM
		FILM
	INNER JOIN
		FILM_ACTOR ON FILM.FILM_ID = FILM_ACTOR.FILM_ID
	INNER JOIN
		ACTOR ON ACTOR.ACTOR_ID = FILM_ACTOR.ACTOR_ID
	WHERE ACTOR.FIRST_NAME = "PENELOPE";
    
    
    
    SELECT
		COUNT(FILM.TITLE)
	FROM
		FILM
	INNER JOIN
		FILM_ACTOR ON FILM.FILM_ID = FILM_ACTOR.FILM_ID
	INNER JOIN
		ACTOR ON ACTOR.ACTOR_ID = FILM_ACTOR.ACTOR_ID
	WHERE ACTOR.LAST_NAME = "LOLLOBRIGIDA";
	
    
    
    SELECT
        STAFF.PICTURE,
        CONCAT(STAFF.FIRST_NAME ," ", STAFF.LAST_NAME) AS "STAFF_FULL_NAME",
        SUM(PAYMENT.AMOUNT) AS "SUM_AMOUNT"
	FROM STAFF
	RIGHT JOIN
		PAYMENT ON STAFF.STAFF_ID = PAYMENT.STAFF_ID
	WHERE STAFF.FIRST_NAME = "MIKE";
    
    
    
    SELECT
        STAFF.PICTURE,
        CONCAT(STAFF.FIRST_NAME, " ", STAFF.LAST_NAME) AS "STAFF_FULL_NAME",
        SUM(PAYMENT.AMOUNT) AS "SUM_AMOUNT"
	FROM STAFF
	RIGHT JOIN
		PAYMENT ON STAFF.STAFF_ID = PAYMENT.STAFF_ID
	WHERE STAFF.FIRST_NAME = "JON";
    
    
    
    -- SELECT WITH (JOINS) OR (ORDER FUNCTIONS) OR (JOINS WITH ORDER FUNCTIONS)
        
    
    SELECT
		FILM.FILM_ID,
        FILM.TITLE,
        FILM.DESCRIPTION,
        LANGUAGE.NAME AS "LANGUAGE"
	FROM
		FILM
    INNER JOIN
		LANGUAGE ON  FILM.LANGUAGE_ID = LANGUAGE.LANGUAGE_ID;
        
        
    
    SELECT
		FILM.FILM_ID,
        FILM.TITLE,
        FILM.DESCRIPTION,
        LANGUAGE.NAME AS "LANGUAGE"
	FROM
		FILM
    INNER JOIN
		LANGUAGE ON FILM.LANGUAGE_ID = LANGUAGE.LANGUAGE_ID
	WHERE LANGUAGE.NAME != "English";
    
    
    
    SELECT
		FILM.FILM_ID,
        FILM.TITLE,
        FILM.DESCRIPTION,
        CATEGORY.NAME AS "CATEGORY_NAME"
	FROM
		FILM_CATEGORY
	INNER JOIN
		FILM ON FILM_CATEGORY.FILM_ID = FILM.FILM_ID
	INNER JOIN
		CATEGORY ON FILM_CATEGORY.CATEGORY_ID = CATEGORY.CATEGORY_ID;
        
        
	
    SELECT
		CITY.CITY,
        ADDRESS.ADDRESS,
        ADDRESS.POSTAL_CODE,
        ADDRESS.PHONE
	FROM
		CITY
    RIGHT JOIN
		ADDRESS ON CITY.CITY_ID = ADDRESS.CITY_ID;
        
	
    
    SELECT
		COUNTRY.COUNTRY,
        CITY.CITY,
        ADDRESS.LOCATION
	FROM
		COUNTRY
	RIGHT JOIN
		CITY ON CITY.COUNTRY_ID = COUNTRY.COUNTRY_ID
	RIGHT JOIN
		ADDRESS ON CITY.CITY_ID = ADDRESS.CITY_ID
	ORDER BY COUNTRY.COUNTRY ASC;



	SELECT
		CITY.CITY,
        COUNTRY.COUNTRY
	FROM
		COUNTRY
	RIGHT JOIN
		CITY ON CITY.COUNTRY_ID = COUNTRY.COUNTRY_ID
	WHERE COUNTRY.COUNTRY = "BRAZIL"
	ORDER BY CITY.CITY ASC;
    
    
    
    SELECT
		CITY.CITY,
        COUNTRY.COUNTRY
	FROM
		COUNTRY
	RIGHT JOIN
		CITY ON CITY.COUNTRY_ID = COUNTRY.COUNTRY_ID
	WHERE COUNTRY.COUNTRY = "BRAZIL"
    ORDER BY CITY.CITY DESC;
    