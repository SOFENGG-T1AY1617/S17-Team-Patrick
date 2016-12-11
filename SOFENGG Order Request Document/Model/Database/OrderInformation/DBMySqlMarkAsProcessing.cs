using System;
using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Database.OrderInformation
{
    public class DBMySqlMarkAsProcessing : DBMySqlConnection
    {
        protected int ReferenceNo;

        public DBMySqlMarkAsProcessing(int referenceNo)
        {
            ReferenceNo = referenceNo;
        }

        public override bool ExecuteQuery()
        {
            try
            {
                var query = string.Format("UPDATE {0} SET {1} = NULL, {3} = NULL WHERE {2} = @{2};",
                    Order.Table, Order.ColNewDateDue, Order.ColReferenceNo, Order.ColReason);
                using (var cmd = new MySqlCommand(query, Conn))
                {
                    cmd.Parameters.AddWithValue("@" + Order.ColReferenceNo, ReferenceNo);
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