using System.Diagnostics;
using MySql.Data.MySqlClient;
using SOFENGG_Order_Request_Document.Model.Database.Interface;

namespace SOFENGG_Order_Request_Document.Model.Database.Document
{
    public class DBMySqlAddDocument : DBMySqlConnection
    {
        protected Model.Document Document;

        public DBMySqlAddDocument(Model.Document document)
        {
            Document = document;
        }

        public override bool ExecuteQuery()
        {
            try
            {
                var query = string.Format("INSERT INTO {0} ({1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9}) VALUES (@{1}, @{2}, @{3}, @{4}, @{5}, @{6}, @{7}, @{8}, @{9});",
                    Model.Document.Table, Model.Document.ColName, Model.Document.ColCategory, Model.Document.ColWeight, Model.Document.ColRegularPrice, Model.Document.ColExpressPrice, Model.Document.ColMaxCopy, Model.Document.ColIsAvailable, Model.Document.ColForUndergraduate, Model.Document.ColForGraduate);
                using (var cmd = new MySqlCommand(query, Conn))
                {
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColName, Document.Name);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColCategory, (int)Document.Category);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColWeight, Document.Weight);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColRegularPrice, Document.RegularPrice);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColExpressPrice, Document.ExpressPrice);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColMaxCopy, Document.MaxCopy);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColIsAvailable, Document.IsAvailable ? 1 : 0);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColForUndergraduate, Document.IsForUndergraduate ? 1 : 0);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColForGraduate, Document.IsForUndergraduate ? 1 : 0);
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