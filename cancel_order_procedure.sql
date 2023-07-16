DELIMITER //

CREATE PROCEDURE CancelOrder(IN orderIdToDelete INT)
BEGIN
    -- Check if the order exists before attempting to delete it
    IF EXISTS (SELECT 1 FROM orders WHERE order_id = orderIdToDelete) THEN
        -- Delete the order from the orders_menu table first (assuming it is a foreign key referencing Orders table)
        DELETE FROM orders_menu WHERE order_id = orderIdToDelete;
        
        -- Delete the order from the Orders table
        DELETE FROM orders WHERE order_id = orderIdToDelete;
        
        SELECT 'Order canceled successfully.' AS Message;
    ELSE
        SELECT 'Order does not exist.' AS Message;
    END IF;
END;
//

DELIMITER ;
