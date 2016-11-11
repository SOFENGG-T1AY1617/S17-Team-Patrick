using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public enum DeliveryModeEnum
    {
        Pickup = 0,
        Delivery = 1
    }
	public class DeliveryArea
	{
        public int Id { get; set; }
        public string Name { get; set; }
        public DeliveryModeEnum Mode { get; set; }
        public float Price { get; set; }
        public int DaysToDeliver { get; set; }
	}
}