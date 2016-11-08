using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class OrderItemWithTerm : OrderItem
    {
        public int SpecificationTerm { get; set; }
        public int SpecificationYear { get; set; }
    }
}