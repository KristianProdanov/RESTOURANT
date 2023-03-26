using ProgramR.Data;
using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ProgramR.Business
{
    class MenuItemsBusiness
    {
        private ItemsData manager = new ItemsData();

        public List<MenuItems> GetAll()
        {
            return manager.GetAll();
        }

        public MenuItems Get(int id)
        {
            return manager.Get(id);
        }

        public void Add(MenuItems menuItem)
        {
            manager.Add(menuItem);
        }

        public void Update(MenuItems menuItem)
        {
            manager.Update(menuItem);
        }

        public void Delete(int id)
        {
            manager.Delete(id);
        }
    }
}
