using ProgramR.Business;
using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProgramR.Presentation
{
    class DisplayMenuItems
    {
        private int closeOperationId = 6;
        private MenuItemsBusiness menuBusiness = new MenuItemsBusiness();
        public DisplayMenuItems()
        {
            Input();
        }

        private void ShowMenu()
        {
            Console.WriteLine("    __  __                  ");
            Console.WriteLine("   |  \\/  | ___ _ __  _   _ ");
            Console.WriteLine("   | |\\/| |/ _ \\ '_ \\| | | |");
            Console.WriteLine("   | |  | |  __/ | | | |_| |");
            Console.WriteLine("   |_|  |_|\\___|_| |_|\\__,_|");
            Console.WriteLine("                            ");
            Console.WriteLine("1. List all menu");
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
            menuBusiness.Delete(id);
            Console.WriteLine("Done.");
        }

        private void Fetch()
        {
            Console.WriteLine("Enter ID to fetch: ");
            int id = int.Parse(Console.ReadLine());
            MenuItems menuitems = menuBusiness.Get(id);
            if (menuitems != null)
            {
                Console.WriteLine(new string('-', 40));
                Console.WriteLine("ID: " + menuitems.Id);
                Console.WriteLine("Name: " + menuitems.Name);
                Console.WriteLine("Description: " + menuitems.Description);
                Console.WriteLine("Price: " + menuitems.Price);
                Console.WriteLine("Category: " + menuitems.Category);
                Console.WriteLine("Availability: "+ menuitems.Availability);
                Console.WriteLine(new string('-', 40));
            }
        }

        private void Update()
        {
            Console.WriteLine("Enter ID to update: ");
            int id = int.Parse(Console.ReadLine());
            MenuItems menuitems = menuBusiness.Get(id);
            if (menuitems != null)
            {
                Console.WriteLine("Enter name: ");
                menuitems.Name = Console.ReadLine();
                Console.WriteLine("Enter description: ");
                menuitems.Description = Console.ReadLine();
                Console.WriteLine("Enter price: ");
                menuitems.Price = decimal.Parse(Console.ReadLine());
                Console.WriteLine("Enter category: ");
                menuitems.Category = Console.ReadLine();
                Console.WriteLine("Enter availability: ");
                menuitems.Availability = Boolean.Parse(Console.ReadLine());
                menuBusiness.Update(menuitems);
            }
            else
            {
                Console.WriteLine("Meal not found!");
            }
        }

        private void Add()
        {
            MenuItems menuitems = new MenuItems();
            Console.WriteLine("Enter id: ");
            menuitems.Id = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter name: ");
            menuitems.Name = Console.ReadLine();
            Console.WriteLine("Enter description: ");
            menuitems.Description = Console.ReadLine();
            Console.WriteLine("Enter price: ");
            menuitems.Price = decimal.Parse(Console.ReadLine());
            Console.WriteLine("Enter category: ");
            menuitems.Category = Console.ReadLine();
            Console.WriteLine("Enter availability: ");
            menuitems.Availability = Boolean.Parse(Console.ReadLine());
            menuBusiness.Add(menuitems);
        }

        private void ListAll()
        {
            Console.WriteLine("    __  __                  ");
            Console.WriteLine("   |  \\/  | ___ _ __  _   _ ");
            Console.WriteLine("   | |\\/| |/ _ \\ '_ \\| | | |");
            Console.WriteLine("   | |  | |  __/ | | | |_| |");
            Console.WriteLine("   |_|  |_|\\___|_| |_|\\__,_|");
            Console.WriteLine("                            ");
            var menuitems = menuBusiness.GetAll();
            foreach (var item in menuitems)
            {
                Console.WriteLine("{0} {1} {2} {3} {4} {5} ", item.Id, item.Name, item.Description, item.Price, item.Category, item.Availability);
            }
        }

    }
}