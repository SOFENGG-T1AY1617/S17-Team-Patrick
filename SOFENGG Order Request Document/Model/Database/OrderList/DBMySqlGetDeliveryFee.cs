using System;
using System.Data;

namespace SOFENGG_Order_Request_Document.Model.Database.OrderList
{
    public class DBMySqlGetDeliveryFee : DBMySqlSelectConnection
    {
        public float DeliveryFee { get; private set; }

        private readonly int _referenceNo;

        private const string ColDeliveryFee = "fee";

        public DBMySqlGetDeliveryFee(int referenceNo)
        {
            _referenceNo = referenceNo;
            // Connect();
        }

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format(
                @"SELECT {0}, SUM({1}) fee
                FROM
                (SELECT item2.{0}, MIN(item2.{6}) id, item2.{3}, d2.{1}
                FROM ({4} item2 INNER JOIN {5} m2 ON {0} = @{0} AND item2.{6} = m2.{2})
		                INNER JOIN {7} d2 ON m2.{8} = d2.{9}
                GROUP BY item2.{6}, item2.{3}) deliveryFee
                ", OrderItem.ColReferenceNo, DeliveryArea.ColPrice, MailingInfo.ColMailingId, OrderItem.ColOrderType,
                OrderItem.Table, MailingInfo.Table,
                OrderItem.ColMailingId, DeliveryArea.Table, MailingInfo.ColDeliveryAreaId,
                DeliveryArea.ColDeliveryAreaId);

            Cmd.Parameters.AddWithValue("@" + OrderItem.ColReferenceNo, _referenceNo);
            Cmd.Prepare();
        }

        public override void Parse()
        {
            if (ObjectList == null || ObjectList.Length == 0)
                throw new NoNullAllowedException(string.Format("No delivery fee found on referenceNo = '{0}'", _referenceNo));

            DeliveryFee = float.Parse(ObjectList[0][ColDeliveryFee].ToString());
        }
    }
}