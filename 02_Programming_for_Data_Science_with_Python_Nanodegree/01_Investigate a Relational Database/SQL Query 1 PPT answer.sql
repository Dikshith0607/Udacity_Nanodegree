/*Query 1 for PPT answer - Create a query that lists each movie, the film category it is classified in, and the number of times it has been rented out*/

WITH t1 AS (
    SELECT * 
    FROM category AS c
    JOIN film_category AS fc 
        ON c.category_id = fc.category_id
    JOIN film AS f 
        ON f.film_id = fc.film_id
    JOIN inventory AS i 
        ON i.film_id = f.film_id
    JOIN rental AS r 
        ON r.inventory_id = i.inventory_id
    WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
)
SELECT 
    t1.name AS category_name, 
    COUNT(t1.title) AS rental_count
FROM t1
GROUP BY category_name
ORDER BY category_name, rental_count;
