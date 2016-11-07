using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
	public class Order
	{

        public const string Table = "order";
        public const string ColReferenceNo = "referenceNo";
        public const string ColDateDue = "dateDue";
        public const string ColCourierBillNo = "courierBillNo";
        public const string ColDateReleased = "dateReleased";
        public const string ColNewDueDate = "newDueDate";
        public const string ColReason = "reason";
        public const string ColOrderItemList = "orderItemList";
        public const string ColStatusList = "statusList";

        public int ReferenceNo { get; set; }
        public DateTime DateDue { get; set; }
        public int CourierBillNo { get; set; }
        public DateTime DateReleased { get; set; }
        public DateTime NewDueDate { get; set; }
        public string Reason { get; set; }
        public OrderItem[] OrderItemList { get; set; }
        public OrderStatus[] StatusList { get; set;; }



	}
}