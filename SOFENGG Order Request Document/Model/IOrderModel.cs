using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOFENGG_Order_Request_Document.Model
{
    interface IOrderModel
    {
        Document[] GetDocumentList();
    }
}
