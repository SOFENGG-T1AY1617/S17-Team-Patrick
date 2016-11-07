using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlAddMailingInfo : DBMySqlConnection
    {
        public int StudentId { get; set; } 
        protected MailingInfo MailingInfo;

        public DBMySqlAddMailingInfo(MailingInfo mailingInfo)
        {
            MailingInfo = mailingInfo;
        }

        public override bool ExecuteQuery()
        {
            try
            {
                var query =
                    string.Format("INSERT INTO {0} ({1}, {2}, {3}, {4}, {5}) VALUES (@{1}, @{2}, @{3}, @{4}, @{5});",
                        MailingInfo.Table, MailingInfo.ColIdStudent, MailingInfo.ColMailingAddress, MailingInfo.ColZipCode, MailingInfo.ColDeliveryAreaId, MailingInfo.ColContactNo);
                using (var cmd = new MySqlCommand(query, Conn))
                {
                    cmd.Parameters.AddWithValue("@" + MailingInfo.ColIdStudent, StudentId);
                    cmd.Parameters.AddWithValue("@" + MailingInfo.ColMailingAddress, MailingInfo.MailingAddress);
                    cmd.Parameters.AddWithValue("@" + MailingInfo.ColZipCode, MailingInfo.ZipCode);
                    cmd.Parameters.AddWithValue("@" + MailingInfo.ColDeliveryAreaId, MailingInfo.DeliveryArea.Id);
                    cmd.Parameters.AddWithValue("@" + MailingInfo.ColContactNo, MailingInfo.ContactNo);
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