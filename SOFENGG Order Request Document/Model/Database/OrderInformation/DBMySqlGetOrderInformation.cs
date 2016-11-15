using System;
using System.Collections.Generic;
using System.Data;

namespace SOFENGG_Order_Request_Document.Model.Database.OrderInformation
{
    public class DBMySqlGetOrderInformation : DBMySqlSelectConnection
    {
        public Order OrderInformation;

        private readonly int _referenceNo;

        public DBMySqlGetOrderInformation(int referenceNo)
        {
            _referenceNo = referenceNo;
        }

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format(
                @"SELECT *
                FROM {0}
                WHERE {1} = @{1}
                ", Order.Table,
                Order.ColReferenceNo);

            Cmd.Parameters.AddWithValue("@" + Order.ColReferenceNo, _referenceNo);
            Cmd.Prepare();
        }

        public override void Parse()
        {
            if (ObjectList == null || ObjectList.Length == 0)
                throw new NoNullAllowedException(string.Format("No order found on referenceNo = '{0}'",
                    _referenceNo));

            // Nullable values
            var dueDate = ObjectList[0][Order.ColDateDue].ToString();
            var newDueDate = ObjectList[0][Order.ColNewDateDue].ToString();
            var dateReleased = ObjectList[0][Order.ColDateReleased].ToString();
            var courierBillNumber = ObjectList[0][Order.ColCourierBillNumber].ToString();

            var orderItemList = GetOrderItemList(_referenceNo);

            OrderInformation = new Order
            {
                ReferenceNo = _referenceNo,
                TransactionDate = DateTime.Parse(ObjectList[0][Order.ColTransactionDate].ToString()),
                DueDate = !string.IsNullOrEmpty(dueDate) ? DateTime.Parse(dueDate) : default(DateTime),
                NewDueDate = !string.IsNullOrEmpty(newDueDate) ? DateTime.Parse(newDueDate) : default(DateTime),
                DateReleased = !string.IsNullOrEmpty(dateReleased) ? DateTime.Parse(dateReleased) : default(DateTime),
                CourierBillNumber = !string.IsNullOrEmpty(courierBillNumber) ? int.Parse(courierBillNumber) : 0,
                OrderItemList = orderItemList,
                Reason = ObjectList[0][Order.ColReason].ToString(),
                Receiver = GetStudentInfo(GetStudentInfoId(orderItemList[0].MailingAddress.Id))
            };
        }

        protected int GetStudentInfoId(int mailingId)
        {
            var db = new DBMySqlGetStudentInfoId(mailingId);
            db.ExecuteQuery();
            return db.StudentInfoId;
        }

        protected StudentInfo GetStudentInfo(int studentInfoId)
        {
            var db = new DBMySqlGetStudentInfo(studentInfoId);
            db.ExecuteQuery();
            return db.StudentInfo;
        }

        protected DBMySqlGetOrderMailingInfo.OrderMailingInfoItem GetOrderMailingInfoItem(int referenceNo)
        {
            var db = new DBMySqlGetOrderMailingInfo(referenceNo);
            db.ExecuteQuery();
            return db.OrderMailingInfo;
        }

        protected MailingInfo GetMailingInfo(int mailingId)
        {
            var db = new DBMySqlGetMailingInfo(mailingId);
            db.ExecuteQuery();
            return db.MailingInfo;
        }

        protected OrderItem[] GetOrderItemList(int referenceNo)
        {
            var orderItemList = new List<OrderItem>();
            var mItem = GetOrderMailingInfoItem(referenceNo);
            MailingInfo mInfo = null;

            for (var i = 0; i < mItem.OrderTypeList.Length; i++)
            {
                if (mInfo == null || mInfo.Id != mItem.MailingInfoIdList[i])
                    mInfo = GetMailingInfo(mItem.MailingInfoIdList[i]);

                var db = new DBMySqlGetOrderItemList(referenceNo, mInfo, mItem.OrderTypeList[i]);
                db.ExecuteQuery();
                orderItemList.AddRange(db.OrderItemList);
            }

            return orderItemList.ToArray();
        }
    }
}