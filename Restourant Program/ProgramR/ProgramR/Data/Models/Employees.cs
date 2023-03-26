using System;
using System.Collections.Generic;

namespace ProgramR.Data.Models
{
    public partial class Employees
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }

        public Employees()
        { 
        
        }

        public Employees(int id, string name, string title, string phone, string email, string address)
        {
            this.Id = id;
            this.Name = name;
            this.Title = title;
            this.Phone = phone;
            this.Email = email;
            this.Address = address;
        }
    }
}
