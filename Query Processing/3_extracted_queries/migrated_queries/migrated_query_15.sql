SELECT STORE_ID,
       MAX(REVENUE) AS HIGHEST_REVENUE
FROM STORE_REVENUE
GROUP BY STORE_ID;