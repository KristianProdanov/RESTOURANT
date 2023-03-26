USE Proekt
--------------------MenuItems------------------------
SELECT Name,Description,Price,Category from MenuItems
Where Category = 'Pizza'
SELECT Name,Description,Price,Category from MenuItems
Where Category = 'Sandwich'
SELECT Name,Description,Price,Category from MenuItems
Where Category = 'Salad'
SELECT Name,Description,Price,Category from MenuItems
Where Category = 'Appetizer'
SELECT Name,Description,Price,Category from MenuItems
Where Category = 'Entree'
SELECT Name,Description,Price,Category from MenuItems
Where Category = 'Seafood'

SELECT Name,Description,Price,Category from MenuItems
Where Category = 'Alcoholic'
ORDER BY price ASC;
SELECT Name,Description,Price,Category from MenuItems
Where Category = 'Non-Alcoholic'
ORDER BY price ASC;
-----------------------------------------------------

---------------------Employees----------------
Select Name,Title,Phone,Address from Employees
Where Title = 'Waiter' or Title = 'Waitress'
Select Name,Title,Phone,Address from Employees
Where Title = 'Chef'
Select Name,Title,Phone,Address from Employees
Where Title = 'Manager'
----------------------------------------------

----------------------Orders-----------------------------
Select MenuItem,Quantity,TotalPrice,OrderDate from Orders
---------------------------------------------------------

--------------------------Reservations----------------------------------
Select CustomerName,PartySize,DateTime,SpecialRequests from Reservations
Where SpecialRequests is null
Select CustomerName,PartySize,DateTime,SpecialRequests from Reservations
Where SpecialRequests is not null
------------------------------------------------------------------------

----------------Tables-------------------
Select SeatingCapacity,Status from Tables
Where Status =  'Available'
Select SeatingCapacity,Status from Tables
Where Status =  'Occupied'
Select SeatingCapacity,Status from Tables
Where Status =  'Reserved'
-----------------------------------------