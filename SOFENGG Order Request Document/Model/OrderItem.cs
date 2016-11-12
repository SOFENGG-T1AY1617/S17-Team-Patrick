using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public enum PackagingEnum
    {
        None = 0,
        BrownEnvelope = 1,
        WhiteEnvelope = 2
    }
    public enum OrderType
    {
        Regular = 0,
        Express = 1
    }

    public class OrderItem
    {
        public int DtsNo { get; set; }
        public Document Document { get; set; }
        public MailingInfo MailingAddress { get; set; }
        public int NoOfCopies { get; set; }
        public PackagingEnum Packaging { get; set; }
        public OrderType OrderType { get; set; }
    }
}