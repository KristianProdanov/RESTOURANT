using System;
using System.Collections.Generic;

namespace ProgramR.Data.Models
{
    public partial class Tables
    {
        public int Id { get; set; }
        public int SeatingCapacity { get; set; }
        public string Status { get; set; }

        public Tables()
        { 
        
        }

        public Tables(int id, int seatingCapacity, string status)
        {
            this.Id = id;
            this.SeatingCapacity = seatingCapacity;
            this.Status = status;
        }
    }
}
