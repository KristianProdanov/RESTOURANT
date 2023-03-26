using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ProgramR.Data
{
    class OrdersData
    {
        public List<Orders> GetAll()
        {
            var orderList = new List<Orders>();
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("SELECT * FROM Orders", connection);
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var order = new Orders(
                            reader.GetInt32(0),
                            reader.GetString(1),
                            reader.GetInt32(2),
                            reader.GetDecimal(3),
                            reader.GetString(4)
                        );

                        orderList.Add(order);
                    }

                }
                connection.Close();
            }

            return orderList;
        }

        public Orders Get(int id)
        {
            Orders order = null;
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("SELECT * FROM Orders WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", id);
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        order = new Orders(
                            reader.GetInt32(0),
                            reader.GetString(1),
                            reader.GetInt32(2),
                            reader.GetDecimal(3),
                            reader.GetString(4)
                        );
                    }
                }

                connection.Close();
            }

            return order;
        }

        public void Add(Orders orderItems)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("INSERT INTO Orders (ID, MenuItem, Quantity, TotalPrice, OrderDate) VALUES(@id,@menuItem, @quantity, @totalPrice, @orderDate)", connection);
                command.Parameters.AddWithValue("id", orderItems.Id);
                command.Parameters.AddWithValue("menuItem", orderItems.MenuItem);
                command.Parameters.AddWithValue("quantity", orderItems.Quantity);
                command.Parameters.AddWithValue("totalPrice", orderItems.TotalPrice);
                command.Parameters.AddWithValue("orderDate", orderItems.OrderDate);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        public void Update(Orders orderItems)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("UPDATE Orders SET MenuItem=@menuItem, Quantity=@quantity, TotalPrice=@totalPrice, OrderDate=@orderDate WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", orderItems.Id);
                command.Parameters.AddWithValue("menuItem", orderItems.MenuItem);
                command.Parameters.AddWithValue("quantity", orderItems.Quantity);
                command.Parameters.AddWithValue("totalPrice", orderItems.TotalPrice);
                command.Parameters.AddWithValue("orderDate", orderItems.OrderDate);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

        }

        public void Delete(int id)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("DELETE Orders WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", id);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();

            }
        }
    }
}

