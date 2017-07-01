using System;

namespace SOFENGG_Order_Request_Document.Model
{
    public class Transaction
    {
        public enum DeliveryProcessingEnum
        {
            Shipping,
            Pickup,
            Regular
        }

        public const string Table = "transactions";
        public const string ColId = "id";
        public const string ColUserId = "userID";
        public const string ColDateRequested = "dateRequested";
        public const string ColDateDue = "dateDue";
        public const string ColNewDueDate = "newDueDate";
        public const string ColDateReleased = "dateReleased";
        public const string ColReason = "reason";
        public const string ColCourierBillNumber = "courierBillNumber";

        public int Id { get; set; }
        public User User { get; set; }
        public DateTime DateRequested { get; set; }
        public DateTime DateDue { get; set; }
        public DateTime NewDateDue { get; set; }
        public DateTime DateReleased { get; set; }
        public string Reason { get; set; }
        public int CourierBillNumber { get; set; }
        public TransactionLog[] TransactionLogList { get; set; }
    }
}