CREATE PROCEDURE GetMaxQuantity()
SELECT 
	order_id,
    MAX(quantity) AS 'maximum quantity'
FROM orders_menu
GROUP BY order_id;

call GetMaxQuantity();