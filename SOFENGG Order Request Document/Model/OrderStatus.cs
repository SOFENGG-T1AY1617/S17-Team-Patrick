using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
	public class OrderStatus
    {
        public const string Table = "orderstatus";
        public const string ColId = "orderStatusId";
        public const string ColReferenceNo = "referenceNo";
        public const string ColDateLogged = "dateLogged";
        public const string ColPersonelInCharge = "personelInCharge";
        public const string ColRemarks = "remarks";

        public Personel PersonelInCharge { get; set; }
        public DateTime DateLogged { get; set; }
        public string Remarks { get; set; }
    }
}