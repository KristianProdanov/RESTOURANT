using ProgramR.Data;
using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ProgramR.Business
{
    class EmployeesBusiness
    {
        private EmployeesData manager = new EmployeesData();

        public List<Employees> GetAll()
        {
            return manager.GetAll();
        }

        public Employees Get(int id)
        {
            return manager.Get(id);
        }

        public void Add(Employees employ)
        {
            manager.Add(employ);
        }

        public void Update(Employees employ)
        {
            manager.Update(employ);
        }

        public void Delete(int id)
        {
            manager.Delete(id);
        }
    }
}

