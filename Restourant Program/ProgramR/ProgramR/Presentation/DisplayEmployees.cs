using ProgramR.Business;
using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProgramR.Presentation
{
    class DisplayEmployees
    {
        private int closeOperationId = 6;
        private EmployeesBusiness employeesBusiness = new EmployeesBusiness();
        public DisplayEmployees()
        {
            Input();
        }

        private void ShowMenu()
        {
            Console.WriteLine("    _____                 _                            ");
            Console.WriteLine("   | ____|_ __ ___  _ __ | | ___  _   _  ___  ___  ___ ");
            Console.WriteLine("   |  _| | '_ ` _ \\| '_ \\| |/ _ \\| | | |/ _ \\/ _ \\/ __|");
            Console.WriteLine("   | |___| | | | | | |_) | | (_) | |_| |  __/  __/\\__ \\");
            Console.WriteLine("   |_____|_| |_| |_| .__/|_|\\___/ \\__, |\\___|\\___||___/");
            Console.WriteLine("                   |_|            |___/                ");
            Console.WriteLine("1. List all employees");
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
            employeesBusiness.Delete(id);
            Console.WriteLine("Done.");
        }

        private void Fetch()
        {
            Console.WriteLine("Enter ID to fetch: ");
            int id = int.Parse(Console.ReadLine());
            Employees employ = employeesBusiness.Get(id);
            if (employ != null)
            {
                Console.WriteLine(new string('-', 40));
                Console.WriteLine("ID: " + employ.Id);
                Console.WriteLine("Name: " + employ.Name);
                Console.WriteLine("Title: " + employ.Title);
                Console.WriteLine("Phone: " + employ.Phone);
                Console.WriteLine("Email: " + employ.Email);
                Console.WriteLine("Address: " + employ.Address);
                Console.WriteLine(new string('-', 40));
            }
        }

        private void Update()
        {
            Console.WriteLine("Enter ID to update: ");
            int id = int.Parse(Console.ReadLine());
            Employees employ = employeesBusiness.Get(id);
            if (employ != null)
            {
                Console.WriteLine("Enter an employee: ");
                employ.Name = Console.ReadLine();
                Console.WriteLine("Enter title: ");
                employ.Title= Console.ReadLine();
                Console.WriteLine("Enter phone: (XXX-XXXX) ");
                employ.Phone = Console.ReadLine();
                Console.WriteLine("Enter an email: (example@gmail.com) ");
                employ.Email = Console.ReadLine();
                Console.WriteLine("Enter an address: ");
                employ.Address = Console.ReadLine();
                employeesBusiness.Update(employ);
            }
            else
            {
                Console.WriteLine("Employer not found!");
            }
        }

        private void Add()
        {
            Employees employ = new Employees();
            Console.WriteLine("Enter id: ");
            employ.Id = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter an employee: ");
            employ.Name = Console.ReadLine();
            Console.WriteLine("Enter title: ");
            employ.Title = Console.ReadLine();
            Console.WriteLine("Enter phone: (XXX-XXXX) ");
            employ.Phone = Console.ReadLine();
            Console.WriteLine("Enter an email: (example@gmail.com) ");
            employ.Email = Console.ReadLine();
            Console.WriteLine("Enter an address: ");
            employ.Address = Console.ReadLine();
            employeesBusiness.Add(employ);
        }

        private void ListAll()
        {
            Console.WriteLine("    _____                 _                            ");
            Console.WriteLine("   | ____|_ __ ___  _ __ | | ___  _   _  ___  ___  ___ ");
            Console.WriteLine("   |  _| | '_ ` _ \\| '_ \\| |/ _ \\| | | |/ _ \\/ _ \\/ __|");
            Console.WriteLine("   | |___| | | | | | |_) | | (_) | |_| |  __/  __/\\__ \\");
            Console.WriteLine("   |_____|_| |_| |_| .__/|_|\\___/ \\__, |\\___|\\___||___/");
            Console.WriteLine("                   |_|            |___/                ");
            var employees = employeesBusiness.GetAll();
            foreach (var employ in employees)
            {
                Console.WriteLine("{0} {1} {2} {3} {4} {5} ", employ.Id, employ.Name, employ.Title, employ.Phone, employ.Email, employ.Address);
            }
        }

    }
}

