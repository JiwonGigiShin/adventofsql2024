-- https://www.db-fiddle.com/f/26ijsxt8vojxoKNqWEsfkR/0

-- Mrs. Claus needs a comprehensive analysis of the tree farms. Using window functions, create a query that will shed some light on the field perfomance.

-- Show the 3-season moving average per field per season per year

-- Write a single SQL query using window functions that will reveal these vital patterns. Your analysis will help ensure that every child who wishes for a Christmas tree will have one for years to come.

-- Order them by three_season_moving_avg descending to make it easier to find the largest figure.

-- Seasons are ordered as follows:

-- Spring THEN 1
-- Summer THEN 2
-- Fall THEN 3
-- Winter THEN 4
-- Find the row with the most three_season_moving_avg


WITH numeric_season AS (
	SELECT *, 
  CASE WHEN season LIKE 'Spring' THEN 1
  		WHEN season LIKE 'Summer' THEN 2
  		WHEN season LIKE 'Fall' THEN 3
  		ELSE 4 END AS n_season
  	FROM TreeHarvests
)
SELECT 
harvest_year,
field_name,
n_season,
AVG(trees_harvested) OVER (PARTITION BY field_name, harvest_year ORDER BY n_season ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS three_season_moving_avg
FROM numeric_season 
ORDER BY three_season_moving_avg DESC

