using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
	public class MailingInfo
	{
        public int Id { get; set; }
        public string Address { get; set; }
        public int ZipCode { get; set; }
        public DeliveryArea DeliveryArea { get; set; }
        public string ContactNo { get; set; }
    }
}