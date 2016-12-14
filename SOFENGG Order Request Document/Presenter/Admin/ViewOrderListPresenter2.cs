using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;
using SOFENGG_Order_Request_Document.View.Admin.Interface;

namespace SOFENGG_Order_Request_Document.Presenter.Admin
{
    public class ViewOrderListPresenter2
    {
        private readonly IAdminModel _model;

        public ViewOrderListPresenter2()
        {
            _model = new AdminModel();
        }

        protected int GetOrderCount(OrderStatusEnum status, Model.Order[] orderList)
        {
            var count = 0;
            for (var i = 0; i < orderList.Length; i++)
                if (orderList[i].OrderStatus == status)
                    count++;
            return count;
        }

//        public void GetOrderList()
//        {
//            var orderList = _model.GetOrderList();
//
//            _view.OrderList = orderList;
//            _view.ProcessingCount = GetOrderCount(OrderStatusEnum.Processing, orderList);
//            _view.PendingCount = GetOrderCount(OrderStatusEnum.Pending, orderList);
//            _view.OnTimeCount = GetOrderCount(OrderStatusEnum.OnTime, orderList);
//            _view.LateCount = GetOrderCount(OrderStatusEnum.Late, orderList);
//            _view.TotalCount = orderList.Length;
//        }

        public Model.Order GetOrderInformation(int referenceNo)
        {
            return _model.GetOrderInformation(referenceNo);
        }

//        public OrderStatusEnum GetOrderStatus(int referenceNo)
//        {
//            var o = _model.GetOrderList().FirstOrDefault(i => i.ReferenceNo == referenceNo);
//
//            return o == null ? default(OrderStatusEnum) : o.OrderStatus;
//        }
//
//        public bool MarkAsPending(int referenceNo, string newDueDate, string reason)
//        {
//            return _model.MarkAsPending(referenceNo, DateTime.Parse(newDueDate), reason);
//        }
//
//        public bool MarkAsProcessing(int referenceNo)
//        {
//            return _model.MarkAsProcessing(referenceNo);
//        }
//
//        public bool MarkAsDone(int referenceNo)
//        {
//            return _model.MarkAsDone(referenceNo);
//        }
    }
}