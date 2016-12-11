using System.Data;

namespace SOFENGG_Order_Request_Document.Model.Database.OrderInformation
{
    public class DBMySqlGetMailingInfo : DBMySqlSelectConnection
    {
        public MailingInfo MailingInfo { get; private set; }

        private readonly int _mailingId;

        public DBMySqlGetMailingInfo(int mailingId)
        {
            _mailingId = mailingId;
        }

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format(
                @"SELECT *
                FROM {0} NATURAL JOIN {1}
                WHERE {2} = @{2}
                ", MailingInfo.Table, DeliveryArea.Table,
                MailingInfo.ColMailingId);

            Cmd.Parameters.AddWithValue("@" + MailingInfo.ColMailingId, _mailingId);
            Cmd.Prepare();
        }

        public override void Parse()
        {
            if (ObjectList == null || ObjectList.Length == 0)
                throw new NoNullAllowedException(string.Format("No mailingInfo found on mailingId = '{0}'",
                    _mailingId));

            var test = int.Parse(ObjectList[0][MailingInfo.ColMailingId].ToString());
            
            MailingInfo = new MailingInfo
            {
                Id = int.Parse(ObjectList[0][MailingInfo.ColMailingId].ToString()),
                MailingAddress = ObjectList[0][MailingInfo.ColMailingAddress].ToString(),
                ZipCode = int.Parse(ObjectList[0][MailingInfo.ColZipCode].ToString()),
                DeliveryArea = new DeliveryArea
                {
                    Id = int.Parse(ObjectList[0][DeliveryArea.ColDeliveryAreaId].ToString()),
                    Name = ObjectList[0][DeliveryArea.ColAreaName].ToString(),
                    MinDaysToDeliver = int.Parse(ObjectList[0][DeliveryArea.ColMinDaysToDeliver].ToString()),
                    MaxDaysToDeliver = int.Parse(ObjectList[0][DeliveryArea.ColMaxDaysToDeliver].ToString()),
                    Price = float.Parse(ObjectList[0][DeliveryArea.ColPrice].ToString())
                },
                ContactNo = ObjectList[0][MailingInfo.ColContactNo].ToString()
            };
        }
    }
}