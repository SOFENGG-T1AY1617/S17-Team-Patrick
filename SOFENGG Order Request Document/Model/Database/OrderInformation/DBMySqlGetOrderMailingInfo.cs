using System;
using System.Data;
using System.Diagnostics;
using SOFENGG_Order_Request_Document.Model.Database.OrderList;

namespace SOFENGG_Order_Request_Document.Model.Database.OrderInformation
{
    public class DBMySqlGetOrderMailingInfo : DBMySqlSelectConnection
    {
        public class OrderMailingInfoItem
        {
            public int[] MailingInfoIdList { get; set; }
            public OrderType[] OrderTypeList { get; protected internal set; }
        }

        public OrderMailingInfoItem OrderMailingInfo { get; private set; }

        private readonly int _referenceNo;

        public DBMySqlGetOrderMailingInfo(int referenceNo)
        {
            _referenceNo = referenceNo;
        }

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format(
                @"SELECT MIN({0}) {0}, {1}
                FROM {2}
                WHERE {3} = @{3}
                GROUP BY {0}, {1}
                ", OrderItem.ColMailingId, OrderItem.ColOrderType,
                OrderItem.Table,
                OrderItem.ColReferenceNo);

            Cmd.Parameters.AddWithValue("@" + OrderItem.ColReferenceNo, _referenceNo);
            Cmd.Prepare();
            Debug.WriteLine(Cmd.CommandText);
        }

        public override void Parse()
        {
            OrderMailingInfo = new OrderMailingInfoItem
            {
                MailingInfoIdList = new int[ObjectList.Length],
                OrderTypeList = new OrderType[ObjectList.Length]
            };


            var m = OrderMailingInfo.MailingInfoIdList;
            var o = OrderMailingInfo.OrderTypeList;

            for (var i = 0; i < ObjectList.Length; i++)
            {
                m[i] = int.Parse(ObjectList[i][OrderItem.ColMailingId].ToString());
                o[i] = (OrderType) int.Parse(ObjectList[i][OrderItem.ColOrderType].ToString());
            }
        }
    }
}