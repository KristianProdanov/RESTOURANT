USE Proekt
CREATE TABLE MenuItems (
  ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Description VARCHAR(100) NOT NULL,
  Price DECIMAL(8, 2) NOT NULL,
  Category VARCHAR(50) NOT NULL,
  Availability BOOLEAN 
);

CREATE TABLE Orders (
  ID INT PRIMARY KEY,
  MenuItem VARCHAR(50) NOT NULL,
  Quantity INT NOT NULL,
  TotalPrice DECIMAL(8, 2) NOT NULL,
  OrderDate VARCHAR(50) NOT NULL
  );

CREATE TABLE Employees (
  ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Title VARCHAR(50) NOT NULL,
  Phone VARCHAR(20) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Address VARCHAR(100) NOT NULL
);

CREATE TABLE Reservations (
  ID INT PRIMARY KEY,
  CustomerName VARCHAR(50) NOT NULL,
  PartySize INT NOT NULL,
  DateTime VARCHAR(50) NOT NULL,
  SpecialRequests VARCHAR(100)
);

CREATE TABLE Tables (
  ID INT PRIMARY KEY,
  SeatingCapacity INT NOT NULL,
  Status VARCHAR(50) NOT NULL
);

ALTER TABLE Reservations ADD CONSTRAINT FK_Tables_Reservation
  FOREIGN KEY (ID) REFERENCES Tables (ID);

