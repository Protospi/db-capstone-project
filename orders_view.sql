CREATE VIEW `orders_view` AS 
(SELECT * 
FROM littleLemon.orders
WHERE order_id IN (SELECT order_id FROM littleLemon.orders_menu WHERE quantity >= 2))