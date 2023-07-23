select
	c.CustomerName AS Customer,
	SUM(s.Price - s.Cost) AS Profit
FROM Sales as s
LEFT JOIN Orders as o
ON s.OrderID = o.OrderID
JOIN Customers as c
ON o.CustomerID = c.CustomerID
GROUP BY s.OrderID
HAVING  SUM(Price - Cost) > 1500
ORDER BY 2 DESC