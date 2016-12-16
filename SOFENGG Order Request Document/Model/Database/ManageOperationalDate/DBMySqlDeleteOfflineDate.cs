using System;
using System.Diagnostics;
using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Database.ManageOperationalDate
{
    public class DBMySqlDeleteOfflineDate : DBMySqlConnection
    {
        protected DateTime Date;

        public DBMySqlDeleteOfflineDate(DateTime date)
        {
            Date = date;
        }

        public override bool ExecuteQuery()
        {
            try
            {
                var query =
                    string.Format(
                        "DELETE FROM {0} WHERE {1}=@{1}",
                        Offline.Table, Offline.ColDate);
                using (var cmd = new MySqlCommand(query, Conn))
                {
                    cmd.Parameters.AddWithValue("@" + Offline.ColDate, string.Format("{0:yyyy-M-d}", Date));
                    cmd.Prepare();

                    var result = cmd.ExecuteNonQuery();
                    return result > 0;
                }
            }
            finally
            {
                Close();
            }
        }
    }
}