using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace CASAInterview
{
    public class Utils
    {
        public static string connectionString = @"Data Source=DESKTOP-UDRQBUG\SQLEXPRESS;Initial Catalog=CASAInterview;Integrated Security=True";

        public static void runSqlStatement(string sqlString)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(sqlString, con);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch
            { }
            con.Close();
        }
    }
}