/*Query 4 for PPT answer- Can you write a query to capture the customer name, month and year of payment, and total payment amount for each month by these top 10 paying customers?  */

WITH t1 AS (
    SELECT 
        (first_name || ' ' || last_name) AS name, 
        c.customer_id, 
        p.amount, 
        p.payment_date
    FROM customer AS c
    JOIN payment AS p 
        ON c.customer_id = p.customer_id
),

t2 AS (
    SELECT t1.customer_id
    FROM t1
    GROUP BY t1.customer_id
    ORDER BY SUM(t1.amount) DESC
    LIMIT 10
)

SELECT 
    DATE_TRUNC('month', t1.payment_date) AS pay_mon,
    t1.name AS fullname,
    COUNT(*) AS pay_countpermon,
    SUM(t1.amount) AS pay_amount
FROM t1
JOIN t2 
    ON t1.customer_id = t2.customer_id
WHERE DATE_TRUNC('month', t1.payment_date) = DATE '2007-02-01'
GROUP BY pay_mon, fullname
ORDER BY fullname;
