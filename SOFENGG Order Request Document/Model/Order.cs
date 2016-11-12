using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class Order
    {
        public int ReferenceNo { get; set; }
        public DateTime TransactionDate { get; set; }
        public DateTime DueDate { get; set; }
        public int CourierBillNumber { get; set; }
        public DateTime DateReleased { get; set; }
        public DateTime NewDueDate { get; set; }
        public string Reason { get; set; }
        public OrderItem[] OrderItemList { get; set; }
        public OrderStatus[] StatusList { get; set; }
    }
}