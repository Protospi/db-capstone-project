DELIMITER //
CREATE PROCEDURE check_booking(
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    DECLARE booking_count INT;

    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO booking_count
    FROM bookings
    WHERE date = booking_date AND table_number = table_number;

    -- If the booking_count is 0, it means the table is available
    IF booking_count = 0 THEN
        SELECT 'AVAILABLE' AS status;
    ELSE
        SELECT 'BOOKED' AS status;
    END IF;
END;
//
DELIMITER ;
