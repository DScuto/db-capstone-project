INSERT INTO bookings (CustomerID, TableNo, BookingDate) VALUES
(1, 5, '2024-03-10'),
(2, 3, '2024-04-11'),
(3, 7, '2024-02-25'),
(4, 2, '2024-02-28');

DELIMITER $$

-- Crear el procedimiento CheckBooking
CREATE PROCEDURE CheckBooking(IN inBookingDate DATE, IN inTableNo INT)
BEGIN
    -- Variable para almacenar el resultado de la consulta
    DECLARE bookingStatus VARCHAR(100);
    
    -- Verificar si hay una reserva para la mesa en la fecha indicada
    SELECT 
        CASE 
            WHEN COUNT(*) > 0 THEN 'The table is already booked.' 
            ELSE 'The table is available.' 
        END 
    INTO bookingStatus
    FROM bookings 
    WHERE BookingDate = inBookingDate AND TableNo = inTableNo;
    
    -- Mostrar el mensaje con el estado de la mesa
    SELECT bookingStatus AS Message;
END $$

DELIMITER ;

CALL CheckBooking('2024-02-15', 8);

DELIMITER $$

CREATE PROCEDURE AddValidBooking(IN inBookingDate DATE, IN inTableNo INT)
BEGIN
    -- Declarar la variable al inicio
    DECLARE tableAvailable INT DEFAULT 0;

    -- Iniciar la transacción
    START TRANSACTION;
    
    -- Verificar si la mesa ya está reservada en la fecha especificada
    SELECT COUNT(*) INTO tableAvailable
    FROM bookings
    WHERE BookingDate = inBookingDate AND TableNo = inTableNo;
    
    -- Si la mesa está reservada, hacer un rollback
    IF tableAvailable > 0 THEN
        -- La mesa ya está reservada, cancelar la transacción (rollback)
        ROLLBACK;
        SELECT 'Booking declined: The table is already booked on this date.' AS Message;
    ELSE
        -- La mesa está disponible, proceder con la inserción (commit)
        INSERT INTO bookings (BookingDate, TableNo)
        VALUES (inBookingDate, inTableNo);
        
        -- Confirmar la transacción (commit)
        COMMIT;
        SELECT 'Booking confirmed: The table has been successfully booked.' AS Message;
    END IF;
END $$

DELIMITER ;

CALL AddValidBooking('2024-02-15', 8);

DELIMITER $$

CREATE PROCEDURE AddBooking(
    IN inBookingID INT, 
    IN inCustomerID INT, 
    IN inBookingDate DATE, 
    IN inTableNo INT
)
BEGIN
    -- Insertar una nueva reserva en la tabla bookings
    INSERT INTO bookings (BookingID, CustomerID, TableNo, BookingDate)
    VALUES (inBookingID, inCustomerID, inTableNo, inBookingDate);
    
    -- Confirmar que la reserva ha sido realizada
    SELECT 'Booking successfully added.' AS Message;
END $$

DELIMITER ;

CALL AddBooking(24, 9, '2025-02-11', 5);

DELIMITER $$

CREATE PROCEDURE UpdateBooking(
    IN inBookingID INT, 
    IN inNewBookingDate DATE
)
BEGIN
    -- Actualizar la fecha de reserva para el BookingID dado
    UPDATE bookings
    SET BookingDate = inNewBookingDate
    WHERE BookingID = inBookingID;
    
    -- Confirmar que la reserva ha sido actualizada
    SELECT 'Booking successfully updated.' AS Message;
END $$

DELIMITER ;
CALL UpdateBooking(24, '2024-08-15');

DELIMITER $$

CREATE PROCEDURE CancelBooking(
    IN inBookingID INT
)
BEGIN
    -- Eliminar la reserva con el BookingID especificado
    DELETE FROM bookings
    WHERE BookingID = inBookingID;
    
    -- Confirmación de que la reserva ha sido cancelada
    SELECT 'Booking successfully canceled.' AS Message;
END $$

DELIMITER ;

CALL CancelBooking(24);