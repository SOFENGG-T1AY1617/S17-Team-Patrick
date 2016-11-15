using SOFENGG_Order_Request_Document.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public interface IDocumentListView
    {
        Document[] AvailableDocumentList { set; }

        void GetDocumentList();
    }
}
