SELECT child_id
, c.name
, g.price
FROM children c
JOIN gifts g USING (child_id) 
WHERE price > (SELECT 
  AVG(price) AS average_price
  FROM gifts g)
ORDER BY g.price
