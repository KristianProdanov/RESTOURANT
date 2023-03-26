using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ProgramR.Data
{
    class ReservationsData
    {
        public List<Reservations> GetAll()
        {
            var reserveList = new List<Reservations>();
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("SELECT * FROM Reservations", connection);
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        try
                        {
                            var reserve = new Reservations(
                                reader.GetInt32(0),
                                reader.GetString(1),
                                reader.GetInt32(2),
                                reader.GetString(3),
                                reader.GetString(4)
                            );

                            reserveList.Add(reserve);
                        }
                        catch
                        {
                            var reserve = new Reservations(
                               reader.GetInt32(0),
                               reader.GetString(1),
                               reader.GetInt32(2),
                               reader.GetString(3),
                               "none"
                           );

                            reserveList.Add(reserve);
                        }
                    }
                    

                }
                connection.Close();
            }

            return reserveList;
        }

        public Reservations Get(int id)
        {
            Reservations reserve = null;
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("SELECT * FROM Reservations WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", id);
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        reserve = new Reservations(
                           reader.GetInt32(0),
                           reader.GetString(1),
                           reader.GetInt32(2),
                           reader.GetString(3),
                           reader.GetString(4)
                       );
                    }
                }

                connection.Close();
            }

            return reserve;
        }

        public void Add(Reservations reserve)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("INSERT INTO Reservations (ID, CustomerName, PartySize, DateTime, SpecialRequests) VALUES(@id,@customerName, @partySize, @dateTime, @specialRequests)", connection);
                command.Parameters.AddWithValue("id", reserve.Id);
                command.Parameters.AddWithValue("customerName", reserve.CustomerName);
                command.Parameters.AddWithValue("partySize", reserve.PartySize);
                command.Parameters.AddWithValue("dateTime", reserve.DateTime);
                command.Parameters.AddWithValue("specialRequests", reserve.SpecialRequests);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        public void Update(Reservations reserve)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("UPDATE Reservations SET CustomerName=@customerName, PartySize=@partySize, DateTime=@dateTime, SpecialRequests=@specialRequests WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", reserve.Id);
                command.Parameters.AddWithValue("customerName", reserve.CustomerName);
                command.Parameters.AddWithValue("partySize", reserve.PartySize);
                command.Parameters.AddWithValue("dateTime", reserve.DateTime);
                command.Parameters.AddWithValue("specialRequests", reserve.SpecialRequests);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

        }

        public void Delete(int id)
        {
            using (var connection = Database.GetConnection())
            {
                var command = new SqlCommand("DELETE Reservations WHERE Id=@id", connection);
                command.Parameters.AddWithValue("id", id);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();

            }
        }
    }
}
