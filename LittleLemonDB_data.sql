INSERT INTO Customers (CustomerID, GuestFirstName, GuestLastName, ContactInfo) VALUES
(1, 'John', 'Doe', 123456789),
(2, 'Jane', 'Smith', 987654321),
(3, 'Carlos', 'Gomez', 456789123),
(4, 'Maria', 'Lopez', 321654987),
(5, 'Emma', 'Brown', 789123456),
(6, 'Luca', 'Bianchi', 654789321),
(7, 'Sofia', 'Martinez', 852963741),
(8, 'Marco', 'Ferrari', 963741852),
(9, 'Elena', 'Russo', 741852963),
(10, 'Paolo', 'Conti', 369852147);

INSERT INTO bookings (CustomerID, TableNo, BookingDate) VALUES
(1, 5, '2024-02-10'),
(2, 3, '2024-02-11'),
(3, 7, '2024-02-12'),
(4, 2, '2024-02-13'),
(5, 6, '2024-02-14'),
(6, 8, '2024-02-15'),
(7, 1, '2024-02-16'),
(8, 4, '2024-02-17'),
(9, 9, '2024-02-18'),
(10, 10, '2024-02-19');

INSERT INTO staff (EmployeeFirstName, EmployeeLastName, Role, ContactInfo, Salary) VALUES
('Mario', 'Rossi', 'Waiter', 111222333, 2000),
('Luigi', 'Verdi', 'Chef', 444555666, 3000),
('Anna', 'Bianchi', 'Manager', 777888999, 4000),
('Giovanni', 'Ricci', 'Waiter', 123123123, 2200),
('Francesca', 'Costa', 'Chef', 456456456, 3200),
('Alessandro', 'Moretti', 'Bartender', 789789789, 2500),
('Martina', 'Lombardi', 'Waiter', 147258369, 2100),
('Davide', 'Esposito', 'Chef', 258369147, 3100),
('Giulia', 'Romano', 'Manager', 369147258, 4200),
('Federico', 'Gallo', 'Waiter', 951753852, 2300);

INSERT INTO menu (MenuID, Name, Type, Cuisine, Price) VALUES
(1, 'Margherita Pizza', 'Main Course', 'Italian', 12),
(2, 'Carbonara Pasta', 'Main Course', 'Italian', 15),
(3, 'Bruschetta', 'Starter', 'Italian', 8),
(4, 'Tiramisu', 'Dessert', 'Italian', 7),
(5, 'Caesar Salad', 'Starter', 'American', 10),
(6, 'Grilled Salmon', 'Main Course', 'Mediterranean', 18),
(7, 'Sushi Rolls', 'Main Course', 'Japanese', 20),
(8, 'Miso Soup', 'Starter', 'Japanese', 6),
(9, 'Chocolate Cake', 'Dessert', 'French', 9),
(10, 'Red Wine', 'Drink', 'Italian', 5);

INSERT INTO orders (OrderID, BookingID, BillAmount, Quantity, OrderDate) VALUES
(1, 10, 25, 2, '2024-02-10'),
(2, 11, 30, 3, '2024-02-11'),
(3, 12, 45, 4, '2024-02-12'),
(4, 13, 50, 5, '2024-02-13'),
(5, 14, 60, 6, '2024-02-14'),
(6, 15, 70, 7, '2024-02-15'),
(7, 16, 80, 8, '2024-02-16'),
(8, 17, 90, 9, '2024-02-17'),
(9, 18, 100, 10, '2024-02-18'),
(10, 19, 110, 11, '2024-02-19');

INSERT INTO OrderStatus (OrderStatusID, OrderID, EmployeeID, Status) VALUES
(1, 1, 15, 'Completed'),
(2, 2, 15, 'Completed'),
(3, 3, 10, 'In Progress'),
(4, 4, 10, 'Pending'),
(5, 5, 9, 'Completed'),
(6, 6, 7, 'In Progress'),
(7, 7, 15, 'Completed'),
(8, 8, 7, 'Pending'),
(9, 9, 15, 'Completed'),
(10, 10, 10, 'In Progress');

INSERT INTO orders_Item (OrderItemID, OrderID, MenuID, Quantity) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3),
(4, 4, 4, 2),
(5, 5, 5, 4),
(6, 6, 6, 1),
(7, 7, 7, 2),
(8, 8, 8, 3),
(9, 9, 9, 1),
(10, 10, 10, 2);


