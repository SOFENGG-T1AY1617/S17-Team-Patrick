﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class MailingInfo
    {
        public const string Table = "mailinginfo";
        public const string ColStudentInfoId = "studentInfoId";
        public const string ColMailingId = "mailingId";
        public const string ColMailingAddress = "mailingAddress";
        public const string ColZipCode = "zipCode";
        public const string ColDeliveryAreaId = "deliveryAreaId";
        public const string ColContactNo = "contactNo";

        public int StudentInfoId { get; set; }
        public int Id { get; set; }
        public string MailingAddress { get; set; }
        public int ZipCode { get; set; }
        public DeliveryArea DeliveryArea { get; set; }
        public string ContactNo { get; set; }

    }
}