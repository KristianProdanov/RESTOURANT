using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using ProgramR.Business;
using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Reflection.Metadata;
using System.Text;
using System.Text.RegularExpressions;

namespace ProgramR.Presentation
{
    class DisplayOrders
    {
        private int closeOperationId = 6;
        private OrdersBusiness ordersBusiness = new OrdersBusiness();
        public DisplayOrders()
        {
            Input();
        }

        private void ShowMenu()
        {
            Console.WriteLine("     ___          _               ");
            Console.WriteLine("    / _ \\ _ __ __| | ___ _ __ ___ ");
            Console.WriteLine("   | | | | '__/ _` |/ _ \\ '__/ __|");
            Console.WriteLine("   | |_| | | | (_| |  __/ |  \\__ \\");
            Console.WriteLine("    \\___/|_|  \\__,_|\\___|_|  |___/ ");
            Console.WriteLine("                                  ");
            Console.WriteLine("1. List all orders");
            Console.WriteLine("2. Add new entry");
            Console.WriteLine("3. Update entry");
            Console.WriteLine("4. Fetch entry by ID");
            Console.WriteLine("5. Delete entry by ID");
            Console.WriteLine("6. Back");
        }

        private void Input()
        {
            var operation = -1;
            do
            {
                ShowMenu();
                operation = int.Parse(Console.ReadLine());
                switch (operation)
                {
                    case 1:
                        ListAll();
                        break;
                    case 2:
                        Add();
                        break;
                    case 3:
                        Update();
                        break;
                    case 4:
                        Fetch();
                        break;
                    case 5:
                        Delete();
                        break;
                    case 6:
                        Back();
                        break;
                    default:
                        break;
                }
            } while (operation != closeOperationId);
        }

        private void Back()
        {
            Display d = new Display();
        }

        private void Delete()
        {
            Console.WriteLine("Enter ID to delete: ");
            int id = int.Parse(Console.ReadLine());
            ordersBusiness.Delete(id);
            Console.WriteLine("Done.");
        }

        private void Fetch()
        {
            Console.WriteLine("Enter ID to fetch: ");
            int id = int.Parse(Console.ReadLine());
            Orders order = ordersBusiness.Get(id);
            if (order != null)
            {
                Console.WriteLine(new string('-', 40));
                Console.WriteLine("ID: " + order.Id);
                Console.WriteLine("MenuItem: " + order.MenuItem);
                Console.WriteLine("Quantity: " + order.Quantity);
                Console.WriteLine("Total Price: " + order.TotalPrice);
                Console.WriteLine("Order Date: " + order.OrderDate);
                Console.WriteLine(new string('-', 40));
            }
        }

        private void Update()
        {
            Console.WriteLine("Enter ID to update: ");
            int id = int.Parse(Console.ReadLine());
            Orders order = ordersBusiness.Get(id);
            if (order != null)
            {
                Console.WriteLine("Enter an item from the menu: ");
                order.MenuItem = Console.ReadLine();
                Console.WriteLine("Enter quantity: ");
                order.Quantity = int.Parse(Console.ReadLine());
                Console.WriteLine("Enter total price: ");
                order.TotalPrice = decimal.Parse(Console.ReadLine());
                Console.WriteLine("Enter order date (YYYY-MM-DD): ");
                string orderDate;
                while (true)
                {
                    orderDate = Console.ReadLine();
                    if (Regex.Match(orderDate, @"(^\d{4}$|^\d{4}-((0?\d)|(1[012]))-(((0?|[12])\d)|3[01])$)").Success) break;
                    Console.WriteLine("Invalid Date!");
                }
                order.OrderDate = orderDate; 
                ordersBusiness.Update(order);
            }
            else
            {
                Console.WriteLine("Order not found!");
            }
        }

        private void Add()
        {
            Orders order = new Orders();
            Console.WriteLine("Enter id: ");
            order.Id = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter an item from the menu: ");
            order.MenuItem = Console.ReadLine();
            Console.WriteLine("Enter quantity: ");
            order.Quantity = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter total price: ");
            order.TotalPrice = decimal.Parse(Console.ReadLine());
            Console.WriteLine("Enter order date (YYYY-MM-DD): ");
            string orderDate;
            while (true)
            {
                orderDate = Console.ReadLine();
                if (Regex.Match(orderDate, @"(^\d{4}$|^\d{4}-((0?\d)|(1[012]))-(((0?|[12])\d)|3[01])$)").Success) break;
                Console.WriteLine("Invalid Date!");
            }
            order.OrderDate = orderDate;
            ordersBusiness.Add(order);
        }

        private void ListAll()
        {
            Console.WriteLine("     ___          _               ");
            Console.WriteLine("    / _ \\ _ __ __| | ___ _ __ ___ ");
            Console.WriteLine("   | | | | '__/ _` |/ _ \\ '__/ __|");
            Console.WriteLine("   | |_| | | | (_| |  __/ |  \\__ \\");
            Console.WriteLine("    \\___/|_|  \\__,_|\\___|_|  |___/ ");
            Console.WriteLine("                                  ");
            var orders = ordersBusiness.GetAll();
            foreach (var order in orders)
            {
                Console.WriteLine("{0} {1} {2} {3} {4} ", order.Id, order.MenuItem, order.Quantity, order.TotalPrice, order.OrderDate);
            }
        }

    }
}
