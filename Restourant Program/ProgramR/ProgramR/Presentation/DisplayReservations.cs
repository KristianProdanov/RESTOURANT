using ProgramR.Business;
using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace ProgramR.Presentation
{
    class DisplayReservations
    {
        private int closeOperationId = 6;
        private ReservationsBusiness reserveBusiness = new ReservationsBusiness();
        public DisplayReservations()
        {
            Input();
        }

        private void ShowMenu()
        {
            Console.WriteLine("    ____                                _   _                 ");
            Console.WriteLine("   |  _ \\ ___  ___  ___ _ ____   ____ _| |_(_) ___  _ __  ___ ");
            Console.WriteLine("   | |_) / _ \\/ __|/ _ \\ '__\\ \\ / / _` | __| |/ _ \\| '_ \\/ __|");
            Console.WriteLine("   |  _ <  __/\\__ \\  __/ |   \\ V / (_| | |_| | (_) | | | \\__ \\");
            Console.WriteLine("   |_| \\_\\___||___/\\___|_|    \\_/ \\__,_|\\__|_|\\___/|_| |_|___/");
            Console.WriteLine("                                                              ");
            Console.WriteLine("1. List all reservations");
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
            reserveBusiness.Delete(id);
            Console.WriteLine("Done.");
        }

        private void Fetch()
        {
            Console.WriteLine("Enter ID to fetch: ");
            int id = int.Parse(Console.ReadLine());
            Reservations reserve = reserveBusiness.Get(id);
            if (reserve != null)
            {
                Console.WriteLine(new string('-', 40));
                Console.WriteLine("ID: " + reserve.Id);
                Console.WriteLine("CustomerName: " + reserve.CustomerName);
                Console.WriteLine("PartySize: " + reserve.PartySize);
                Console.WriteLine("DateTime: " + reserve.DateTime); 
                Console.WriteLine("SpecialRequests: " + reserve.SpecialRequests);
                Console.WriteLine(new string('-', 40));
            }
        }

        private void Update()
        {
            Console.WriteLine("Enter ID to update: ");
            int id = int.Parse(Console.ReadLine());
            Reservations reserve = reserveBusiness.Get(id);
            if (reserve != null)
            {
                Console.WriteLine("Enter customer name: ");
                reserve.CustomerName = Console.ReadLine();
                Console.WriteLine("Enter party size: ");
                reserve.PartySize = int.Parse(Console.ReadLine());
                Console.WriteLine("Enter date for reservation (YYYY-MM-DD): ");
                string time;
                while (true)
                {
                    time = Console.ReadLine();
                    if (Regex.Match(time, @"(^\d{4}$|^\d{4}-((0?\d)|(1[012]))-(((0?|[12])\d)|3[01])$)").Success) break;
                    Console.WriteLine("Invalid Date!");
                }
                reserve.DateTime = time;
                Console.WriteLine("Enter any special requests: ");
                reserve.SpecialRequests = Console.ReadLine();
                reserveBusiness.Update(reserve);
            }
            else
            {
                Console.WriteLine("Reservation not found!");
            }
        }

        private void Add()
        {
            Reservations reserve = new Reservations();
            Console.WriteLine("Enter customer name: ");
            reserve.CustomerName = Console.ReadLine();
            Console.WriteLine("Enter party size: ");
            reserve.PartySize = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter date for reservation (YYYY-MM-DD: ");
            string time;
            while (true)
            {
                time = Console.ReadLine();
                if (Regex.Match(time, @"(^\d{4}$|^\d{4}-((0?\d)|(1[012]))-(((0?|[12])\d)|3[01])$)").Success) break;
                Console.WriteLine("Invalid Date!");
            }
            reserve.DateTime = time;
            Console.WriteLine("Enter any special requests: ");
            reserve.SpecialRequests = Console.ReadLine();
            reserveBusiness.Add(reserve);
        }

        private void ListAll()
        {
            Console.WriteLine("    ____                                _   _                 ");
            Console.WriteLine("   |  _ \\ ___  ___  ___ _ ____   ____ _| |_(_) ___  _ __  ___ ");
            Console.WriteLine("   | |_) / _ \\/ __|/ _ \\ '__\\ \\ / / _` | __| |/ _ \\| '_ \\/ __|");
            Console.WriteLine("   |  _ <  __/\\__ \\  __/ |   \\ V / (_| | |_| | (_) | | | \\__ \\");
            Console.WriteLine("   |_| \\_\\___||___/\\___|_|    \\_/ \\__,_|\\__|_|\\___/|_| |_|___/");
            Console.WriteLine("                                                              ");
            var reservations = reserveBusiness.GetAll();
            foreach (var reserve in reservations)
            {
                Console.WriteLine("{0} {1} {2} {3} {4} ", reserve.Id, reserve.CustomerName, reserve.PartySize, reserve.DateTime, reserve.SpecialRequests);
            }
        }

    }
}
