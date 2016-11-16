using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class OrderItemWithTerm : OrderItem
    {
        public const string ColSpecificationTerm = "specificationTerm";
        public const string ColSpecificationYear = "specificationYear";

        public int SpecificationTerm { get; set; }
        public int SpecificationYear { get; set; }
    }
}