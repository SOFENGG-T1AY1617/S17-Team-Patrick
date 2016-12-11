using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public abstract class DBMySqlConnection : IDBConnection
    {
        protected MySqlConnection Conn;

        protected DBMySqlConnection()
        {
            Connect();
        }

        public void Connect()
        {
            Conn = new MySqlConnection(ConfigurationManager.
                ConnectionStrings["MySqlConnString"].ConnectionString);
            Conn.Open();
        }

        public abstract bool ExecuteQuery();
//        {
//            if (string.IsNullOrEmpty(Query))
//                throw new NullReferenceException("Query not set");
//
//            using (var cmd =
//                new MySqlCommand(Query, Conn))
//            {
//                return cmd.ExecuteNonQuery() > 0;
//            }
//        }

        public void Close()
        {
            if (Conn == null)
                return;

            if (Conn.State == ConnectionState.Closed)
                return;

            Conn.Close();
        }
    }
}