using ProgramR.Data;
using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ProgramR.Business
{
    class OrdersBusiness
    {
        private OrdersData manager = new OrdersData();

        public List<Orders> GetAll()
        {
            return manager.GetAll();
        }

        public Orders Get(int id)
        {
            return manager.Get(id);
        }

        public void Add(Orders order)
        {
            manager.Add(order);
        }

        public void Update(Orders order)
        {
            manager.Update(order);
        }

        public void Delete(int id)
        {
            manager.Delete(id);
        }
    }
}
