using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SOFENGG_Order_Request_Document.Model;

namespace SOFENGG_Order_Request_Document.View.Order.Interface
{
    public interface IInfoMailDeView
    {
        int StudentInfoId { get; set; }
        string MailingAddress { get; set; }
        int Zipcode { get; set; }
        int DeliveryAreaId { get; set; }
        string MailingContactNo { get; set; }
    }
}
