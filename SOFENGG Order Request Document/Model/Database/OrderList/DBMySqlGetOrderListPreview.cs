using System;
using System.Data;
using System.Diagnostics;

namespace SOFENGG_Order_Request_Document.Model.Database.OrderList
{
    public class DBMySqlGetOrderListPreview : DBMySqlSelectConnection
    {
        public Order[] OrderList { get; private set; }
        private const string ColTotalAmountNoDelivery = "totalAmountNoDeliveryFee";

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format(
                @"SELECT o.{0}, {1}, {2}, {3}, {24}, {23}, {4}, {5}, {6}, SUM({7} * IF({8} = 0, {9}, IF ({8} = 1, {10}, NULL))) totalAmountNoDeliveryFee
                FROM (((({11} o INNER JOIN {12} item ON o.{0} = item.{13})
		                INNER JOIN {14} d ON d.{15} = item.{16})
		                INNER JOIN {17} m ON m.{18} = item.{19})
                        INNER JOIN {20} s ON s.{21} = m.{22})
                GROUP BY o.{0}
                ORDER BY {1} DESC
                ", Order.ColReferenceNo, Order.ColTransactionDate, Order.ColDateDue, Order.ColNewDateDue,
                StudentInfo.ColFirstName, StudentInfo.ColMiddleName, StudentInfo.ColLastName, OrderItem.ColNoOfCopies,
                OrderItem.ColOrderType, Document.ColRegularPrice, Document.ColExpressPrice,
                Order.Table, OrderItem.Table, OrderItem.ColReferenceNo,
                Document.Table, Document.ColId, OrderItem.ColDocumentId,
                MailingInfo.Table, MailingInfo.ColMailingId, OrderItem.ColMailingId,
                StudentInfo.Table, StudentInfo.ColStudentInfoId, MailingInfo.ColStudentInfoId, Order.ColDateReleased, Order.ColReason);

//            Cmd.Parameters.AddWithValue("@name", "banana");
            Cmd.Prepare();
            Debug.WriteLine(Cmd.CommandText);
        }

        public override void Parse()
        {
            OrderList = new Order[ObjectList.Length];

            for (var i = 0; i < OrderList.Length; i++)
            {
                // Nullable values
                var dueDate = ObjectList[i][Order.ColDateDue].ToString();
                var newDueDate = ObjectList[i][Order.ColNewDateDue].ToString();
                var dateReleased = ObjectList[i][Order.ColDateReleased].ToString();

                OrderList[i] = new Order
                {
                    ReferenceNo = int.Parse(ObjectList[i][Order.ColReferenceNo].ToString()),
                    TransactionDate = DateTime.Parse(ObjectList[i][Order.ColTransactionDate].ToString()),
                    DueDate = !string.IsNullOrEmpty(dueDate) ? DateTime.Parse(dueDate) : default(DateTime),
                    NewDueDate = !string.IsNullOrEmpty(newDueDate) ? DateTime.Parse(newDueDate) : default(DateTime),
                    DateReleased = !string.IsNullOrEmpty(dateReleased) ? DateTime.Parse(dateReleased) : default(DateTime),
                    TotalAmountNoDeliveryFee = float.Parse(ObjectList[i][ColTotalAmountNoDelivery].ToString()),
                    Receiver = new StudentInfo
                    {
                        FirstName = ObjectList[i][StudentInfo.ColFirstName].ToString(),
                        MiddleName = ObjectList[i][StudentInfo.ColMiddleName].ToString(),
                        LastName = ObjectList[i][StudentInfo.ColLastName].ToString(),
                    },
                    Reason = ObjectList[i][Order.ColReason].ToString()
                };

                // Delivery Fee
                var dbDeliveryFee = new DBMySqlGetDeliveryFee(OrderList[i].ReferenceNo);
                if (!dbDeliveryFee.ExecuteQuery())
                    throw new NoNullAllowedException(string.Format("No delivery fee found on referenceNo = '{0}'",
                        OrderList[i].ReferenceNo));
                OrderList[i].TotalDeliveryFee = dbDeliveryFee.DeliveryFee;

                // Status Count
                var dbStatusCount = new DBMySqlGetOrderStatusCount(OrderList[i].ReferenceNo);
                if (!dbStatusCount.ExecuteQuery())
                    throw new NoNullAllowedException(string.Format("No status count found on referenceNo = '{0}'",
                        OrderList[i].ReferenceNo));

                OrderList[i].StatusList = dbStatusCount.OrderStatusCount > 0 ? new OrderStatus[dbStatusCount.OrderStatusCount] : null;
            }
        }
    }
}