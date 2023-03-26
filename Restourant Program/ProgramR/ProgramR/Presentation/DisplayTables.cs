using ProgramR.Business;
using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProgramR.Presentation
{
    class DisplayTables
    {
        private int closeOperationId = 6;
        private TablesBusiness tableBusiness = new TablesBusiness();
        public DisplayTables()
        {
            Input();
        }

        private void ShowMenu()
        {
            Console.WriteLine("    _____     _     _           ");
            Console.WriteLine("   |_   _|_ _| |__ | | ___  ___ ");
            Console.WriteLine("     | |/ _` | '_ \\| |/ _ \\/ __|");
            Console.WriteLine("     | | (_| | |_) | |  __/\\__ \\");
            Console.WriteLine("     |_|\\__,_|_.__/|_|\\___||___/");
            Console.WriteLine("                                ");
            Console.WriteLine("1. List all tables");
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
            tableBusiness.Delete(id);
            Console.WriteLine("Done.");
        }

        private void Fetch()
        {
            Console.WriteLine("Enter ID to fetch: ");
            int id = int.Parse(Console.ReadLine());
            Tables table = tableBusiness.Get(id);
            if (table != null)
            {
                Console.WriteLine(new string('-', 40));
                Console.WriteLine("ID: " + table.Id);
                Console.WriteLine("SeatingCapacity: " + table.SeatingCapacity);
                Console.WriteLine("Status: " + table.Status);
                Console.WriteLine(new string('-', 40));
            }
        }

        private void Update()
        {
            Console.WriteLine("Enter ID to update: ");
            int id = int.Parse(Console.ReadLine());
            Tables table = tableBusiness.Get(id);
            if (table != null)
            {
                Console.WriteLine("Enter seats: ");
                table.SeatingCapacity = int.Parse(Console.ReadLine());
                Console.WriteLine("Enter status: ");
                table.Status = Console.ReadLine();
            }
            else
            {
                Console.WriteLine("Table not found!");
            }
        }

        private void Add()
        {
            Tables table = new Tables();
            Console.WriteLine("Enter id: ");
            table.Id = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter seats: ");
            table.SeatingCapacity = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter status: ");
            table.Status = Console.ReadLine();
            tableBusiness.Add(table);
        }

        private void ListAll()
        {
            Console.WriteLine("    _____     _     _           ");
            Console.WriteLine("   |_   _|_ _| |__ | | ___  ___ ");
            Console.WriteLine("     | |/ _` | '_ \\| |/ _ \\/ __|");
            Console.WriteLine("     | | (_| | |_) | |  __/\\__ \\");
            Console.WriteLine("     |_|\\__,_|_.__/|_|\\___||___/");
            Console.WriteLine("                                ");
            var tables = tableBusiness.GetAll();
            foreach (var table in tables)
            {
                Console.WriteLine("{0} {1} {2} ", table.Id, table.SeatingCapacity, table.Status);
            }
        }

    }
}
