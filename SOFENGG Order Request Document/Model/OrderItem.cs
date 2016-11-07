using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
	public class OrderItem
	{
        public const string Table = "orderItem";
        public const string ColDtsNo = "dtsNo";
        public const string ColDocument = "document";
        public const string ColMailingInfo = "mailingInfo";
        public const string ColNoOfCopies = "noOfCopies";

        public int DtsNo { get; set; }
        public Document Document { get; set; }
        public MailingInfo MailingInfo { get; set; }
        public int NoOfCopies { get; set; }
	}
}