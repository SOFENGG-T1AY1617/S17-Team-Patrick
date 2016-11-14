using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;

namespace SOFENGG_Order_Request_Document.View.Admin.Interface
{
    public class OrderItemGroup
    {
        public OrderItem[] OrderItemList { get; set; }
        public MailingInfo MailingAddress { get; set; }
        public OrderType OrderType { get; set; }
        public DateTime EstimatedDeliveryDate { get; set; }
    }

    public interface IOrderListView
    {
        Model.Order[] OrderList { set; }
        void GetOrderList();

        int ProcessingCount { set; }
        int PendingCount { set; }
        int OnTimeCount { set; }
        int LateCount { set; }
        int TotalCount { set; }

        Model.Order ActiveOrder { set; }
        OrderItemGroup[] OrderItemGroup { set; }
        void GetOrderInformation(int referenceNo);
    }
}