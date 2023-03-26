using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ProgramR.Data
{
    class TablesData
    {
        public List<Tables> GetAll()
        {
            var tableList = new List<Tables>();
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("SELECT * FROM Tables", connection);
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var table = new Tables(
                            reader.GetInt32(0),
                            reader.GetInt32(1),
                            reader.GetString(2)
                            
                        );

                        tableList.Add(table);
                    }

                }
                connection.Close();
            }

            return tableList;
        }

        public Tables Get(int id)
        {
            Tables table = null;
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("SELECT * FROM Tables WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", id);
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        table = new Tables(
                            reader.GetInt32(0),
                            reader.GetInt32(1),
                            reader.GetString(2)
                        );
                    }
                }

                connection.Close();
            }

            return table;
        }

        public void Add(Tables tableItems)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("INSERT INTO Tables (ID, SeatingCapacity, Status) VALUES(@id,@seatingCapacity, @status)", connection);
                command.Parameters.AddWithValue("id", tableItems.Id);
                command.Parameters.AddWithValue("seatingCapacity", tableItems.SeatingCapacity);
                command.Parameters.AddWithValue("status", tableItems.Status);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        public void Update(Tables tableItems)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("UPDATE Tables SET SeatingCapacity=@seatingCapacity, Status=@status WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", tableItems.Id);
                command.Parameters.AddWithValue("seatingCapacity", tableItems.SeatingCapacity);
                command.Parameters.AddWithValue("status", tableItems.Status);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

        }

        public void Delete(int id)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("DELETE Tables WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", id);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();

            }
        }
    }
}


