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
        public const string Table = "orderitem";
        public const string ColDtsNo = "dtsNo";
        public const string ColReferenceNo = "referenceNo";
        public const string ColDocumentId = "documentId";
        public const string ColMailingId = "mailingId";
        public const string ColNoOfCopies = "noOfCopies";
        public const string ColPackaging = "packaging";
        public const string ColOrderType = "orderType";

        public int DtsNo { get; set; }
        public Document Document { get; set; }
        public MailingInfo MailingAddress { get; set; }
        public int NoOfCopies { get; set; }
        public PackagingEnum Packaging { get; set; }
        public OrderType OrderType { get; set; }

        public float TotalPriceNoDeliveryFee
        {
            get
            {
                return OrderType == OrderType.Regular
                    ? Document.RegularPrice*NoOfCopies
                    : Document.ExpressPrice*NoOfCopies;
            }
        }
    }
}