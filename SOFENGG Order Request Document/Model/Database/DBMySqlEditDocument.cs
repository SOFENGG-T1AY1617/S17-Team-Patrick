using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlEditDocument: DBMySqlConnection
    {
        
        protected Document Document;

        public DBMySqlEditDocument(Document document)
        {
            Document = document;
        }

        public override bool ExecuteQuery()
        {
            try
            {
                var query = string.Format("UPDATE {0} SET {1}=@{1}, {2}=@{2}, {3}=@{3}, {4}=@{4}, {5}=@{5}, {6}=@{6}, {7}=@{7}, {8}=@{8}, {9}=@{9} WHERE {10}=@{10}",
                    Document.Table, Document.ColName, Document.ColCategory, Document.ColWeight, Document.ColRegularPrice, Document.ColExpressPrice, Document.ColMaxCopy, Document.ColIsAvailable, Document.ColForUndergraduate, Document.ColForGraduate, Document.ColId);
                using (var cmd = new MySqlCommand(query, Conn))
                {
                    cmd.Parameters.AddWithValue("@" + Document.ColId, Document.Id);
                    cmd.Parameters.AddWithValue("@" + Document.ColName, Document.Name);
                    cmd.Parameters.AddWithValue("@" + Document.ColCategory, (int)Document.Category);
                    cmd.Parameters.AddWithValue("@" + Document.ColWeight, Document.Weight);
                    cmd.Parameters.AddWithValue("@" + Document.ColRegularPrice, Document.RegularPrice);
                    cmd.Parameters.AddWithValue("@" + Document.ColExpressPrice, Document.ExpressPrice);
                    cmd.Parameters.AddWithValue("@" + Document.ColMaxCopy, Document.MaxCopy);
                    cmd.Parameters.AddWithValue("@" + Document.ColIsAvailable, Document.IsAvailable ? 1 : 0);
                    cmd.Parameters.AddWithValue("@" + Document.ColForUndergraduate, Document.IsForUndergraduate ? 1 : 0);
                    cmd.Parameters.AddWithValue("@" + Document.ColForGraduate, Document.IsForGraduate ? 1 : 0);

                    cmd.Prepare();

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