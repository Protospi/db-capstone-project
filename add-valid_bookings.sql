DELIMITER //
CREATE PROCEDURE AddValidBooking(
    IN booking_date DATE,
    IN table_number INT,
    IN slot_hour INT,
    IN customer_id INT
)
BEGIN
    DECLARE table_status INT;

    START TRANSACTION;

    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO table_status
    FROM Bookings
    WHERE booking_date = booking_date AND table_number = table_number;

    IF table_status > 0 THEN
        -- Table is already booked, so rollback the transaction
        ROLLBACK;
    ELSE
        -- Table is available, so insert the new booking record
        INSERT INTO Bookings (booking_date, slot_hour, table_number, customer_id)
        VALUES (booking_date, slot_hour, table_number, customer_id);
        -- Commit the transaction
        COMMIT;
    END IF;
END;
//
DELIMITER ;
