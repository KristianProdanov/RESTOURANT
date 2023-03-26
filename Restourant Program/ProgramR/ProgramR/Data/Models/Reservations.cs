using System;
using System.Collections.Generic;

namespace ProgramR.Data.Models
{
    public partial class Reservations
    {
        private string specialRequests;
        public int Id { get; set; }
        public string CustomerName { get; set; }
        public int PartySize { get; set; }
        public string DateTime { get; set; }
        
        
        public String SpecialRequests {
            set { if (value == null) this.specialRequests = "";
                else this.specialRequests = value;
                  }
            get { return this.specialRequests; }
        }

        public Reservations()
        {

        }

        public Reservations(int id, string customerName, int partySize, string dateTime, string specialRequests)
        {
            this.Id = id;
            this.CustomerName = customerName;
            this.PartySize = partySize;
            this.DateTime = dateTime;
            this.SpecialRequests = specialRequests;
        }
    }
}