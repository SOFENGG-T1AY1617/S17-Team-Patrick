using System.Diagnostics;
using MySql.Data.MySqlClient;
using SOFENGG_Order_Request_Document.Model.Helper;

namespace SOFENGG_Order_Request_Document.Model.Database.ManageOperationalDate
{
    public class DBMySqlAddOfflineDate : DBMySqlConnection
    {
        protected Offline Offline;

        public DBMySqlAddOfflineDate(Offline offline)
        {
            Offline = offline;
        }

        public override bool ExecuteQuery()
        {
            try
            {
                var query = string.Format(@"INSERT INTO {0} ({1}, {2}) VALUES (@{1}, @{2})
                                            ON DUPLICATE KEY UPDATE {1} = @{1}",
                    Offline.Table, Offline.ColDate, Offline.ColAddedByPersonelId);
                using (var cmd = new MySqlCommand(query, Conn))
                {
                    cmd.Parameters.AddWithValue("@" + Offline.ColDate, Offline.Date);
                    cmd.Parameters.AddWithValue("@" + Offline.ColAddedByPersonelId, Offline.Personel.Id);
                    cmd.Prepare();

                    Debug.WriteLine(cmd.GetPreparedStatementString());

                    return cmd.ExecuteNonQuery() > 0;
                }
            }
            finally
            {
                Close();
            }
        }
    }
}