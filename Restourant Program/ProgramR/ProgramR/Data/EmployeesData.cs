using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ProgramR.Data
{
    class EmployeesData
    {
        public List<Employees> GetAll()
        {
            var employList = new List<Employees>();
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("SELECT * FROM Employees", connection);
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var employ = new Employees(
                            reader.GetInt32(0),
                            reader.GetString(1),
                            reader.GetString(2),
                            reader.GetString(3),
                            reader.GetString(4),
                            reader.GetString(5)
                        );

                        employList.Add(employ);
                    }

                }
                connection.Close();
            }

            return employList;
        }

        public Employees Get(int id)
        {
            Employees employ = null;
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("SELECT * FROM Employees WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", id);
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        employ = new Employees(
                           reader.GetInt32(0),
                            reader.GetString(1),
                            reader.GetString(2),
                            reader.GetString(3),
                            reader.GetString(4),
                            reader.GetString(5)
                       );
                    }
                }

                connection.Close();
            }

            return employ;
        }

        public void Add(Employees employ)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("INSERT INTO Employees (ID, Name, Title, Phone, Email, Address) VALUES(@id,@name, @title, @phone, @email, @address)", connection);
                command.Parameters.AddWithValue("id", employ.Id);
                command.Parameters.AddWithValue("name", employ.Name);
                command.Parameters.AddWithValue("title", employ.Title);
                command.Parameters.AddWithValue("phone", employ.Phone);
                command.Parameters.AddWithValue("email", employ.Email);
                command.Parameters.AddWithValue("address", employ.Address);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        public void Update(Employees employ)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("UPDATE Employees SET Name=@name, Title=@title, Phone=@phone, Email=@email, Address=@address WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", employ.Id);
                command.Parameters.AddWithValue("name", employ.Name);
                command.Parameters.AddWithValue("title", employ.Title);
                command.Parameters.AddWithValue("phone", employ.Phone);
                command.Parameters.AddWithValue("email", employ.Email);
                command.Parameters.AddWithValue("address", employ.Address);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

        }

        public void Delete(int id)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("DELETE Employees WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", id);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();

            }
        }
    }
}