using System;
using System.Collections.Generic;

namespace ProgramR.Data.Models
{
    public partial class MenuItems
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public string Category { get; set; }
        public bool Availability { get; set; }

        public MenuItems()
        { 
        
        }

        public MenuItems(int id, string name, string description, decimal price, string category, bool availability)
        {
            this.Id = id;
            this.Name = name;
            this.Description = description;
            this.Price = price;
            this.Category = category;
            this.Availability = availability;
        }
    }
}
