USE [master]
GO
/****** Object:  Database [Proekt]    Script Date: 2/26/2023 11:56:12 AM ******/
CREATE DATABASE [Proekt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proekt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVERNEW\MSSQL\DATA\Proekt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proekt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVERNEW\MSSQL\DATA\Proekt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Proekt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proekt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proekt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proekt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proekt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proekt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proekt] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proekt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proekt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proekt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proekt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proekt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proekt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proekt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proekt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proekt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proekt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proekt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proekt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proekt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proekt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proekt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proekt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proekt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proekt] SET RECOVERY FULL 
GO
ALTER DATABASE [Proekt] SET  MULTI_USER 
GO
ALTER DATABASE [Proekt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proekt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proekt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proekt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proekt] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Proekt', N'ON'
GO
ALTER DATABASE [Proekt] SET QUERY_STORE = OFF
GO
USE [Proekt]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2/26/2023 11:56:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 2/26/2023 11:56:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItems](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Price] [decimal](8, 2) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Availability] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/26/2023 11:56:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] NOT NULL,
	[MenuItem] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalPrice] [decimal](8, 2) NOT NULL,
	[OrderDate] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 2/26/2023 11:56:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ID] [int] NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[PartySize] [int] NOT NULL,
	[DateTime] [varchar](50) NOT NULL,
	[SpecialRequests] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tables]    Script Date: 2/26/2023 11:56:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tables](
	[ID] [int] NOT NULL,
	[SeatingCapacity] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Employees] ([ID], [Name], [Title], [Phone], [Email], [Address]) VALUES (1, N'John Smith', N'Manager', N'555-1234', N'john.smith@gmail.com', N'123 Main St, Anytown USA')
