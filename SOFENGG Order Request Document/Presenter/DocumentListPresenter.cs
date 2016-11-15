using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.View.Order;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Presenter
{
    public class DocumentListPresenter
    {

        private readonly IDocumentListView _view;
        private readonly IOrderModel _model;

        public DocumentListPresenter(IDocumentListView view)
        {
            _view = view;
            _model = new OrderModel();
        }

        public void GetDocumentList()
        {
            _view.AvailableDocumentList = _model.GetDocumentList();
        }


        /*
        public void GetDocumentList()
        {
            view.Available
        }

        */
    }
}