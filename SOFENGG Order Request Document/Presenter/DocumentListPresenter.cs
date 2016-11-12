using SOFENGG_Order_Request_Document.View.Order;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Presenter
{
    public class DocumentListPresenter
    {
        IDocumentListView view;

        public DocumentListPresenter(IDocumentListView view)
        {
            this.view = view;
        }
        /*
        public void GetDocumentList()
        {
            view.Available
        }

        */
    }
}