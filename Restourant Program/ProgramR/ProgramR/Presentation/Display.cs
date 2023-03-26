using Figgle;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProgramR.Presentation
{
    class Display
    {
        private int closeOperationId = 6;
        public Display()
        {
            Input();
        }

        private void ShowMenu()
        {
            Console.WriteLine("  ______          _                              _    __   __                              ");
            Console.WriteLine("  | ___ \\        | |                             | |  \\ \\ / /                              ");
            Console.WriteLine("  | |_/ /___  ___| |_ ___  _   _ _ __ __ _ _ __ | |_   \\ V /   _ _ __ ___  _ __ ___  _   _ ");
            Console.WriteLine("  |    // _ \\/ __| __/ _ \\| | | | '__/ _` | '_ \\| __|   \\ / | | | '_ ` _ \\| '_ ` _ \\| | | |");
            Console.WriteLine("  | |\\ \\  __/\\__ \\ || (_) | |_| | | | (_| | | | | |_    | | |_| | | | | | | | | | | | |_| |");
            Console.WriteLine("  \\_| \\_\\___||___/\\__\\___/ \\__,_|_|  \\__,_|_| |_|\\__|   \\_/\\__,_|_| |_| |_|_| |_| |_|\\__, |");
            Console.WriteLine("                                                                                      __/ |");
            Console.WriteLine("                                                                                     |___/ ");
            Console.WriteLine("1. Menu");
            Console.WriteLine("2. Employees");
            Console.WriteLine("3. Orders");
            Console.WriteLine("4. Tables");
            Console.WriteLine("5. Reservations");
            Console.WriteLine("6. Exit");
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
                        Menu();
                        break;
                    case 2:
                        Employees();
                        break;
                    case 3:
                        Orders();
                        break;
                    case 4:
                        Tables();
                        break;
                    case 5:
                        Reservations();
                        break;
                    default:
                        break;
                }
            } while (operation != closeOperationId);
        }

        private void Menu()
        {
            DisplayMenuItems displayMenu = new DisplayMenuItems();
        }

        private void Employees()
        {
            DisplayEmployees displayEmploye = new DisplayEmployees();
        }

        private void Orders()
        {
            DisplayOrders displayOrder = new DisplayOrders();
        }

        private void Tables()
        {
            DisplayTables displayTable = new DisplayTables();
        }

        private void Reservations()
        {
            DisplayReservations displayReserve = new DisplayReservations();
        }

    }
}