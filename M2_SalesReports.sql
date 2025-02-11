CREATE VIEW  OrdersView AS SELECT orderID, BillAmount, Quantity FROM orders;
SELECT *  FROM OrdersView;

SELECT 
    c.CustomerID, 
    CONCAT(c.GuestFirstName, ' ', c.GuestLastName) AS FullName, 
    o.OrderID, 
    o.BillAmount, 
    m.Name AS MenuName
FROM 
    Customers c
JOIN 
    bookings b ON c.CustomerID = b.CustomerID
JOIN 
    orders o ON b.BookingID = o.BookingID
JOIN 
    orders_Item oi ON o.OrderID = oi.OrderID
JOIN 
    menu m ON oi.MenuID = m.MenuID
WHERE 
    o.BillAmount > 80;
    
SELECT 
    m.Name AS MenuName
FROM 
    menu m
WHERE 
    m.MenuID = ANY (
        SELECT oi.MenuID
        FROM orders_Item oi
        WHERE oi.Quantity > 2
    );
    
DELIMITER $$

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    -- Declare a variable to store the maximum quantity
    DECLARE max_quantity INT;

    -- Get the maximum quantity from the orders table
    SELECT MAX(Quantity) INTO max_quantity
    FROM orders;

    -- Display the maximum quantity
    SELECT max_quantity AS MaxOrderedQuantity;
END $$

DELIMITER ;

CALL GetMaxQuantity()

DELIMITER $$
-- Crear el procedimiento con JOIN
CREATE PROCEDURE GetOrderDetail(IN CustomerID INT)
BEGIN
    -- Declarar la variable para la consulta SQL dinámica
    SET @sql = CONCAT('
        SELECT o.OrderID, o.Quantity, o.BillAmount 
        FROM orders o
        JOIN bookings b ON o.BookingID = b.BookingID
        WHERE b.CustomerID = ', CustomerID);
    
    -- Preparar la consulta SQL dinámica
    PREPARE stmt FROM @sql;
    
    -- Ejecutar la sentencia preparada
    EXECUTE stmt;
    
    -- Desasignar la sentencia preparada
    DEALLOCATE PREPARE stmt;
END $$

DELIMITER ;

-- Set the CustomerID value (e.g., 1)
SET @id = 1;
-- Call the procedure with the specified CustomerID
CALL GetOrderDetail(@id);
DELIMITER ;

DELIMITER $$

-- Crear el procedimiento CancelOrder
CREATE PROCEDURE CancelOrder(IN OrderID INT)
BEGIN
    -- Intentar eliminar la orden de la tabla `orders`
    DELETE FROM orders WHERE OrderID = OrderID;
    
    -- Verificar si la orden fue eliminada exitosamente
    IF ROW_COUNT() > 0 THEN
        SELECT CONCAT('Order with OrderID ', OrderID, ' has been cancelled.') AS Message;
    ELSE
        SELECT CONCAT('No order found with OrderID ', OrderID, '.') AS Message;
    END IF;
END $$

DELIMITER ;