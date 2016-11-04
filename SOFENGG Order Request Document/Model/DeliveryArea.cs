using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class DeliveryArea
    {
        public const string Table = "deliveryarea";
        public const string ColDeliveryAreaId = "deliveryAreaId";
        public const string ColAreaName = "areaName";
        public const string ColPrice = "price";
        public const string ColDaysToDeliver = "daysToDeliver";

        public int Id { get; set; }
        public string Name { get; set; }
        public string Price { get; set; }
        public string DaysToDeliver { get; set; }

    }
}