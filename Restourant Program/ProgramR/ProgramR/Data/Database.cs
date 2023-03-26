using ProgramR.Data.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ProgramR.Data
{
    public static class Database
    {
        private static string connectionString = "Server=COMP10\\MSSQLSERVERNEW; Database=Proekt; Integrated Security=true";
        public static SqlConnection GetConnection()
        {
            return new SqlConnection(connectionString);
        }
    }
}
