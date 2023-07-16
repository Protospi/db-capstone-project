CREATE VIEW `best_customers` AS
(SELECT
	c.customer_id,
    c.customer_name,
    o.order_id,
    o.total_cost,
    cu.cuisine_name,
    mi.item_name
FROM customers as c
JOIN orders as o
ON c.customer_id = o.customer_id
JOIN orders_menu om
ON o.order_id = om.order_id
JOIN menu_items as mi
ON om.menu_item_id = mi.menu_item_id
JOIN cuisines AS cu
ON mi.cuisine_id = cu.cuisine_id
WHERE total_cost > 150);