INSERT [dbo].[Employees] ([ID], [Name], [Title], [Phone], [Email], [Address]) VALUES (2, N'Jane Doe', N'Chef', N'555-2345', N'jane.doe@yahoo.com', N'456 Elm St, Anytown USA')
INSERT [dbo].[Employees] ([ID], [Name], [Title], [Phone], [Email], [Address]) VALUES (3, N'Tim Wilson', N'Chef', N'555-1234', N'tim.wilson@gmail.com', N'2425 Pine St, Anytown USA')
INSERT [dbo].[Employees] ([ID], [Name], [Title], [Phone], [Email], [Address]) VALUES (4, N'Mike Thompson', N'Chef', N'555-7890', N'mike.thompson@gmail.com', N'1617 Birch St, Anytown USA')
INSERT [dbo].[Employees] ([ID], [Name], [Title], [Phone], [Email], [Address]) VALUES (5, N'Tom Davis', N'Bartender', N'555-5678', N'tom.davis@gmail.com', N'1213 Cedar St, Anytown USA')
INSERT [dbo].[Employees] ([ID], [Name], [Title], [Phone], [Email], [Address]) VALUES (6, N'Steve Davis', N'Bartender', N'555-3456', N'steve.davis@yahoo.com', N'2829 Maple St, Anytown USA')
INSERT [dbo].[Employees] ([ID], [Name], [Title], [Phone], [Email], [Address]) VALUES (7, N'David Taylor', N'Bartender', N'555-9012', N'david.taylor@mail.com', N'2021 Chestnut St, Anytown USA')
INSERT [dbo].[Employees] ([ID], [Name], [Title], [Phone], [Email], [Address]) VALUES (8, N'Bob Johnson', N'Waiter', N'555-3456', N'bob.johnson@gmail.com', N'789 Oak St, Anytown USA')
INSERT [dbo].[Employees] ([ID], [Name], [Title], [Phone], [Email], [Address]) VALUES (9, N'Sally Brown', N'Waiter', N'555-4567', N'sally.brown@mail.com', N'1011 Pine St, Anytown USA')
INSERT [dbo].[Employees] ([ID], [Name], [Title], [Phone], [Email], [Address]) VALUES (10, N'Karen Johnson', N'Waiter', N'555-2345', N'karen.johnson@yahoo.com', N'2627 Cedar St, Anytown USA')
INSERT [dbo].[Employees] ([ID], [Name], [Title], [Phone], [Email], [Address]) VALUES (11, N'Karen Wilson', N'Waitress', N'555-6789', N'karen.wilson@gmail.com', N'1415 Maple St, Anytown USA')
INSERT [dbo].[Employees] ([ID], [Name], [Title], [Phone], [Email], [Address]) VALUES (12, N'Lisa Lee', N'Waitress', N'555-8901', N'lisa.lee@mail.com', N'1819 Walnut St, Anytown USA')
INSERT [dbo].[Employees] ([ID], [Name], [Title], [Phone], [Email], [Address]) VALUES (13, N'Amy Brown', N'Waitress', N'555-0123', N'amy.brown@mail.com', N'2223 Oak St, Anytown USA')
INSERT [dbo].[Employees] ([ID], [Name], [Title], [Phone], [Email], [Address]) VALUES (14, N'Emily Taylor', N'Waitress', N'555-6789', N'emily.taylor@yahoo.com', N'3435 Chestnut St, Anytown USA')
GO
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (1, N'Pepperoni Pizza', N'Tomato sauce, mozzarella cheese, and pepperoni', CAST(10.99 AS Decimal(8, 2)), N'Pizza', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (2, N'Hawaiian Pizza', N'Tomato sauce, mozzarella cheese, ham, and pineapple', CAST(11.99 AS Decimal(8, 2)), N'Pizza', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (3, N'Meat Lovers Pizza', N'Tomato sauce, mozzarella cheese, pepperoni, sausage, bacon, and ham', CAST(12.99 AS Decimal(8, 2)), N'Pizza', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (4, N'Veggie Pizza', N'Tomato sauce, mozzarella cheese, onions, bell peppers, mushrooms, and black olives', CAST(11.99 AS Decimal(8, 2)), N'Pizza', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (5, N'Caesar Salad', N'Romaine lettuce, croutons, parmesan cheese, and Caesar dressing', CAST(7.99 AS Decimal(8, 2)), N'Salad', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (6, N'Greek Salad', N'Mixed greens, feta cheese, Kalamata olives, and Greek dressing', CAST(8.99 AS Decimal(8, 2)), N'Salad', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (7, N'Cobb Salad', N'Mixed greens, chicken, bacon, avocado, egg, blue cheese, and ranch dressing', CAST(9.99 AS Decimal(8, 2)), N'Salad', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (8, N'Spinach Salad', N'Baby spinach, strawberries, feta cheese, and balsamic vinaigrette', CAST(8.99 AS Decimal(8, 2)), N'Salad', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (9, N'Garlic Bread', N'Toasted bread with garlic butter and parmesan cheese', CAST(3.99 AS Decimal(8, 2)), N'Appetizer', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (10, N'Mozzarella Sticks', N'Breaded mozzarella sticks with marinara sauce', CAST(5.99 AS Decimal(8, 2)), N'Appetizer', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (11, N'Chicken Wings', N'Fried chicken wings with your choice of sauce', CAST(8.99 AS Decimal(8, 2)), N'Appetizer', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (12, N'Fried Calamari', N'Breaded calamari with marinara sauce', CAST(7.99 AS Decimal(8, 2)), N'Appetizer', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (13, N'Grilled Chicken Sandwich', N'Grilled chicken breast with lettuce, tomato, and mayo on a bun', CAST(8.99 AS Decimal(8, 2)), N'Sandwich', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (14, N'Bacon Cheeseburger', N'Beef patty with bacon, cheddar cheese, lettuce, tomato, and mayo on a bun', CAST(9.99 AS Decimal(8, 2)), N'Sandwich', 0)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (15, N'Philly Cheesesteak', N'Shaved steak with sauteed onions, green peppers, and melted provolone cheese on a hoagie roll', CAST(10.99 AS Decimal(8, 2)), N'Sandwich', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (16, N'Fish and Chips', N'Beer-battered cod with fries and tartar sauce', CAST(11.99 AS Decimal(8, 2)), N'Entree', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (17, N'Spaghetti and Meatballs', N'Spaghetti with meatballs in marinara sauce', CAST(12.99 AS Decimal(8, 2)), N'Entree', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (18, N'Beef Stroganoff', N'Tender beef in a creamy mushroom sauce served over egg noodles', CAST(15.99 AS Decimal(8, 2)), N'Entrees', 0)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (19, N'Crab Cakes', N'Two house-made crab cakes served with a side of coleslaw', CAST(18.99 AS Decimal(8, 2)), N'Seafood', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (20, N'Grilled Salmon', N'Fresh salmon fillet served with roasted vegetables', CAST(16.99 AS Decimal(8, 2)), N'Seafood', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (21, N'Shrimp Scampi', N'Jumbo shrimp sauteed in garlic butter and white wine', CAST(16.99 AS Decimal(8, 2)), N'Seafood', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (22, N'Coke', N'Refreshing cola drink', CAST(2.00 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (23, N'Sprite', N'Lemon-lime flavored carbonated beverage', CAST(2.00 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (24, N'Fanta', N'Orange-flavored carbonated beverage', CAST(2.00 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (25, N'Lemonade', N'Sweet and sour lemon-flavored drink', CAST(3.00 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (26, N'Iced Tea', N'Classic tea with ice', CAST(2.50 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (27, N'Coffee', N'Hot brewed coffee', CAST(2.50 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (28, N'Hot Chocolate', N'Hot cocoa drink', CAST(3.00 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (29, N'Orange Juice', N'Freshly squeezed orange juice', CAST(3.50 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (30, N'Apple Juice', N'Freshly squeezed apple juice', CAST(3.50 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (41, N'Ginger Ale', N'Carbonated ginger-flavored drink', CAST(2.50 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (42, N'Virgin Mojito', N'Non-alcoholic version of the classic mojito cocktail', CAST(4.00 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (43, N'Virgin Pina Colada', N'Non-alcoholic version of the classic pina colada cocktail', CAST(4.00 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (44, N'Virgin Margarita', N'Non-alcoholic version of the classic margarita cocktail', CAST(4.00 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (45, N'Shirley Temple', N'Non-alcoholic cocktail made with ginger ale, grenadine, and a maraschino cherry', CAST(4.00 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (46, N'Arnold Palmer', N'Half iced tea and half lemonade', CAST(3.00 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (47, N'Mojito', N'Classic cocktail made with rum, lime, mint, and soda water', CAST(8.00 AS Decimal(8, 2)), N'Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (48, N'Pina Colada', N'Classic cocktail made with rum, coconut cream, and pineapple juice', CAST(8.00 AS Decimal(8, 2)), N'Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (49, N'Margarita', N'Classic cocktail made with tequila, lime, and triple sec', CAST(8.00 AS Decimal(8, 2)), N'Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (50, N'Cosmopolitan', N'Classic cocktail made with vodka, triple sec, cranberry juice, and lime', CAST(9.00 AS Decimal(8, 2)), N'Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (51, N'Mimosa', N'Champagne and orange juice cocktail', CAST(7.00 AS Decimal(8, 2)), N'Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (52, N'Bellini', N'Peach puree and prosecco cocktail', CAST(9.00 AS Decimal(8, 2)), N'Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (53, N'Bloody Mary', N'Vodka and tomato juice cocktail with spices', CAST(9.00 AS Decimal(8, 2)), N'Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (54, N'Lemonade', N'Freshly squeezed lemon juice, sugar, and water.', CAST(2.99 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (55, N'Iced Tea', N'Brewed black tea served over ice with a slice of lemon.', CAST(1.99 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (56, N'Virgin Mary', N'Tomato juice, lemon juice, Worcestershire sauce, hot sauce, and spices.', CAST(3.99 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (57, N'Fruit Punch', N'A refreshing mix of tropical fruit juices.', CAST(4.99 AS Decimal(8, 2)), N'Non-Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (58, N'Margarita', N'Tequila, lime juice, and triple sec served in a salt-rimmed glass.', CAST(7.99 AS Decimal(8, 2)), N'Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (59, N'Martini', N'Gin or vodka and dry vermouth, stirred or shaken with ice.', CAST(8.99 AS Decimal(8, 2)), N'Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (60, N'Cosmopolitan', N'Vodka, triple sec, cranberry juice, and lime juice.', CAST(9.99 AS Decimal(8, 2)), N'Alcoholic', 1)
INSERT [dbo].[MenuItems] ([ID], [Name], [Description], [Price], [Category], [Availability]) VALUES (61, N'Whiskey Sour', N'Bourbon or rye whiskey, lemon juice, and sugar.', CAST(6.99 AS Decimal(8, 2)), N'Alcoholic', 1)
GO
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (1, N'Pepperoni Pizza', 2, CAST(21.98 AS Decimal(8, 2)), CAST(N'2023-02-05' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (2, N'Fried Calamari', 1, CAST(7.99 AS Decimal(8, 2)), CAST(N'2023-02-05' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (3, N'Greek Salad', 2, CAST(17.98 AS Decimal(8, 2)), CAST(N'2023-02-05' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (4, N'Grilled Salmon', 3, CAST(50.97 AS Decimal(8, 2)), CAST(N'2023-02-05' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (5, N'Mozzarella Sticks', 1, CAST(5.99 AS Decimal(8, 2)), CAST(N'2023-02-05' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (6, N'Hawaiian Pizza', 1, CAST(11.99 AS Decimal(8, 2)), CAST(N'2023-02-05' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (7, N'Philly Cheesesteak', 4, CAST(43.96 AS Decimal(8, 2)), CAST(N'2023-02-05' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (8, N'Garlic Bread', 4, CAST(15.96 AS Decimal(8, 2)), CAST(N'2023-02-05' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (9, N'Grilled Chicken Sandwich', 2, CAST(17.98 AS Decimal(8, 2)), CAST(N'2023-02-05' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (10, N'Shrimp Scampi', 2, CAST(33.98 AS Decimal(8, 2)), CAST(N'2023-02-06' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (11, N'Chicken Wings', 2, CAST(17.98 AS Decimal(8, 2)), CAST(N'2023-02-06' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (12, N'Greek Salad', 3, CAST(26.97 AS Decimal(8, 2)), CAST(N'2023-02-06' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (13, N'Pepperoni Pizza', 1, CAST(10.99 AS Decimal(8, 2)), CAST(N'2023-02-06' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (14, N'Cobb Salad', 2, CAST(19.98 AS Decimal(8, 2)), CAST(N'2023-02-06' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (15, N'Mozzarella Sticks', 2, CAST(11.98 AS Decimal(8, 2)), CAST(N'2023-02-06' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (16, N'Hawaiian Pizza', 3, CAST(35.97 AS Decimal(8, 2)), CAST(N'2023-02-06' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (17, N'Caesar Salad', 2, CAST(15.98 AS Decimal(8, 2)), CAST(N'2023-02-06' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (18, N'Meat Lovers Pizza', 2, CAST(25.98 AS Decimal(8, 2)), CAST(N'2023-02-06' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (19, N'Beef Stroganoff', 1, CAST(15.99 AS Decimal(8, 2)), CAST(N'2023-02-07' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (20, N'Mozzarella Sticks', 3, CAST(17.97 AS Decimal(8, 2)), CAST(N'2023-02-07' AS Date))
INSERT [dbo].[Orders] ([ID], [MenuItem], [Quantity], [TotalPrice], [OrderDate]) VALUES (21, N'Spinach Salad', 1, CAST(8.99 AS Decimal(8, 2)), CAST(N'2023-02-07' AS Date))
GO
INSERT [dbo].[Reservations] ([ID], [CustomerName], [PartySize], [DateTime], [SpecialRequests]) VALUES (1, N'John West', 2, CAST(N'2023-02-20' AS Date), N'Window seat preferred')
INSERT [dbo].[Reservations] ([ID], [CustomerName], [PartySize], [DateTime], [SpecialRequests]) VALUES (2, N'Emily Johnson', 4, CAST(N'2023-02-22' AS Date), NULL)
INSERT [dbo].[Reservations] ([ID], [CustomerName], [PartySize], [DateTime], [SpecialRequests]) VALUES (3, N'William Davis', 3, CAST(N'2023-02-24' AS Date), N'Gluten-free menu requested')
INSERT [dbo].[Reservations] ([ID], [CustomerName], [PartySize], [DateTime], [SpecialRequests]) VALUES (4, N'Olivia Wilson', 2, CAST(N'2023-02-25' AS Date), NULL)
INSERT [dbo].[Reservations] ([ID], [CustomerName], [PartySize], [DateTime], [SpecialRequests]) VALUES (5, N'Jacob Lee', 6, CAST(N'2023-02-26' AS Date), N'Birthday celebration')
INSERT [dbo].[Reservations] ([ID], [CustomerName], [PartySize], [DateTime], [SpecialRequests]) VALUES (6, N'Ava Thompson', 2, CAST(N'2023-02-28' AS Date), NULL)
INSERT [dbo].[Reservations] ([ID], [CustomerName], [PartySize], [DateTime], [SpecialRequests]) VALUES (7, N'Ethan Brown', 4, CAST(N'2023-03-01' AS Date), NULL)
INSERT [dbo].[Reservations] ([ID], [CustomerName], [PartySize], [DateTime], [SpecialRequests]) VALUES (8, N'Sophia Davis', 2, CAST(N'2023-03-03' AS Date), NULL)
INSERT [dbo].[Reservations] ([ID], [CustomerName], [PartySize], [DateTime], [SpecialRequests]) VALUES (9, N'Mason Johnson', 5, CAST(N'2023-03-04' AS Date), N'Outdoor seating preferred')
INSERT [dbo].[Reservations] ([ID], [CustomerName], [PartySize], [DateTime], [SpecialRequests]) VALUES (10, N'Isabella Lee', 3, CAST(N'2023-03-06' AS Date), N'Vegetarian menu requested')
GO
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (1, 4, N'Available')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (2, 6, N'Occupied')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (3, 2, N'Reserved')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (4, 8, N'Available')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (5, 4, N'Available')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (6, 2, N'Reserved')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (7, 6, N'Available')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (8, 4, N'Occupied')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (9, 2, N'Available')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (10, 8, N'Occupied')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (11, 3, N'Available')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (12, 4, N'Reserved')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (13, 2, N'Occupied')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (14, 2, N'Available')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (15, 5, N'Available')
INSERT [dbo].[Tables] ([ID], [SeatingCapacity], [Status]) VALUES (16, 7, N'Reserved')
GO
USE [master]
GO
ALTER DATABASE [Proekt] SET  READ_WRITE 
GO
