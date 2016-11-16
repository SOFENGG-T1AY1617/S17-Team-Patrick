using System;
using System.Data;
using System.Diagnostics;

namespace SOFENGG_Order_Request_Document.Model.Database.OrderList
{
    public class DBMySqlGetOrderStatusCount : DBMySqlSelectConnection
    {
        public int OrderStatusCount { get; private set; }
        private readonly int _referenceNo;
        private const string ColStatusCount = "statusCount";

        public DBMySqlGetOrderStatusCount(int referenceNo)
        {
            _referenceNo = referenceNo;
        }

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format(
                @"SELECT COUNT(*) statusCount
                    FROM {0}
                    WHERE {1} = @{1}
                ", OrderStatus.Table, OrderStatus.ColReferenceNo);

            Cmd.Parameters.AddWithValue("@" + OrderStatus.ColReferenceNo, _referenceNo);
            Cmd.Prepare();
        }

        public override void Parse()
        {
            if (ObjectList == null || ObjectList.Length == 0)
                throw new NoNullAllowedException(string.Format("No status count found on referenceNo = '{0}'", _referenceNo));

            OrderStatusCount = int.Parse(ObjectList[0][ColStatusCount].ToString());
        }
    }
}