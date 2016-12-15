using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlDeleteDocument : DBMySqlConnection
    {
        protected Document Document;

        public DBMySqlDeleteDocument(Document document)
        {
            Document = document;
        }

        public override bool ExecuteQuery()
        {
            try
            {
                var query =
                    string.Format(
                        "DELETE FROM {0} WHERE {1}=@{1}",
                        Document.Table, Document.ColId);
                using (var cmd = new MySqlCommand(query, Conn))
                {
                    cmd.Parameters.AddWithValue("@" + Document.ColId, Document.Id);
                    cmd.Prepare();

                    var result = cmd.ExecuteNonQuery();
                    Debug.WriteLine(result);
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