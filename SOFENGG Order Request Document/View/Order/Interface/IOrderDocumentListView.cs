using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;

namespace SOFENGG_Order_Request_Document.View.Order.Interface
{
    public interface IOrderDocumentListView
    {
//        int id { get; set; }
//        Document[] AvailableDocumentList { set; }
        
        void GetDocumentList();
        
    }
}