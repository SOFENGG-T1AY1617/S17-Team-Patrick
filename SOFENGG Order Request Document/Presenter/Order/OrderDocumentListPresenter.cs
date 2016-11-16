using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;
using SOFENGG_Order_Request_Document.View.Order.Interface;

namespace SOFENGG_Order_Request_Document.Presenter.Order
{
    public class OrderDocumentListPresenter
    {
        private readonly IOrderModel _model;
        private readonly IOrderDocumentListView _view;

        public OrderDocumentListPresenter(IOrderDocumentListView view)
        {
            _view = view;
            _model = new OrderModel();
        }

        /*public void GetDocumentList()
        {
            _view.AvailableDocumentList = _model.GetDocumentList();
        }*/

        public void GetCertificateDocumentList()
        {
            _view.CertificateDocumentList = _model.GetCertificateDocumentList();
        }
    }
}