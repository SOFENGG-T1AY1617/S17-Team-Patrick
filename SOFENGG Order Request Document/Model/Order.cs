using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model.Helper;

namespace SOFENGG_Order_Request_Document.Model
{
    public enum OrderStatusEnum
    {
        [Description("Processing")]
        Processing,
        [Description("Pending")]
        Pending,
        [Description("Late")]
        Late,
        [Description("On Time")]
        OnTime
    }

    public class Order
    {
        private const float NotSetValue = -5;

        public const string Table = "orderlist";
        public const string ColReferenceNo = "referenceNo";
        public const string ColTransactionDate = "transactionDate";
        public const string ColDateDue = "dateDue";
        public const string ColCourierBillNumber = "courierBillNumber";
        public const string ColDateReleased = "dateReleased";
        public const string ColNewDateDue = "newDateDue";
        public const string ColReason = "reason";

        public int ReferenceNo { get; set; }
        public DateTime TransactionDate { get; set; }
        public DateTime DueDate { get; set; }
        public int CourierBillNumber { get; set; }
        public DateTime DateReleased { get; set; }
        public DateTime NewDueDate { get; set; }
        public string Reason { get; set; }
        public OrderItem[] OrderItemList { get; set; }
        public OrderStatus[] StatusList { get; set; }
        public StudentInfo Receiver { get; set; }

        public OrderStatusEnum OrderStatus
        {
            get
            {
                if (DateReleased == default(DateTime))
                    return string.IsNullOrEmpty(Reason) ? OrderStatusEnum.Processing : OrderStatusEnum.Pending;

                if (NewDueDate == default(DateTime))
                {
                    if (DateReleased > DueDate)
                        return OrderStatusEnum.Late;
                }
                else
                {
                    if (DateReleased > NewDueDate)
                        return OrderStatusEnum.Late;
                }
                return OrderStatusEnum.OnTime;
            }
        }

        private float _totalDeliveryFee = NotSetValue;
        private float _totalAmountNoDeliveryFee = NotSetValue;

        public float TotalDeliveryFee
        {
            get
            {
                if (Math.Abs(_totalAmountNoDeliveryFee - NotSetValue) > Math.Abs(NotSetValue))
                    return _totalDeliveryFee;

                var regularTotal = GetTotalDeliveryFee(OrderType.Regular);
                var expressTotal = GetTotalDeliveryFee(OrderType.Express);
                _totalDeliveryFee = regularTotal + expressTotal;

                return _totalDeliveryFee;
            }
            set { _totalDeliveryFee = value; }
        }

        private float GetTotalDeliveryFee(OrderType orderType)
        {
            var total = 0f;
            foreach (var id in OrderItemList.Select(x => x.MailingAddress.Id).Distinct())
            {
                var hasFlagged = false;
                for (var i = 0; i < OrderItemList.Length; i++)
                {
                    if (hasFlagged)
                        break;

                    var item = OrderItemList[i];
                    if (item.MailingAddress.Id != id)
                        continue;

                    if (item.OrderType != orderType)
                        continue;

                    switch (orderType)
                    {
                        case OrderType.Regular:
                            total += item.Document.RegularPrice;
                            break;
                        case OrderType.Express:
                            total += item.Document.ExpressPrice;
                            break;
                        default:
                            throw new ArgumentOutOfRangeException("orderType", orderType, null);
                    }

                    hasFlagged = true;
                }
            }

            return total;
        }

        public float TotalAmountNoDeliveryFee
        {
            get
            {
                if (Math.Abs(_totalAmountNoDeliveryFee - NotSetValue) > Math.Abs(NotSetValue))
                    return _totalAmountNoDeliveryFee;

                var totalAmount = 0f;
                for (var index = 0; index < OrderItemList.Length; index++)
                    totalAmount += OrderItemList[index].TotalPriceNoDeliveryFee;

                _totalAmountNoDeliveryFee = totalAmount;
                return _totalAmountNoDeliveryFee;
            }
            set { _totalAmountNoDeliveryFee = value; }
        }

        public float TotalAmount
        {
            get { return TotalAmountNoDeliveryFee + TotalDeliveryFee; }
        }

        public DateTime EstimatedDeliveryDate
        {
            get
            {
                var maxDate = default(DateTime);
                for (var i = 0; i < OrderItemList.Length; i++)
                    maxDate = maxDate.Max(
                        TransactionDate.Date.AddDays(OrderItemList[i].MailingAddress.DeliveryArea.MaxDaysToDeliver));

                return maxDate;
            }
        }
    }
}