/*Query 3 for PPT answer  - Write a query that returns the store ID for the store, the year and month and the number of rental orders each store has fulfilled for that month. Your table should include a column for each of the following: year, month, store ID and count of rental orders fulfilled during that month.  */

SELECT 
    DATE_PART('month', r.rental_date) AS rental_month,
    DATE_PART('year', r.rental_date) AS rental_year,
    sr.store_id AS store_id,
    COUNT(*) AS count_rentals
FROM store AS sr
JOIN staff AS sf 
    ON sr.store_id = sf.store_id
JOIN rental AS r 
    ON sf.staff_id = r.staff_id
WHERE 
    DATE_PART('year', r.rental_date) = 2005 
    AND DATE_PART('month', r.rental_date) IN (5, 6, 7)
    AND sr.store_id = 1
GROUP BY rental_month, rental_year, sr.store_id
ORDER BY count_rentals DESC;
