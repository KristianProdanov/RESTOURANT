using ProgramR.Data;
using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ProgramR.Business
{
    class TablesBusiness
    {
        private TablesData manager = new TablesData();

        public List<Tables> GetAll()
        {
            return manager.GetAll();
        }

        public Tables Get(int id)
        {
            return manager.Get(id);
        }

        public void Add(Tables table)
        {
            manager.Add(table);
        }

        public void Update(Tables table)
        {
            manager.Update(table);
        }

        public void Delete(int id)
        {
            manager.Delete(id);
        }
    }
}
