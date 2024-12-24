WITH s AS (SELECT *, 
LAG(toys_produced) OVER (ORDER BY production_date) AS previous
FROM toy_production)
SELECT *
  , (toys_produced - previous) / previous AS pct
FROM s
ORDER BY pct DESC
