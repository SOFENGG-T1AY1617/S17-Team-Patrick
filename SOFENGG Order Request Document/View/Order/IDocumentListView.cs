using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public interface IDocumentListView
    {
        string Document { get; set; }
        string Category { get; set; }
        string RegularPrice { get; set; }
        string ExpressPrice { get; set; }
    }
}
