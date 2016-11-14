using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;

namespace SOFENGG_Order_Request_Document.View.Admin.Interface
{
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
        OrderItem[][] OrderItemList { set; }
        void GetOrderInformation(int referenceNo);
    }
}