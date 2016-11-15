using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;
using SOFENGG_Order_Request_Document.View.Admin.Interface;

namespace SOFENGG_Order_Request_Document.Presenter.Admin
{
    public class ViewOrderListPresenter
    {
        private readonly IAdminModel _model;
        private readonly IOrderListView _view;

        public ViewOrderListPresenter(IOrderListView view)
        {
            _view = view;
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

        public void GetOrderList()
        {
            var orderList = _model.GetOrderList();

            _view.OrderList = orderList;
            _view.ProcessingCount = GetOrderCount(OrderStatusEnum.Processing, orderList);
            _view.PendingCount = GetOrderCount(OrderStatusEnum.Pending, orderList);
            _view.OnTimeCount = GetOrderCount(OrderStatusEnum.OnTime, orderList);
            _view.LateCount = GetOrderCount(OrderStatusEnum.Late, orderList);
            _view.TotalCount = orderList.Length;
        }

        public void GetOrderInformation(int referenceNo)
        {
            var orderInfo = _model.GetOrderInformation(referenceNo);

            _view.ActiveOrder = orderInfo;

            var orderItemByMailingAndOrderType = new List<OrderItemGroup>();
            List<OrderItem> orderItem = null;

            var mailingId = -1;
            var orderType = default(OrderType);
            OrderItem o = null;
            for (var i = 0; i < orderInfo.OrderItemList.Length; i++)
            {
                o = orderInfo.OrderItemList[i];

                if (o.MailingAddress.Id != mailingId || o.OrderType != orderType)
                {
                    if (orderItem != null)
                        orderItemByMailingAndOrderType.Add(new OrderItemGroup
                        {
                            OrderItemList = orderItem.ToArray(),
                            MailingAddress = o.MailingAddress,
                            OrderType = o.OrderType,
                            EstimatedDeliveryDate = orderInfo.EstimatedDeliveryDate
                        });

                    orderItem = new List<OrderItem>();
                    mailingId = o.MailingAddress.Id;
                    orderType = o.OrderType;
                }

                if (orderItem != null)
                    orderItem.Add(o);
            }

            if (orderItem != null && o != null)
                orderItemByMailingAndOrderType.Add(new OrderItemGroup
                {
                    OrderItemList = orderItem.ToArray(),
                    MailingAddress = o.MailingAddress,
                    OrderType = o.OrderType,
                    EstimatedDeliveryDate = orderInfo.EstimatedDeliveryDate
                });


            _view.OrderItemGroup = orderItemByMailingAndOrderType.ToArray();

        }

        public OrderStatusEnum GetOrderStatus(int referenceNo)
        {
            var o = _model.GetOrderList().FirstOrDefault(i => i.ReferenceNo == referenceNo);

            return o == null ? default(OrderStatusEnum) : o.OrderStatus;
        }
    }
}