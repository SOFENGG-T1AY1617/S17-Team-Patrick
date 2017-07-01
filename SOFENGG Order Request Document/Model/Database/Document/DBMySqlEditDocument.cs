using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Database.Document
{
    public class DBMySqlEditDocument: DBMySqlConnection
    {
        
        protected Model.Document Document;

        public DBMySqlEditDocument(Model.Document document)
        {
            Document = document;
        }

        public override bool ExecuteQuery()
        {
            try
            {
                var query = string.Format("UPDATE {0} SET {1}=@{1}, {2}=@{2}, {3}=@{3}, {4}=@{4}, {5}=@{5}, {6}=@{6}, {7}=@{7}, {8}=@{8}, {9}=@{9} WHERE {10}=@{10}",
                    Model.Document.Table, Model.Document.ColName, Model.Document.ColCategory, Model.Document.ColWeight, Model.Document.ColRegularPrice, Model.Document.ColExpressPrice, Model.Document.ColMaxCopy, Model.Document.ColIsAvailable, Model.Document.ColForUndergraduate, Model.Document.ColForGraduate, Model.Document.ColId);
                using (var cmd = new MySqlCommand(query, Conn))
                {
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColId, Document.Id);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColName, Document.Name);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColCategory, (int)Document.Category);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColWeight, Document.Weight);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColRegularPrice, Document.RegularPrice);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColExpressPrice, Document.ExpressPrice);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColMaxCopy, Document.MaxCopy);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColIsAvailable, Document.IsAvailable ? 1 : 0);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColForUndergraduate, Document.IsForUndergraduate ? 1 : 0);
                    cmd.Parameters.AddWithValue("@" + Model.Document.ColForGraduate, Document.IsForGraduate ? 1 : 0);

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