INSERT INTO MenuItems (ID,Name, Description, Price, Category, Availability)
VALUES
(1,'Pepperoni Pizza', 'Tomato sauce, mozzarella cheese, and pepperoni', 10.99, 'Pizza', 1),
(2,'Hawaiian Pizza', 'Tomato sauce, mozzarella cheese, ham, and pineapple', 11.99, 'Pizza', 1),
(3,'Meat Lovers Pizza', 'Tomato sauce, mozzarella cheese, pepperoni, sausage, bacon, and ham', 12.99, 'Pizza', 1),
(4,'Veggie Pizza', 'Tomato sauce, mozzarella cheese, onions, bell peppers, mushrooms, and black olives', 11.99, 'Pizza', 1),
(5,'Caesar Salad', 'Romaine lettuce, croutons, parmesan cheese, and Caesar dressing', 7.99, 'Salad', 1),
(6,'Greek Salad', 'Mixed greens, feta cheese, Kalamata olives, and Greek dressing', 8.99, 'Salad', 1),
(7,'Cobb Salad', 'Mixed greens, chicken, bacon, avocado, egg, blue cheese, and ranch dressing', 9.99, 'Salad', 1),
(8,'Spinach Salad', 'Baby spinach, strawberries, feta cheese, and balsamic vinaigrette', 8.99, 'Salad', 1),
(9,'Garlic Bread', 'Toasted bread with garlic butter and parmesan cheese', 3.99, 'Appetizer', 1),
(10,'Mozzarella Sticks', 'Breaded mozzarella sticks with marinara sauce', 5.99, 'Appetizer', 1),
(11,'Chicken Wings', 'Fried chicken wings with your choice of sauce', 8.99, 'Appetizer', 1),
(12,'Fried Calamari', 'Breaded calamari with marinara sauce', 7.99, 'Appetizer', 1),
(13,'Grilled Chicken Sandwich', 'Grilled chicken breast with lettuce, tomato, and mayo on a bun', 8.99, 'Sandwich', 1),
(14,'Bacon Cheeseburger', 'Beef patty with bacon, cheddar cheese, lettuce, tomato, and mayo on a bun', 9.99, 'Sandwich', 0),
(15,'Philly Cheesesteak', 'Shaved steak with sautéed onions, green peppers, and melted provolone cheese on a hoagie roll', 10.99, 'Sandwich', 1),
(16,'Fish and Chips', 'Beer-battered cod with fries and tartar sauce', 11.99, 'Entree', 1),
(17,'Spaghetti and Meatballs', 'Spaghetti with meatballs in marinara sauce', 12.99, 'Entree', 1),
(18,'Beef Stroganoff', 'Tender beef in a creamy mushroom sauce served over egg noodles', 15.99, 'Entrees', 0),
(19,'Crab Cakes', 'Two house-made crab cakes served with a side of coleslaw', 18.99, 'Seafood', 1),
(20,'Grilled Salmon', 'Fresh salmon fillet served with roasted vegetables', 16.99, 'Seafood', 1),
(21,'Shrimp Scampi', 'Jumbo shrimp sautéed in garlic butter and white wine', 16.99, 'Seafood', 1),
(22, 'Coke', 'Refreshing cola drink', 2.00, 'Non-Alcoholic', 1),
(23, 'Sprite', 'Lemon-lime flavored carbonated beverage', 2.00, 'Non-Alcoholic', 1),
(24, 'Fanta', 'Orange-flavored carbonated beverage', 2.00, 'Non-Alcoholic', 1),
(25, 'Lemonade', 'Sweet and sour lemon-flavored drink', 3.00, 'Non-Alcoholic', 1),
(26, 'Iced Tea', 'Classic tea with ice', 2.50, 'Non-Alcoholic', 1),
(27, 'Coffee', 'Hot brewed coffee', 2.50, 'Non-Alcoholic', 1),
(28, 'Hot Chocolate', 'Hot cocoa drink', 3.00, 'Non-Alcoholic', 1),
(29, 'Orange Juice', 'Freshly squeezed orange juice', 3.50, 'Non-Alcoholic', 1),
(30, 'Apple Juice', 'Freshly squeezed apple juice', 3.50, 'Non-Alcoholic', 1),
(41, 'Ginger Ale', 'Carbonated ginger-flavored drink', 2.50, 'Non-Alcoholic', 1),
(42, 'Virgin Mojito', 'Non-alcoholic version of the classic mojito cocktail', 4.00, 'Non-Alcoholic', 1),
(43, 'Virgin Pina Colada', 'Non-alcoholic version of the classic pina colada cocktail', 4.00, 'Non-Alcoholic', 1),
(44, 'Virgin Margarita', 'Non-alcoholic version of the classic margarita cocktail', 4.00, 'Non-Alcoholic', 1),
(45, 'Shirley Temple', 'Non-alcoholic cocktail made with ginger ale, grenadine, and a maraschino cherry', 4.00, 'Non-Alcoholic', 1),
(46, 'Arnold Palmer', 'Half iced tea and half lemonade', 3.00, 'Non-Alcoholic', 1),
(47, 'Mojito', 'Classic cocktail made with rum, lime, mint, and soda water', 8.00, 'Alcoholic', 1),
(48, 'Pina Colada', 'Classic cocktail made with rum, coconut cream, and pineapple juice', 8.00, 'Alcoholic', 1),
(49, 'Margarita', 'Classic cocktail made with tequila, lime, and triple sec', 8.00, 'Alcoholic', 1),
(50, 'Cosmopolitan', 'Classic cocktail made with vodka, triple sec, cranberry juice, and lime', 9.00, 'Alcoholic', 1),
(51, 'Mimosa', 'Champagne and orange juice cocktail', 7.00, 'Alcoholic', 1),
(52, 'Bellini', 'Peach puree and prosecco cocktail', 9.00, 'Alcoholic', 1),
(53, 'Bloody Mary', 'Vodka and tomato juice cocktail with spices', 9.00, 'Alcoholic', 1),
(54, 'Lemonade', 'Freshly squeezed lemon juice, sugar, and water.', 2.99, 'Non-Alcoholic', 1),
(55, 'Iced Tea', 'Brewed black tea served over ice with a slice of lemon.', 1.99, 'Non-Alcoholic', 1),
(56, 'Virgin Mary', 'Tomato juice, lemon juice, Worcestershire sauce, hot sauce, and spices.', 3.99, 'Non-Alcoholic', 1),
(57, 'Fruit Punch', 'A refreshing mix of tropical fruit juices.', 4.99, 'Non-Alcoholic', 1),
(58, 'Margarita', 'Tequila, lime juice, and triple sec served in a salt-rimmed glass.', 7.99, 'Alcoholic', 1),
(59, 'Martini', 'Gin or vodka and dry vermouth, stirred or shaken with ice.', 8.99, 'Alcoholic', 1),
(60, 'Cosmopolitan', 'Vodka, triple sec, cranberry juice, and lime juice.', 9.99, 'Alcoholic', 1),
(61, 'Whiskey Sour', 'Bourbon or rye whiskey, lemon juice, and sugar.', 6.99, 'Alcoholic', 1);


