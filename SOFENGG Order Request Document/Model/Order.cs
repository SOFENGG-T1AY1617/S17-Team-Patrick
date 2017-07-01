using System;

namespace SOFENGG_Order_Request_Document.Model
{
    public class Order
    {
        public enum PackagingEnum
        {
            None = 0,
            BrownEnvelope = 1,
            WhiteEnvelope = 2
        }

        public enum OrderTypeEnum
        {
            Regular = 'R',
            Express = 'E'
        }

        public const string Table = "orders";
        public const string ColId = "id";
        public const string ColTransactionId = "transactionID";
        public const string ColDocuId = "docuID";
        public const string ColMailingId = "mailingID";
        public const string ColType = "type";
        public const string ColPackaging = "packaging";
        public const string ColQuantity = "quantity";
        public const string ColTerm = "term";
        public const string ColSy = "sy";

        public int Id { get; set; }
        public Transaction Transaction { get; set; }
        public Document Document { get; set; }
        public MailingAddress MailingAddress { get; set; }
        public OrderTypeEnum Type { get; set; }
        public PackagingEnum Packaging { get; set; }
        public int Quantity { get; set; }
        public int Term { get; set; }
        public int SY { get; set; }
    }
}