using System;
using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Database.OrderInformation
{
    public class DBMySqlMarkAsPending : DBMySqlConnection
    {
        protected int ReferenceNo;
        protected DateTime NewDueDate;
        protected string Reason;

        public DBMySqlMarkAsPending(int referenceNo, DateTime newDueDate, string reason)
        {
            ReferenceNo = referenceNo;
            NewDueDate = newDueDate;
            Reason = reason;
        }

        public override bool ExecuteQuery()
        {
            try
            {
                var query = string.Format("UPDATE {0} SET {1} = @{1}, {3} = @{3} WHERE {2} = @{2};",
                    Order.Table, Order.ColNewDateDue, Order.ColReferenceNo, Order.ColReason);
                using (var cmd = new MySqlCommand(query, Conn))
                {
                    cmd.Parameters.AddWithValue("@" + Order.ColNewDateDue, NewDueDate);
                    cmd.Parameters.AddWithValue("@" + Order.ColReferenceNo, ReferenceNo);
                    cmd.Parameters.AddWithValue("@" + Order.ColReason, Reason);
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