INSERT INTO Orders(ID,MenuItem,Quantity,TotalPrice,OrderDate)
VALUES
(1, 'Pepperoni Pizza', 2, 21.98, '2023-02-05'),
(2, 'Fried Calamari', 1, 7.99, '2023-02-05'),
(3, 'Greek Salad', 2, 17.98, '2023-02-05'),
(4, 'Grilled Salmon', 3, 50.97, '2023-02-05'),
(5, 'Mozzarella Sticks', 1, 5.99, '2023-02-05'),
(6, 'Hawaiian Pizza', 1, 11.99, '2023-02-05'),
(7, 'Philly Cheesesteak', 4, 43.96, '2023-02-05'),
(8, 'Garlic Bread', 4, 15.96, '2023-02-05'),
(9, 'Grilled Chicken Sandwich', 2, 17.98, '2023-02-05'),
(10, 'Shrimp Scampi', 2, 33.98, '2023-02-06'),
(11, 'Chicken Wings', 2, 17.98, '2023-02-06'),
(12, 'Greek Salad', 3, 26.97, '2023-02-06'),
(13, 'Pepperoni Pizza', 1, 10.99, '2023-02-06'),
(14, 'Cobb Salad', 2, 19.98, '2023-02-06'),
(15, 'Mozzarella Sticks', 2, 11.98, '2023-02-06'),
(16, 'Hawaiian Pizza', 3, 35.97, '2023-02-06'),
(17, 'Caesar Salad', 2, 15.98, '2023-02-06'),
(18, 'Meat Lovers Pizza', 2, 25.98, '2023-02-06'),
(19, 'Beef Stroganoff', 1, 15.99, '2023-02-07'),
(20, 'Mozzarella Sticks', 3, 17.97, '2023-02-07'),
(21, 'Spinach Salad', 1, 8.99, '2023-02-07');

INSERT INTO Employees (ID, Name, Title, Phone, Email, Address)
VALUES
(1, 'John Smith', 'Manager', '555-1234', 'john.smith@gmail.com', '123 Main St, Anytown USA'),
(2, 'Jane Doe', 'Chef', '555-2345', 'jane.doe@yahoo.com', '456 Elm St, Anytown USA'),
(3, 'Tim Wilson', 'Chef', '555-1234', 'tim.wilson@gmail.com', '2425 Pine St, Anytown USA'),
(4, 'Mike Thompson', 'Chef', '555-7890', 'mike.thompson@gmail.com', '1617 Birch St, Anytown USA'),
(5, 'Tom Davis', 'Bartender', '555-5678', 'tom.davis@gmail.com', '1213 Cedar St, Anytown USA'),
(6, 'Steve Davis', 'Bartender', '555-3456', 'steve.davis@yahoo.com', '2829 Maple St, Anytown USA'),
(7, 'David Taylor', 'Bartender', '555-9012', 'david.taylor@mail.com', '2021 Chestnut St, Anytown USA'),
(8, 'Bob Johnson', 'Waiter', '555-3456', 'bob.johnson@gmail.com', '789 Oak St, Anytown USA'),
(9, 'Sally Brown', 'Waiter', '555-4567', 'sally.brown@mail.com', '1011 Pine St, Anytown USA'),
(10, 'Karen Johnson', 'Waiter', '555-2345', 'karen.johnson@yahoo.com', '2627 Cedar St, Anytown USA'),
(11, 'Karen Wilson', 'Waitress', '555-6789', 'karen.wilson@gmail.com', '1415 Maple St, Anytown USA'),
(12, 'Lisa Lee', 'Waitress', '555-8901', 'lisa.lee@mail.com', '1819 Walnut St, Anytown USA'),
(13, 'Amy Brown', 'Waitress', '555-0123', 'amy.brown@mail.com', '2223 Oak St, Anytown USA'),
(14, 'Emily Taylor', 'Waitress', '555-6789', 'emily.taylor@yahoo.com', '3435 Chestnut St, Anytown USA');

INSERT INTO Reservations (ID, CustomerName, PartySize, DateTime, SpecialRequests)
VALUES
(1, 'John West', 2, '2023-02-20', 'Window seat preferred'),
(2, 'Emily Johnson', 4, '2023-02-22', NULL),
(3, 'William Davis', 3, '2023-02-24', 'Gluten-free menu requested'),
(4, 'Olivia Wilson', 2, '2023-02-25', NULL),
(5, 'Jacob Lee', 6, '2023-02-26', 'Birthday celebration'),
(6, 'Ava Thompson', 2, '2023-02-28', NULL),
(7, 'Ethan Brown', 4, '2023-03-01', NULL),
(8, 'Sophia Davis', 2, '2023-03-03', NULL),
(9, 'Mason Johnson', 5, '2023-03-04', 'Outdoor seating preferred'),
(10, 'Isabella Lee', 3, '2023-03-06', 'Vegetarian menu requested');

INSERT INTO Tables (ID, SeatingCapacity, Status) VALUES
(1, 4, 'Available'),
(2, 6, 'Occupied'),
(3, 2, 'Reserved'),
(4, 8, 'Available'),
(5, 4, 'Available'),
(6, 2, 'Reserved'),
(7, 6, 'Available'),
(8, 4, 'Occupied'),
(9, 2, 'Available'),
(10,8, 'Available'),
(11, 3, 'Available'),
(12, 4, 'Available'),
(13, 2, 'Available'),
(14, 2, 'Available'),
(15, 5, 'Available'),
(16, 7, 'Available');

