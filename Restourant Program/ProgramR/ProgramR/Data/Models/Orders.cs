using System;
using System.Collections.Generic;

namespace ProgramR.Data.Models
{
    public partial class Orders
    {
        public int Id { get; set; }
        public string MenuItem { get; set; }
        public int Quantity { get; set; }
        public decimal TotalPrice { get; set; }
        public string OrderDate { get; set; }

        public Orders()
        { 
        
        }

        public Orders(int id, string menuItem, int quantity, decimal totalPrice, string orderDate)
        {
            this.Id = id;
            this.MenuItem = menuItem;
            this.Quantity = quantity;
            this.TotalPrice = totalPrice;
            this.OrderDate = orderDate;
        }
    }
}
