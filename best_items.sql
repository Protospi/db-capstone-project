CREATE VIEW `best_items` AS 
(
SELECT 
	c.cuisine_name,
    mi.item_name
FROM menu_items as mi
JOIN cuisines as c
ON mi.cuisine_id = c.cuisine_id
WHERE menu_item_id IN (SELECT menu_item_id FROM orders_menu WHERE quantity > 2)
);