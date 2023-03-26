using ProgramR.Data;
using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ProgramR.Business
{
    class ReservationsBusiness
    {
        private ReservationsData manager = new ReservationsData();

        public List<Reservations> GetAll()
        {
            return manager.GetAll();
        }

        public Reservations Get(int id)
        {
            return manager.Get(id);
        }

        public void Add(Reservations reserve)
        {
            manager.Add(reserve);
        }

        public void Update(Reservations reserve)
        {
            manager.Update(reserve);
        }

        public void Delete(int id)
        {
            manager.Delete(id);
        }
    }
}

