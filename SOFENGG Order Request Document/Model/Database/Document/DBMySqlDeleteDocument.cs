using System.Diagnostics;
using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Database.Document
{
    public class DBMySqlDeleteDocument : DBMySqlConnection
    {
        protected Model.Document Document;

        public DBMySqlDeleteDocument(Model.Document document)
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
                        Model.Document.Table, Model.Document.ColId);
                using (var cmd = new MySqlCommand(query, Conn))
                {
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColId, Document.Id);
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