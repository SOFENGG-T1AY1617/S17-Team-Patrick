using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using SOFENGG_Order_Request_Document.Model.Helper;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlAddDocument : DBMySqlConnection
    {
        protected Document Document;

        public DBMySqlAddDocument(Document document)
        {
            Document = document;
        }

        public override bool ExecuteQuery()
        {
            try
            {
                var query = string.Format("INSERT INTO {0} ({1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9}) VALUES (@{1}, @{2}, @{3}, @{4}, @{5}, @{6}, @{7}, @{8}, @{9});",
                    Document.Table, Document.ColName, Document.ColCategory, Document.ColWeight, Document.ColRegularPrice, Document.ColExpressPrice, Document.ColMaxCopy, Document.ColIsAvailable, Document.ColForUndergraduate, Document.ColForGraduate);
                using (var cmd = new MySqlCommand(query, Conn))
                {
                    cmd.Parameters.AddWithValue("@" + Document.ColName, Document.Name);
                    cmd.Parameters.AddWithValue("@" + Document.ColCategory, (int)Document.Category);
                    cmd.Parameters.AddWithValue("@" + Document.ColWeight, Document.Weight);
                    cmd.Parameters.AddWithValue("@" + Document.ColRegularPrice, Document.RegularPrice);
                    cmd.Parameters.AddWithValue("@" + Document.ColExpressPrice, Document.ExpressPrice);
                    cmd.Parameters.AddWithValue("@" + Document.ColMaxCopy, Document.MaxCopy);
                    cmd.Parameters.AddWithValue("@" + Document.ColIsAvailable, Document.IsAvailable ? 1 : 0);
                    cmd.Parameters.AddWithValue("@" + Document.ColForUndergraduate, Document.IsForUndergraduate ? 1 : 0);
                    cmd.Parameters.AddWithValue("@" + Document.ColForGraduate, Document.IsForUndergraduate ? 1 : 0);
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