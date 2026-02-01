/*Query 2 for PPT answer - Finally, provide a table with the family-friendly film category, each of the quartiles, and the corresponding count of movies within each combination of film category for each corresponding rental duration category  */

SELECT t.name,
       t.standard_quartile,
       COUNT(*)
  FROM (SELECT c.name,
               f.rental_duration,
               NTILE(4) OVER(ORDER BY f.rental_duration) AS standard_quartile
          FROM category AS c
               JOIN film_category AS fc
                ON c.category_id = fc.category_id 
               JOIN film AS f
                ON f.film_id = fc.film_id
         WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')) AS t
 WHERE t.standard_quartile = 1
 GROUP BY t.name, t.standard_quartile
 ORDER BY t.name, t.standard_quartile;