using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ProgramR.Data
{
    class ItemsData
    {
        public List<MenuItems> GetAll()
        {
            var productList = new List<MenuItems>();
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("SELECT * FROM MenuItems", connection);
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var product = new MenuItems(
                            reader.GetInt32(0),
                            reader.GetString(1),
                            reader.GetString(2),
                            reader.GetDecimal(3),
                            reader.GetString(4),
                            reader.GetBoolean(5)
                        );

                        productList.Add(product);
                    }

                }
                connection.Close();
            }

            return productList;
        }

        public MenuItems Get(int id)
        {
            MenuItems product = null;
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("SELECT * FROM MenuItems WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", id);
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        product = new MenuItems(
                           reader.GetInt32(0),
                           reader.GetString(1),
                           reader.GetString(2),
                           reader.GetDecimal(3),
                           reader.GetString(4),
                           reader.GetBoolean(5)
                       );
                    }
                }

                connection.Close();
            }

            return product;
        }

        public void Add(MenuItems menuItems)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("INSERT INTO MenuItems (ID, Name, Description, Price, Category, Availability) VALUES(@id,@name, @description, @price, @category, @availability)", connection);
                command.Parameters.AddWithValue("id", menuItems.Id);
                command.Parameters.AddWithValue("name", menuItems.Name);
                command.Parameters.AddWithValue("description", menuItems.Description);
                command.Parameters.AddWithValue("price", menuItems.Price);
                command.Parameters.AddWithValue("category", menuItems.Category);
                command.Parameters.AddWithValue("availability", menuItems.Availability);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        public void Update(MenuItems menuItems)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("UPDATE MenuItems SET Name=@name, Description=@description, Price=@price, Category=@category, Availability=@availability WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", menuItems.Id);
                command.Parameters.AddWithValue("name", menuItems.Name);
                command.Parameters.AddWithValue("description", menuItems.Description);
                command.Parameters.AddWithValue("price", menuItems.Price);
                command.Parameters.AddWithValue("category", menuItems.Category);
                command.Parameters.AddWithValue("availability", menuItems.Availability);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

        }

        public void Delete(int id)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("DELETE MenuItems WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", id);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();

            }
        }
    }
}

