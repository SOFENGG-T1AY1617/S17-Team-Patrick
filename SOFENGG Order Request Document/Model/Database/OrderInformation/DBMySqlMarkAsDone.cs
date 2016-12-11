using System;
using System.Diagnostics;
using MySql.Data.MySqlClient;
using SOFENGG_Order_Request_Document.Model.Helper;

namespace SOFENGG_Order_Request_Document.Model.Database.OrderInformation
{
    public class DBMySqlMarkAsDone : DBMySqlConnection
    {
        protected int ReferenceNo;

        public DBMySqlMarkAsDone(int referenceNo)
        {
            ReferenceNo = referenceNo;
        }

        public override bool ExecuteQuery()
        {
            try
            {
                var query = string.Format("UPDATE {0} SET {1} = NOW() WHERE {2} = @{2};",
                    Order.Table, Order.ColDateReleased, Order.ColReferenceNo);
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