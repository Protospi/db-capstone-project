DELIMITER //
CREATE PROCEDURE CancelBooking(
    IN booking_id INT
)
BEGIN
    DECLARE booking_count INT;

    -- Check if the booking exists
    SELECT COUNT(*) INTO booking_count
    FROM Bookings
    WHERE booking_id = booking_id;

    IF booking_count = 0 THEN
        SELECT 'Booking not found' AS result;
    ELSE
        -- Delete the booking
        DELETE FROM Bookings
        WHERE booking_id = booking_id;
        SELECT 'Booking successfully canceled' AS result;
    END IF;
END;
//
DELIMITER ;
