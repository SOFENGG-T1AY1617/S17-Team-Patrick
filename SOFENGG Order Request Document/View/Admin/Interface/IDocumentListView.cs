using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;

namespace SOFENGG_Order_Request_Document.View.Admin.Interface
{
    public interface IDocumentListView
    {
        Document[] AvailableDocumentList { set; }

        void AddDocument();
        void EditDocument();
        void DeleteDocument();
        void GetDocumentList();
    }
}