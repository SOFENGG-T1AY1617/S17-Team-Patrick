using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class OrderStatus
    {
        public Personel PersonelInCharge { get; set; }
        public DateTime DateLogged { get; set; }
        public string Remarks { get; set; }
    }
}