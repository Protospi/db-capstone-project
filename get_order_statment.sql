-- Create the prepared statement
PREPARE GetOrderDetail FROM
'SELECT o.order_id, om.quantity, o.total_cost
FROM Orders o
JOIN orders_menu om ON o.order_id = om.order_id
WHERE o.customer_id = @customer_id'

